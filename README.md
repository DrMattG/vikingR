
<!-- README.md is generated from README.Rmd. Please edit that file -->

# vikingR

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/445624213.svg)](https://zenodo.org/badge/latestdoi/445624213)
<!-- badges: end -->

vikingR creates a Viking era ggplot palette. Inspired by this
[publication](https://tinyurl.com/bdfjhv25). The National Museum of
Denmark working with Chemists were able to recreate some of the colours
that were common in the Viking era. Of course we can not know for sure
if this were the only colours available at the time.

## Installation

You can install the development version of vikingR from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("DrMattG/vikingR")
```

## Example

This is the basic usage:

``` r
library(vikingR)
library(tidyverse, quietly = TRUE)
data("topNorName1880to2020")
topNorName1880to2020 |>  
  ggplot(aes(reorder(name,n),n, fill=name)) +
  geom_histogram(stat="identity") +
  scale_fill_viking(palette = "Alle", guide = "none")+
  labs(x="", y= "Frequency in the top 10 boys names in Norway")+
  coord_flip()+
  theme_classic()
```

<img src="man/figures/README-example-1.png" width="100%" />
