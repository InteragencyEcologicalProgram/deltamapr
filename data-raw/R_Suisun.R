## code to prepare `R_Suisun` dataset goes here
require(sf)

dir<-tempdir()
download.file("https://gis.data.cnra.ca.gov/datasets/643785963c664e48a8fba3f0e1506160_0.zip?outSR=%7B%22latestWkid%22%3A3857%2C%22wkid%22%3A102100%7D",
              file.path(dir, "Suisun.zip"), mode="wb")

unzip(file.path(dir, "Suisun.zip"), exdir = file.path(dir, "Suisun"))

R_Suisun<-st_read(file.path(dir, "Suisun"))

# Fix non-ASCII strings in crs
# Solution from: https://github.com/r-spatial/sf/issues/1341#issuecomment-1120902127

R_Suisun_crs_corrected<-R_Suisun

st_crs(R_Suisun_crs_corrected)$wkt <- gsub("°|º", "\\\u00b0", st_crs(R_Suisun)$wkt)

#ensure this didn't change anything
st_crs(R_Suisun_crs_corrected) == st_crs(R_Suisun %>% st_transform(3857))

R_Suisun<-R_Suisun_crs_corrected

usethis::use_data(R_Suisun, overwrite = TRUE)
