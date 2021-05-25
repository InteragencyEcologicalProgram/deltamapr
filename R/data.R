#' Delta waterways
#'
#' Shapefile of delta waterways
#'
#' @format a sf tibble with 282 rows and 10 columns.
#' \describe{
#'   \item{AREA}{Area.}
#'   \item{PERIMETER}{Perimeter.}
#'   \item{HYDRO_POLY}{HYDRO_POLY.}
#'   \item{HYDRO_PO_1}{HYDRO_PO_1.}
#'   \item{HYDRO_24K_}{HYDRO_24K_.}
#'   \item{HNAME}{HNAME.}
#'   \item{Shape_Leng}{Shape_Length}
#'   \item{Shape_Area}{Shape_Area.}
#'   \item{geometry}{Shapefile polygon coordinates.}
#' }
#' @section Credit:
#' This shapefile was created by the California Department of Fish and Wildlife
"WW_Delta"

#' Full watershed waterways
#'
#' Shapefile of waterways in the San Francisco Estuary and its watershed
#'
#' @format a sf tibble with 439 rows and 28 columns.
#'
#' @section Credit:
#' This shapefile includes data from CH2M Hill, and Wetland and Water Resources, CDFG Ecosystem Restoration Program as a part of ERP Stage 2 conservation strategy, and Dan Gillenwater.
"WW_Watershed"

#' DBW waterways
#'
#' Shapefile of waterways in the San Francisco Estuary extending into the Southern Central Valley from the California State Parks Division of Boating and Waterways.
#'
#' @format a sf tibble with 321 rows and 16 columns.
#'
#' @section Credit:
#' This shapefile was produced by the California State Parks Division of Boating and Waterways.
"WW_DBW"

#' Bay-Delta regions
#'
#' EDSM regions modified by Brian Mahardja (USFWS)
#'
#' @format a sf tibble with 41 rows and 4 columns.
#' \describe{
#'   \item{Region}{Region}
#'   \item{SubRegion}{SubRegion.}
#'   \item{SQM}{Area of subregion in square miles.}
#'   \item{geometry}{Shapefile polygon coordinates.}
#' }
#' @seealso \code{\link{R_EDSM_Subregions}}, \code{\link{R_EDSM_Regions}}, \code{\link{R_EDSM_Strata}}, \code{\link{R_EDSM_Subregions_Mahardja_FLOAT}}
#' @section Credit:
#' This shapefile was created by the United States Fish and Wildlife Service for the Enhanced Delta Smelt Monitoring Program and modified by Brian Mahardja.
"R_EDSM_Subregions_Mahardja"

#' Bay-Delta regions
#'
#' A modified version of \code{\link{R_EDSM_Subregions_Mahardja}} with the "Georgiana Slough" and "Sacramento River near Ryde" SubRegions merged, retaining the "Sacramento River near Ryde" name.
#' This version was built for the IEP FLOAT/Drought MAST analyses in 2021
#'
#' @format a sf tibble with 40 rows and 4 columns.
#' \describe{
#'   \item{Region}{Region}
#'   \item{SubRegion}{SubRegion.}
#'   \item{SQM}{Area of subregion in square miles.}
#'   \item{geometry}{Shapefile polygon coordinates.}
#' }
#' @seealso \code{\link{R_EDSM_Subregions}}, \code{\link{R_EDSM_Regions}}, \code{\link{R_EDSM_Strata}}, \code{\link{R_EDSM_Subregions_Mahardja}}
#' @section Credit:
#' This shapefile was created by the United States Fish and Wildlife Service for the Enhanced Delta Smelt Monitoring Program, modified by Brian Mahardja, then modified by Sam Bashevkin.
"R_EDSM_Subregions_Mahardja_FLOAT"

