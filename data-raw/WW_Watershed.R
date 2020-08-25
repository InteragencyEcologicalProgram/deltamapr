## code to prepare `WW_Watershed` dataset goes here
require(sf)
WW_Watershed<-st_read(file.path("data-raw", "WW_Watershed"))

usethis::use_data(WW_Watershed, overwrite = TRUE)
