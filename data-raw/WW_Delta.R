## code to prepare `WW_Delta` dataset goes here

WW_Delta <- sf::read_sf(file.path("data-raw", "WW_Delta"))

usethis::use_data(WW_Delta, overwrite = TRUE)
