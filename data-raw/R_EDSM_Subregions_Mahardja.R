## code to prepare `R_EDSM_Subregions_Mahardja` dataset goes here
require(sf)
require(dplyr)

R_EDSM_Subregions_Mahardja<-st_read(file.path("data-raw", "R_EDSM_Subregions_Mahardja"))

R_EDSM_Subregions_Mahardja_FLOAT<-R_EDSM_Subregions_Mahardja%>%
  mutate(SubRegion=recode(SubRegion, `Georgiana Slough`="Sacramento River near Ryde"))%>% # Merge Georgiana Slough with Sacramento River near Ryde
  group_by(SubRegion)%>%
  summarise(SQM=sum(SQM), Region=unique(Region))%>%
  ungroup()

usethis::use_data(R_EDSM_Subregions_Mahardja, R_EDSM_Subregions_Mahardja_FLOAT, overwrite = TRUE)
