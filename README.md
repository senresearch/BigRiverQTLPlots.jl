# BigRiverPlots.jl

`BigRiverPlots.jl` is a versatile plotting package built in the Julia programming language. The package consists of specific plotting recipes, designed to streamline data visualization and enhance the process of statistical analysis in genetic studies. It's particularly suited for QTL (Quantitative Trait Loci) and eQTL (expression Quantitative Trait Loci) analyses, providing key features for clear and intuitive data representation.

## Features
Here are the main functions provided by BigRiverPlots.jl:

- `plotQTL()`: This function generates plots for LOD (logarithm of odds) scores with respect to marker positions. It's useful in viewing one genome scan result, or even multiple genome scan results, on a single plot. This helps to provide a broad overview of the QTL landscape.

- `ploteQTL()`: This function is specifically designed to plot eQTL analysis results, assisting in visualization of genetic associations with gene expression levels.

- `confplot()`: This function is designed to create vertical confidence plots. These plots provide an insightful representation of statistical certainty or variability in the data.

## Installation
To install `BigRiverPlots.jl`, you can use Julia's package manager. Here is the command:

```julia
using Pkg
Pkg.add("BigRiverPlots")

```

## Usage
After installing `BigRiverPlots.jl`, you can include it in your Julia script using the following command:

```julia
using BigRiverPlots
```

From there, you can start using `plotQTL`, `ploteQTL`, and `confplot` to plot your data. For example:

```julia
# Assuming `single_results_perms` are restulting lod scores
# gInfo contains genotype information  
plotQTL(single_results_perms, gInfo)


# Assuming `lod_scores` are in multipletraits_results
# pInfo contains phenotype information
# gInfo contains genotype information  
# thresh is your LOD threshold value
ploteQTL(multipletraits_results, pInfo, gInfo; threshold = 5.0)
plotQTL(single_results_perms, gInfo)


# Assuming `confidence_data` is your data
confplot(confidence_data)
```

## Contribution
Contributions to BigRiverPlots.jl are welcome and appreciated. If you'd like to contribute, please fork the repository and make changes as you'd like. If you have any questions or issues, feel free to open an issue on the repository.

## License
`BigRiverPlots.jl` is licensed under the MIT license. For more information, please refer to the LICENSE file in the repository.

## Support
If you have any problems or questions using `BigRiverPlots.jl`, please open an issue on the GitHub repository. We'll be happy to help!