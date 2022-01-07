
<!-- README.md is generated from README.Rmd. Please edit that file -->

# vikingR

<!-- badges: start -->

<!-- badges: end -->

vikingR creates a Viking era ggplot palette. Inspired by this
[publication](https://tinyurl.com/bdfjhv25).

## Installation

You can install the development version of vikingR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("DrMattG/vikingR")
```

## Example

This is the basic usage:

``` r
library(vikingR)
library(ggplot2)
#> Warning: package 'ggplot2' was built under R version 4.0.5
ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_viking(palette = "Alle")
```

<img src="man/figures/README-example-1.png" width="100%" />
