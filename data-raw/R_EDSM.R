## code to prepare `R_EDSM` dataset goes here
require(sf)
require(stringr)

data_path<-file.path("data-raw", "R_EDSM")

# 2016-17 Phase 1
path_1617P1<-file.path(data_path, "2016-2017 Phase 1")
layers_1617P1<-st_layers(path_1617P1)

R_EDSM_Regions_1617P1<-st_read(path_1617P1, layer = layers_1617P1$name[str_which(layers_1617P1$name, "Regions")]) # Same as 2017 Phases 2&3
R_EDSM_Strata_1617P1<-st_read(path_1617P1, layer = layers_1617P1$name[str_which(layers_1617P1$name, "Strata")])
R_EDSM_Subregions_1617P1<-st_read(path_1617P1, layer = layers_1617P1$name[str_which(layers_1617P1$name, "Subregions")]) # Same as 2017 Phase 3

# 2017 Phase 2

path_17P2<-file.path(data_path, "2017 Phase 2")
layers_17P2<-st_layers(path_17P2)

#R_EDSM_Regions_17P2<-st_read(path_17P2, layer = layers_17P2$name[str_which(layers_17P2$name, "Regions")])
R_EDSM_Strata_17P2<-st_read(path_17P2, layer = layers_17P2$name[str_which(layers_17P2$name, "Strata")])
R_EDSM_Subregions_17P2<-st_read(path_17P2, layer = layers_17P2$name[str_which(layers_17P2$name, "Subregions")])

# 2017 Phase 3

path_17P3<-file.path(data_path, "2017 Phase 3")
layers_17P3<-st_layers(path_17P3)

#R_EDSM_Regions_17P3<-st_read(path_17P3, layer = layers_17P3$name[str_which(layers_17P3$name, "Regions")])
R_EDSM_Strata_17P3<-st_read(path_17P3, layer = layers_17P3$name[str_which(layers_17P3$name, "Strata")])
#R_EDSM_Subregions_17P3<-st_read(path_17P3, layer = layers_17P3$name[str_which(layers_17P3$name, "Subregions")])

# 2017-18 Phase 1

path_1718P1<-file.path(data_path, "2017-2018 Phase 1")
layers_1718P1<-st_layers(path_1718P1)

R_EDSM_Regions_1718P1<-st_read(path_1718P1, layer = layers_1718P1$name[str_which(layers_1718P1$name, "Regions")])
R_EDSM_Strata_1718P1<-st_read(path_1718P1, layer = layers_1718P1$name[str_which(layers_1718P1$name, "Strata")])
R_EDSM_Subregions_1718P1<-st_read(path_1718P1, layer = layers_1718P1$name[str_which(layers_1718P1$name, "Subregions")])

# 2018 Phase 2-3

path_18P23<-file.path(data_path, "2018  Phases 2-3")
layers_18P23<-st_layers(path_18P23)

R_EDSM_Regions_18P23<-st_read(path_18P23, layer = layers_18P23$name[str_which(layers_18P23$name, "Regions")]) # Same as 2019 Phase 2 and 2020 Phase 2-3
R_EDSM_Strata_18P23<-st_read(path_18P23, layer = layers_18P23$name[str_which(layers_18P23$name, "Strata")]) # Same as 2019 Phase 2 and 2020 Phase 2-3
R_EDSM_Subregions_18P23<-st_read(path_18P23, layer = layers_18P23$name[str_which(layers_18P23$name, "Subregions")]) # Same as 2019 Phase 2 and 2020 Phase 2-3

# 2018-19 Phase 1

path_1819P1<-file.path(data_path, "2018-2019 Phase 1")
layers_1819P1<-st_layers(path_1819P1)

R_EDSM_Regions_1819P1<-st_read(path_1819P1, layer = layers_1819P1$name[str_which(layers_1819P1$name, "Regions")]) # Same as 2019-2020 Phase 1
R_EDSM_Strata_1819P1<-st_read(path_1819P1, layer = layers_1819P1$name[str_which(layers_1819P1$name, "Strata")]) # Same as 2019-2020 Phase 1
R_EDSM_Subregions_1819P1<-st_read(path_1819P1, layer = layers_1819P1$name[str_which(layers_1819P1$name, "Subregions")]) # Same as 2019-2020 Phase 1

# 2019 Phase 2

path_19P2<-file.path(data_path, "2019 Phase 2")
layers_19P2<-st_layers(path_19P2)

#R_EDSM_Regions_19P2<-st_read(path_19P2, layer = layers_19P2$name[str_which(layers_19P2$name, "Regions")])
#R_EDSM_Strata_19P2<-st_read(path_19P2, layer = layers_19P2$name[str_which(layers_19P2$name, "Strata")])
#R_EDSM_Subregions_19P2<-st_read(path_19P2, layer = layers_19P2$name[str_which(layers_19P2$name, "Subregions")])

# 2019 Phase 3

path_19P3<-file.path(data_path, "2019 Phase 3")
layers_19P3<-st_layers(path_19P3)

R_EDSM_Regions_19P3<-st_read(path_19P3, layer = layers_19P3$name[str_which(layers_19P3$name, "Regions")])
R_EDSM_Strata_19P3<-st_read(path_19P3, layer = layers_19P3$name[str_which(layers_19P3$name, "Strata")])
R_EDSM_Subregions_19P3<-st_read(path_19P3, layer = layers_19P3$name[str_which(layers_19P3$name, "Subregions")])

# 2019-20 Phase 1

path_1920P1<-file.path(data_path, "2019-2020 Phase 1")
layers_1920P1<-st_layers(path_1920P1)

#R_EDSM_Regions_1920P1<-st_read(path_1920P1, layer = layers_1920P1$name[str_which(layers_1920P1$name, "Regions")])
#R_EDSM_Strata_1920P1<-st_read(path_1920P1, layer = layers_1920P1$name[str_which(layers_1920P1$name, "Strata")])
#R_EDSM_Subregions_1920P1<-st_read(path_1920P1, layer = layers_1920P1$name[str_which(layers_1920P1$name, "Subregions")])

# 2020 Phase 2-3

path_20P23<-file.path(data_path, "2020 Phase 2-3")
layers_20P23<-st_layers(path_20P23)

#R_EDSM_Regions_20P23<-st_read(path_20P23, layer = layers_20P23$name[str_which(layers_20P23$name, "Regions")])
#R_EDSM_Strata_20P23<-st_read(path_20P23, layer = layers_20P23$name[str_which(layers_20P23$name, "Strata")])
#R_EDSM_Subregions_20P23<-st_read(path_20P23, layer = layers_20P23$name[str_which(layers_20P23$name, "Subregions")])

usethis::use_data(R_EDSM_Regions_1617P1, R_EDSM_Strata_1617P1, R_EDSM_Subregions_1617P1,
                  R_EDSM_Strata_17P2, R_EDSM_Subregions_17P2,
                  R_EDSM_Strata_17P3,
                  R_EDSM_Regions_1718P1, R_EDSM_Strata_1718P1, R_EDSM_Subregions_1718P1,
                  R_EDSM_Regions_18P23, R_EDSM_Strata_18P23, R_EDSM_Subregions_18P23,
                  R_EDSM_Regions_1819P1, R_EDSM_Strata_1819P1, R_EDSM_Subregions_1819P1,
                  R_EDSM_Regions_19P3, R_EDSM_Strata_19P3, R_EDSM_Subregions_19P3,
                  overwrite = TRUE)
