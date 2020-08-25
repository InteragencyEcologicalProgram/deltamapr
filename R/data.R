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

#' Bay-Delta regions
#'
#' EDSM regions modified by Brian Mahardja (USFWS)
#'
#' @format a sf tibble with 282 rows and 10 columns.
#' \describe{
#'   \item{Region}{Region}
#'   \item{SubRegion}{SubRegion.}
#'   \item{SQM}{Area of subregion in square miles.}
#'   \item{geometry}{Shapefile polygon coordinates.}
#' }
#' @section Credit:
#' This shapefile was created by the United States Fish and Wildlife Service for the Enhanced Delta Smelt Monitoring Program and modified by Brian Mahardja.
"R_EDSM_Mahardja"

#' Full watershed waterways
#'
#' Shapefile of waterways in the San Francisco Estuary and its watershed
#'
#' @format a sf tibble with 282 rows and 10 columns.
#'
#' @section Credit:
#' This shapefile was created by CH2MHil and Wetland and Water Resource.
"WW_Watershed"
