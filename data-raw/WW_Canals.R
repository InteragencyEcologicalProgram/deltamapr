#code to prepare canal data goes here - WW_Canals

library(tidyverse)
library(sf)

loccanals = st_read("data-raw/WW_Canals/Canals_local.shp")
fedcanals = st_read("data-raw/WW_Canals/i12_Canals_and_Aqueducts_Federal.shp")
swpcanals = st_read("data-raw/WW_Canals/SWP__centerline.shp")

#Let's rename some thing so they make sense

swpcanals = mutate(swpcanals, Operator = "State Water Project") %>%
  rename(Name = Conveyance) %>%
  select(Name, Operator, Conv_Type, Conv_Sub, Comments)  %>%
  st_transform(crs = 4269)

fedcanals = mutate(fedcanals, Operator = "US Bureau of Reclamation") %>%
  rename(Conv_Type = Carriage_T, Shape_Leng = Shape_STLe, Name = "Carriage_N") %>%
  select(Name, Operator, Conv_Type, Shape_Leng)%>%
  st_transform(crs = 4269)

loccanals = select(loccanals, Name, Operator, Shape_Leng, Comments)

WW_Canals = bind_rows(swpcanals, fedcanals, loccanals)

usethis::use_data(WW_Canals, overwrite = TRUE)


