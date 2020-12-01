## code to prepare `WW_DBW` dataset goes here
require(sf)

WW_DBW<-read_sf(file.path("data-raw", "WW_DBW"))

usethis::use_data(WW_DBW, overwrite = TRUE)