#' California Aquatic Resources Inventory wetlands
#'
#' Wetlands habitat data from the California Aquatic Resources Inventory (CARI), cut to only retain feature that touch a 5km buffer around the Bay-Delta (as defined by the \code{\link{WW_Delta}} dataset).
#'
#' @format a sf tibble with 37,135 rows and 18 columns.
#' \describe{
#'   \item{orig_class}{Original classification of the wetland in the source dataset. Source datasets (e.g. NWI, BAARI) use different classification systems. The 'orig_class' field preserves that information.}
#'   \item{name}{The name of a particular wetland feature. (e.g. Alpine Lake).}
#'   \item{globalid}{A placeholder attribute for EcoAtlas.org (unused).}
#'   \item{source_data}{A description of the imagery or other primary data source from which the wetland feature was identified and mapped.}
#'   \item{organization}{The agency or organization that originally mapped the wetland feature.}
#'   \item{orig_dataset}{The original dataset (and data publication date if known) that was integrated into CARI.}
#'   \item{lastupdate}{The date that a particular feature was updated.}
#'   \item{clickcode}{An alphanumeric code for the wetland classification. Clickcode values are undergoing revision and will be updated in a future release of CARI.}
#'   \item{clicklabel}{A detailed description of a feature's wetland type. Clicklabel is the most detailed classification provided by CARI.
#'         Original classifications from component datasets (see 'orig_class'' above) are translated or "crosswalked" into CARI's classification
#'         system. While CARI's component datasets may provide more detail for certain types of wetlands, CARI provides a single
#'         statewide classification for wetland types. E.g. "Depressional Perennial Natural Emergent". Major classes within the 'clicklabel'
#'         field include: wetlands and (deep) open water. Classes and types include: depessions, playas, estuarine, lacustrine. marine,
#'         riverine, lagoon, and slope.}
#'   \item{legcode}{a 1-3 letter code signifying the major wetland class, associated with the 'leglabellevel2' field. Provides less detail than 'clickcode'.}
#'   \item{leglabellevel1}{Common terminology for a feature's wetland type. In EcoAtlas.org, Leglabellevel1 is the value that appears in
#'         the legend, when you click on a particular feature to identify it, and in analyses of wetland area generated by EcoAtlas' Landscape
#'         Profile tool.}
#'   \item{leglabellvel2}{Major classification (less detailed) of the wetland classification provided by the 'clicklabel' field. E.g. "Depressional".}
#'   \item{legend_headings}{In EcoAtlas.org, 'legend_headings' is the value that appears in the legend heading.}
#'   \item{ReleaseDate}{the date that a particular feature was integrated into the CARI dataset, including updated versions of a particular feature.}
#'   \item{CARI_id}{Unique id for that CARI feature.}
#'   \item{Shape_Length}{Length of feature in internal units.}
#'   \item{Shape_Area}{Area of feature in internal units squared.}
#'   \item{Shape}{Geometry column.}
#' }
#' @section Credit:
#' This dataset was created by the San Francisco Estuary Institute and is available (along with full metadata) \href{https://www.sfei.org/data/california-aquatic-resource-inventory-cari-version-03-gis-data}{here}.
"H_CARI_wetlands"

