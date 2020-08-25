
<!-- README.md is generated from README.Rmd. Please edit that file -->

# deltamapr

<!-- badges: start -->

[![R build
status](https://github.com/InteragencyEcologicalProgram/deltamapr/workflows/R-CMD-check/badge.svg)](https://github.com/InteragencyEcologicalProgram/deltamapr/actions)
<!-- badges: end -->

The goal of deltamapr is to provide spatial data for the Bay-Delta.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("InteragencyEcologicalProgram/deltamapr")
```

## Included data sets

``` r
require(ggplot2)
require(sf)
```

### [California aquatic resources inventory](https://www.sfei.org/data/california-aquatic-resource-inventory-cari-version-03-gis-data#sthash.zuIpGDaQ.dpbs)

#### CARI polygons

``` r
ggplot() +
  geom_sf(data = SFE_CARI_polygons, aes(fill = leglabel1))
```

#### CARI streams

``` r
ggplot() +
  geom_sf(data = SFE_CARI_streams)
```
