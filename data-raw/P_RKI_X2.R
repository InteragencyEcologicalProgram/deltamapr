require(dplyr)
require(lubridate)
require(stringr)
require(readr)
require(tidyr)
require(sf)

#Import shapefile of river kilometer indices
P_RKI = read_sf("data-raw/P_RKI/river_kilometer_index_dfg.shp")

#pull out river kilometer distance as it's own column and clean up the dataframe
P_RKI = mutate(P_RKI, RKI = as.numeric(str_extract(ID, "([0-9]+).*$")),
               RKI = case_when(str_sub(ID, -1L, -1L)=="O" ~0,
                               TRUE ~ RKI)) %>%
  select(-temp) %>%
  rename(WaterBodyType = LOOP)

#make a seperate data frame of just the values for X2
P_X2 = filter(P_RKI, NAME == "Sacramento River") %>%
  mutate(WaterBodyType = "X2", ID = NULL)

usethis::use_data(P_RKI, overwrite = TRUE)
usethis::use_data(P_X2, overwrite = TRUE)