#' California Aquatic Resources Inventory streams
#'
#' Stream data from the California Aquatic Resources Inventory (CARI), cut to only retain feature that touch a 5km buffer around the Bay-Delta (as defined by the \code{\link{WW_Delta}} dataset).
#'
#' @format a sf tibble with 55,522 rows and 16 columns.
#' \describe{
#'   \item{gid}{a placeholder attribute for EcoAtlas.org (unused).}
#'   \item{name}{The name of a particular wetland feature. (e.g. Pajaro River).}
#'   \item{orig_class}{Original classification of the wetland in the source dataset. Source datasets (e.g. NWI, BAARI) use different classification systems. The 'orig_class' field preserves that information.}
#'   \item{source_dat}{a description of the imagery or other primary data source from which the wetland feature was identified and mapped.}
#'   \item{clickcode}{An alphanumeric code for the wetland classification. Clickcode values are undergoing revision and will be updated in a future release of CARI.}
#'   \item{clicklabel}{a detailed description of a feature's wetland type. Clicklabel is the most detailed classification provided by CARI.
#'         Original classifications from component datasets (see 'orig_class'' above) are translated or "crosswalked" into CARI's classification
#'         system. Clicklabel values include: "Fluvial Natural", "Fluvial Unnatural", "Tidal Natural", and "Tidal Unnatural".}
#'   \item{legheader}{In EcoAtlas.org, 'legheader' is the value that appears in the legend heading. "Drainage Features" is the only value for legheader.}.
#'   \item{legcode}{a 1 or 2 letter code identifying whether the major stream class has tidal influence (TR) or not (R), associated with
#'         the 'leglabellevel2' field. Provides less detail than 'clickcode'.}
#'   \item{leglabel}{Common terminology for a feature's wetland type. In EcoAtlas.org, Leglabel is the value that appears in the legend,
#'         when you click on a particular feature to identify it, and in analyses of wetland area generated by EcoAtlas' Landscape Profile tool.
#'         Leglabel values include:"Fluvial" and "Tidal".}
#'   \item{dataset_org}{the agency or organization that originally mapped the wetland feature.}
#'   \item{orig_datas}{the original dataset (and data publication date if known) that was integrated into CARI.}
#'   \item{ReleaseDate}{The date that a particular feature was integrated into the CARI dataset, including updated versions of a particular feature.}
#'   \item{lastupdate}{The date that a particular feature was updated.}
#'   \item{CARI_id}{Unique id for that CARI feature.}
#'   \item{Shape_Length}{Length of feature in internal units.}
#'   \item{Shape}{Geometry column.}
#'
#' }
#' @section Credit:
#' This dataset was created by the San Francisco Estuary Institute and is available (along with full metadata) \href{https://www.sfei.org/data/california-aquatic-resource-inventory-cari-version-03-gis-data}{here}.
"H_CARI_streams"

#' EDSM Regions
#'
#' Region polygons from the Enhanced Delta Smelt Monitoring Program
#'
#' @rdname R_EDSM_Regions
#' @name R_EDSM_Regions
#' @section Naming:
#' Files are named with the year(s) then phase(s). So \code{R_EDSM_Regions_1617P1} refers to the 2016-2017 Phase 1 regions,
#' while \code{R_EDSM_Regions_18P23} refers to the 2018 Phase 2 and Phase 3 regions.
#' @section Duplication:
#' Sometimes the same regions were used in multiple years. In this case, only the first year that set of regions appeared is made available and all years and phases that dataset
#' applies to are listed below.
#' \describe{
#' \item{R_EDSM_Regions_1617P1}{Equivalent to 2017 Phases 2&3 Regions}
#' \item{R_EDSM_Regions_18P23}{Equivalent to 2019 Phase 2 and 2020 Phase 2-3 Regions}
#' \item{R_EDSM_Regions_1819P1}{Equivalent to 2019-2020 Phase 1 Regions}
#' }
#' @section Credit:
#' These datasets were created by the United States Fish and Wildlife Service for the
#' \href{https://www.fws.gov/lodi/juvenile_fish_monitoring_program/jfmp_index.htm}{Enhanced Delta Smelt Monitoring Program}.
#' @seealso \code{\link{R_EDSM_Strata}}, \code{\link{R_EDSM_Subregions}}
NULL

#' @rdname R_EDSM_Regions
"R_EDSM_Regions_1617P1"

#' @rdname R_EDSM_Regions
"R_EDSM_Regions_1718P1"

#' @rdname R_EDSM_Regions
"R_EDSM_Regions_18P23"

#' @rdname R_EDSM_Regions
"R_EDSM_Regions_1819P1"

#' @rdname R_EDSM_Regions
"R_EDSM_Regions_19P3"

