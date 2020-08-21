#####SFE_CARI loading script
library(sf)
library(ggplot2)
load("IEP_SFE_CARI.rda")

###############
#data from the SFEI California Aquatic Resources Inventory
#https://www.sfei.org/data/california-aquatic-resource-inventory-cari-version-03-gis-data#sthash.zuIpGDaQ.dpbs

#map the data
p1<-ggplot() +
  geom_sf(data = SFE_CARI_polygons, aes(fill = leglabel1))
p2<-ggplot() +
  geom_sf(data = SFE_CARI_streams)

