## code to prepare `R_Delta` dataset goes here

require(sf)

dir<-tempdir()
download.file("https://gis.data.cnra.ca.gov/datasets/57b02f8a5e77465f902376dbd9522585_0.zip?outSR=%7B%22latestWkid%22%3A3857%2C%22wkid%22%3A102100%7D",
              file.path(dir, "Delta.zip"), mode="wb")

unzip(file.path(dir, "Delta.zip"), exdir = file.path(dir, "Delta"))

R_Delta<-st_read(file.path(dir, "Delta"))

# Fix non-ASCII strings in crs
# Solution from: https://github.com/r-spatial/sf/issues/1341#issuecomment-1120902127

R_Delta_crs_corrected<-R_Delta

st_crs(R_Delta_crs_corrected)$wkt <- gsub("°|º", "\\\u00b0", st_crs(R_Delta)$wkt)

#ensure this didn't change anything
st_crs(R_Delta_crs_corrected) == st_crs(R_Delta %>% st_transform(3857))

R_Delta<-R_Delta_crs_corrected

usethis::use_data(R_Delta, overwrite = TRUE)
