## code to prepare `R_DSIBM` dataset goes here
require(sf)

data_path<-file.path("data-raw", "R_DSIBM")

R_DSIBM<-st_read(data_path)

usethis::use_data(R_DSIBM, overwrite = TRUE)
