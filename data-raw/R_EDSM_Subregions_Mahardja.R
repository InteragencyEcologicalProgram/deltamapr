## code to prepare `R_EDSM_Subregions_Mahardja` dataset goes here
require(sf)

R_EDSM_Subregions_Mahardja<-st_read(file.path("data-raw", "R_EDSM_Subregions_Mahardja"))

usethis::use_data(R_EDSM_Subregions_Mahardja, overwrite = TRUE)