#' EDSM Strata
#'
#' Strata polygons from the Enhanced Delta Smelt Monitoring Program
#'
#' @rdname R_EDSM_Strata
#' @name R_EDSM_Strata
#' @section Naming:
#' Files are named with the year(s) then phase(s). So \code{R_EDSM_Strata_1617P1} refers to the 2016-2017 Phase 1 strata,
#' while \code{R_EDSM_Strata_18P23} refers to the 2018 Phase 2 and Phase 3 strata.
#' @section Duplication:
#' Sometimes the same strata were used in multiple years. In this case, only the first year that set of strata appeared is made available and all years and phases that dataset
#' applies to are listed below.
#' \describe{
#' \item{R_EDSM_Strata_18P23}{Equivalent to 2019 Phase 2 and 2020 Phase 2-3 Strata}
#' \item{R_EDSM_Strata_1819P1}{Equivalent to 2019-2020 Phase 1 Strata}
#' }
#' @section Credit:
#' These datasets were created by the United States Fish and Wildlife Service for the
#' \href{https://www.fws.gov/lodi/juvenile_fish_monitoring_program/jfmp_index.htm}{Enhanced Delta Smelt Monitoring Program}.
#' @seealso \code{\link{R_EDSM_Regions}}, \code{\link{R_EDSM_Subregions}}
NULL

#' @rdname R_EDSM_Strata
"R_EDSM_Strata_1617P1"

#' @rdname R_EDSM_Strata
"R_EDSM_Strata_17P2"

#' @rdname R_EDSM_Strata
"R_EDSM_Strata_17P3"

#' @rdname R_EDSM_Strata
"R_EDSM_Strata_1718P1"

#' @rdname R_EDSM_Strata
"R_EDSM_Strata_18P23"

#' @rdname R_EDSM_Strata
"R_EDSM_Strata_1819P1"

#' @rdname R_EDSM_Strata
"R_EDSM_Strata_19P3"

#' EDSM Subregions
#'
#' Strata polygons from the Enhanced Delta Smelt Monitoring Program
#'
#' @rdname R_EDSM_Subregions
#' @name R_EDSM_Subregions
#' @section Naming:
#' Files are named with the year(s) then phase(s). So \code{R_EDSM_Subregions_1617P1} refers to the 2016-2017 Phase 1 subregions,
#' while \code{R_EDSM_Subregions_18P23} refers to the 2018 Phase 2 and Phase 3 subregions.
#' @section Duplication:
#' Sometimes the same subregions were used in multiple years. In this case, only the first year that set of subregions appeared is made available and all years and phases that dataset
#' applies to are listed below.
#' \describe{
#' \item{R_EDSM_Subregions_1617P1}{Equivalent to 2017 Phase 3 Subregions}
#' \item{R_EDSM_Subregions_18P23}{Equivalent to 2019 Phase 2 and 2020 Phase 2-3 Subregions}
#' \item{R_EDSM_Subregions_1819P1}{Equivalent to 2019-2020 Phase 1 Subregions}
#' }
#' @section Credit:
#' These datasets were created by the United States Fish and Wildlife Service for the
#' \href{https://www.fws.gov/lodi/juvenile_fish_monitoring_program/jfmp_index.htm}{Enhanced Delta Smelt Monitoring Program}.
#' @seealso \code{\link{R_EDSM_Regions}}, \code{\link{R_EDSM_Strata}}, \code{\link{R_EDSM_Subregions_Mahardja}}, \code{\link{R_EDSM_Subregions_Mahardja_FLOAT}}
NULL

#' @rdname R_EDSM_Subregions
"R_EDSM_Subregions_1617P1"

#' @rdname R_EDSM_Subregions
"R_EDSM_Subregions_17P2"

#' @rdname R_EDSM_Subregions
"R_EDSM_Subregions_1718P1"

#' @rdname R_EDSM_Subregions
"R_EDSM_Subregions_18P23"

#' @rdname R_EDSM_Subregions
"R_EDSM_Subregions_1819P1"

#' @rdname R_EDSM_Subregions
"R_EDSM_Subregions_19P3"
