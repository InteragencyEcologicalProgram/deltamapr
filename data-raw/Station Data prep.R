require(dplyr)
require(deltareportr)
require(lubridate)
require(stringr)
require(discretewq)
require(readr)
require(tidyr)
require(sf)
require(readxl)


# Zooplankton -------------------------------------------------------------


## YBFMP -------------------------------------------------------------------

download.file("https://portal.edirepository.org/nis/dataviewer?packageid=edi.494.1&entityid=9190cd46d697e59aca2de678f4ca1c95", file.path(tempdir(), "YBFMP_zoop.csv"), mode="wb")
download.file("https://portal.edirepository.org/nis/dataviewer?packageid=edi.494.1&entityid=f2332a9a2aad594f61fea525584694da", file.path(tempdir(), "YBFMP_zoop_stations.csv"), mode="wb")

YBFMP_zoop_stations<-read_csv(file.path(tempdir(), "YBFMP_zoop_stations.csv"),
                              col_types=cols(StationCode="c", Latitude="d", Longitude="d"))%>%
  rename(Station=StationCode) %>%
  mutate(Source = "YBFMP")

## All zoops ---------------------------------------------------------------

Zoop<-zooper::zoopEnvComb%>%
  filter(!is.na(Latitude) & !is.na(Longitude), !str_detect(Station, "EZ"), Source != "DOP", Source != "FRP", Year > 2015)%>%
  group_by(Station,  Source)%>%
  summarise(Latitude=unique(Latitude), Longitude=unique(Longitude), N=n(), .groups="drop")%>%
  bind_rows(YBFMP_zoop_stations)%>%
  mutate(Parameter="Zooplankton")

# Water quality and fish -------------------------------------------------------------


## DJFMP --------------------------------------------------------------------


download.file("https://portal.edirepository.org/nis/dataviewer?packageid=edi.244.4&entityid=e17878fccccafeddaff57eac97d8e170", file.path(tempdir(), "DJFMP_Seine.csv"), mode="wb")
download.file("https://portal.edirepository.org/nis/dataviewer?packageid=edi.244.4&entityid=99a038d691f27cd306ff93fdcbc03b77", file.path(tempdir(), "DJFMP_stations.csv"), mode="wb")

DJFMP_stations <- read_csv(file.path(tempdir(), "DJFMP_stations.csv"),
                           col_types=cols(StationCode="c", Latitude_location="d", Longitude_location="d"))%>%
  rename(Station=StationCode, Latitude=Latitude_location, Longitude=Longitude_location, StationName = Location,
         Parameter = MethodCode)

DJFMP<-read_csv(file.path(tempdir(), "DJFMP_Seine.csv"))%>%
  rename(Station=StationCode, Date=SampleDate, Time=SampleTime)%>%
  mutate(Source="DJFMP",
         Date=parse_date_time(Date, "%Y-%m-%d", tz="America/Los_Angeles"),
         Time=parse_date_time(Time, "%H:%M:%S", tz="America/Los_Angeles"),
         Datetime = parse_date_time(if_else(is.na(Time), NA_character_, paste0(Date, " ", hour(Time), ":", minute(Time))), "%Y-%m-%d %H:%M", tz="America/Los_Angeles"),
         Year=year(Date))%>%
  select(-Time)%>%
  filter(year(Date) >2015) %>%
  distinct(Station, Date, Datetime, .keep_all = TRUE)%>%
  group_by(Station, Year, Source)%>%
  summarise(N=n(), .groups="drop")%>%
  left_join(DJFMP_stations, by="Station")%>%
  filter(!is.na(Latitude) & !is.na(Longitude))%>%
  mutate(Station2=Station)

test =DJFMP_stations[!DJFMP_stations$Station %in% DJFMP$Station,]
oldstas = filter(test, Parameter == "SEIN")

DJFMP_stations = filter(DJFMP_stations, !Station %in% c(oldstas))

## YBFMP -------------------------------------------------------------------

download.file("https://portal.edirepository.org/nis/dataviewer?packageid=edi.233.3&entityid=89146f1382d7dfa3bbf3e4b1554eb5cc", file.path(tempdir(), "YBFMP_Fish_stations.csv"), mode="wb")

YBFMP_stations_fish<-read_csv(file.path(tempdir(), "YBFMP_Fish_stations.csv"),
                              col_types=cols(StationCode="c", Latitude="d", Longitude="d"))%>%
  rename(Station=StationCode, Parameter = MethodCode)%>%
  filter(PeriodOfRecordTo == "Present") %>%
  select(Station, StationName, Latitude, Longitude, Parameter) %>%
  distinct()



