
using BigRiverQTLPlots
using BulkLMM, Helium
using Plots

##############
# BXD spleen #
##############

########
# Data #
########
bulklmmdir = dirname(pathof(BulkLMM));

gmap_file = joinpath(bulklmmdir, "..", "data", "bxdData", "gmap.csv");
gInfo = BulkLMM.CSV.read(gmap_file, BulkLMM.DataFrames.DataFrame);
idx_geno = findall(occursin.(gInfo.Chr, "1 2"));
gInfo_subset = gInfo[idx_geno, :];

phenocovar_file = joinpath(bulklmmdir, "..", "data", "bxdData", "phenocovar.csv");
pInfo = BulkLMM.CSV.read(phenocovar_file, BulkLMM.DataFrames.DataFrame);
idx_pheno = findall(occursin.(pInfo.Chr, "1 2"));
pInfo_subset = pInfo[idx_pheno, :];

pheno_file = joinpath(bulklmmdir, "..", "data", "bxdData", "spleen-pheno-nomissing.csv");
pheno = BulkLMM.DelimitedFiles.readdlm(pheno_file, ',', header = false);
pheno_processed = pheno[2:end, 2:(end-1)] .* 1.0; # exclude the header, the first (transcript ID)and the last columns (sex)
pheno_processed_subset = pheno_processed[:, idx_pheno];

geno_file = joinpath(bulklmmdir, "..", "data", "bxdData", "spleen-bxd-genoprob.csv")
geno = BulkLMM.DelimitedFiles.readdlm(geno_file, ',', header = false);
geno_processed = geno[2:end, 1:2:end] .* 1.0;
geno_processed_subset = geno_processed[:, idx_geno];


###########
# Kinship #
###########
kinship_subset = calcKinship(geno_processed_subset);

########
# Scan #
########
results_path = joinpath(@__DIR__, "..", "test", "data", "multipletraits_results.he")
if isfile(results_path)
	multipletraits_results = Helium.readhe(results_path)
else
	multipletraits_results, heritability_results = bulkscan_null(
		pheno_processed_subset,
		geno_processed_subset,
		kinship_subset,
	)
	Helium.writehe(multipletraits_results, results_path)
end

########
# Plot #
########
plot_eQTL(multipletraits_results, pInfo_subset, gInfo_subset; threshold = 5.0);
savefig(joinpath(@__DIR__, "..", "images", "eQTL_example.png"))
