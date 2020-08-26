## code to prepare `H_CARI` dataset goes here
require(sf)
require(units)
require(deltamapr)

download.file("https://www.sfei.org/sites/default/files/data/CARI%20GISv0.3_SFEI2017.zip",
                    file.path(tempdir(), "CARI.zip"), mode="wb", method="curl")

unzip(file.path(tempdir(), "CARI.zip"), exdir = file.path(tempdir(), "CARI"))

H_CARI_wetlands<-st_read(file.path(tempdir(), "CARI", "CARIv0.3.gdb"), layer="CARIv0_3_wetlands_final")%>%
  st_cast("MULTIPOLYGON")%>%
  st_make_valid()
H_CARI_streams<-st_read(file.path(tempdir(), "CARI", "CARIv0.3.gdb"), layer="CARIv0_3_streams_final")%>%
  st_cast("MULTILINESTRING")

Area<-WW_Delta%>%
  st_transform(crs=26910)%>%
  st_union()%>%
  st_boundary()%>%
  st_buffer(dist = set_units(5000, m))

# Fill holes (https://github.com/r-spatial/sf/issues/609#issuecomment-357426716)
Area<-st_multipolygon(lapply(Area, function(x) x[1]))%>%
  st_sfc(crs=26910)%>%
  st_transform(st_crs(H_CARI_wetlands))

H_CARI_wetlands<-H_CARI_wetlands%>%
  st_filter(Area)

H_CARI_streams<-H_CARI_streams%>%
  st_filter(Area)

usethis::use_data(H_CARI_wetlands, H_CARI_streams, overwrite = TRUE)