# Smelt Larval Survey -----------------------------------------------------
download.file("https://portal.edirepository.org/nis/dataviewer?packageid=edi.534.2&entityid=a96f60dbaa275193abfa5b9cdadd7aa3", file.path(tempdir(), "SLS_stations.csv"), mode="wb")

SLS_stations<-read_csv(file.path(tempdir(), "SLS_stations.csv"),
                       col_types=cols(Station="c", Lat="c", Long="c"))%>%
  separate(Lat, into=c("Lat_deg", "Lat_min", "Lat_sec"), sep=" ", convert=T)%>%
  separate(Long, into=c("Long_deg", "Long_min", "Long_sec"), sep=" ", convert=T)%>%
  mutate(Latitude=Lat_deg+Lat_min/60+Lat_sec/3600,
         Longitude=(Long_deg+Long_min/60+Long_sec/3600)*(-1))%>%
  bind_rows(tibble(Station="912", Latitude=37.966, Longitude=-121.367))%>% # Station 912 currently missing from stations
  select(Station, Latitude, Longitude)



## Integrated water quality ------------------------------------------------

WQ<-wq(Start_year = 2015, End_year = 2021,
       Sources = c("EMP", "USGS_SFBS", "USGS_CAWSC"))%>%
  filter(!is.na(Latitude) & !is.na(Longitude), !str_detect(Station, "EZ"))%>%

  group_by(Year, Station,  Source)%>%
  mutate(n_Lat=n_distinct(Latitude),
         n_Lon=n_distinct(Longitude))%>%
  ungroup()%>%
  group_by(Station, Source)%>%
  summarise(Latitude=unique(Latitude), Longitude=unique(Longitude), N=n(), .groups="drop")%>%
  mutate(Parameter="Water_quality")


## Fish --------------------------------------------------------------------


Fish<-wq(Start_year = 2015, End_year = 2021,
         Sources = c("STN", "FMWT", "DJFMP", "SKT", "20mm", "Suisun",
                     "Baystudy", "SLS"))%>%
  bind_rows(YBFMP_fish)%>%
  mutate(Parameter= case_when(Source == "FMWT" ~ "MDWT",
                              Source == "Suisun" ~ "Otter Trawl",
                              Source == "Baystudy" ~ "MDWT and Otter",
                              Source == "SKT" ~ "KDT",
                              Source == "SLS" ~ "Larval Sled",
                              Source == "20 mm" ~ "Sled",
                              Source == "STN" ~ "Sled"))

# Benthic and phytoplankton ----------------------------------------------

EMPbenthic = read_csv("https://portal.edirepository.org/nis/dataviewer?packageid=edi.1036.3&entityid=4e6948186ad756dc2b6de4de41b601f3")

benthic_stations = filter(EMPbenthic, Period_of_Record_To == "Present") %>%
  rename(Station = StationCode, StationName = Location) %>%
  select(Station, StationName, Latitude, Longitude) %>%
  mutate(Parameter = "Benthic", Source = "EMP")

## Phytoplankton ----------------------------------------------------------------

phyto = read_csv("https://portal.edirepository.org/nis/dataviewer?packageid=edi.1320.4&entityid=00b61678378071f779f1135be223fe0a")

phyto_stations = rename(phyto, Station = StationCode, StationName = Location) %>%
  select(Station, StationName, Latitude, Longitude) %>%
  mutate(Parameter = "Phytoplankton", Source = "EMP")

cdec = read_csv("data-raw/CDEC_stations.csv") %>%
  rename(Station = STA, StationName = `Station Name`) %>%
  mutate(Parameter = "Cont_Water_Quality", Source = "CDEC") %>%
  select(Station, StationName, Latitude, Longitude, Parameter, Source)

# Merge everything --------------------------------------------------------

Stations<-bind_rows(benthic_stations, phyto_stations, Zoop, WQ, Fish, cdec) %>%
  filter(!is.na(Latitude)) %>%
  select(Station, StationName, Latitude, Longitude, Parameter, Source) %>%
  distinct() %>%
  st_as_sf(coords = c("Longitude", "Latitude"), crs = 4326, remove = F) %>%
  st_transform(crs = st_crs(deltamapr::R_Delta))

# #test with a quick map
# ggplot()+
#   geom_sf(data = deltamapr::WW_Delta)+
#   geom_sf(data = Stations, aes(color = Source))

save(Stations, file="data/SamplingSites.rda")
