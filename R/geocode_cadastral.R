#' geocode by longitude and latitude from cadastral references.
#'
#' Get longitude/latitude from valid cadastral ref. or kml files from catastro.
#'
#' @keywords geocoding, latitude, longitude, cadastre, cadastral reference.
#' @param x A valid spanish cadastral reference.
#' @param parse_files bool. Default to FALSE. Set TRUE if source are KML files.
#' @return A string for longitude/latitude if found. NA if not found.
#' @section Warning: You may be banned if many requests in short time are made.
#' @examples
#' ## source is cadastral reference number ##
#' \dontrun{
#' ## geocode_cadastral("0636105UF3403N", parse_files = FALSE)
#'
#' ##"36.5209422288168,-4.89298751473745"
#'
#' ## Use lapply to geocode cadastral references from dataframe columns.
#'
#' cadastral_references$new <- lapply(cadastral_references$cadref1, geocode_cadastral)
#'
#' ## separate previously generated "new" data into columns usign tidyr
#'
#' # library(tidyr)
#' # separate(cadastral_references, new, into = c('longitude','latitude'), sep = "," )
#'
#' ## source is folder. A loop is needed to process each kml file ##
#'
#' # files <- list.files("folder", full.names = T)
#'
#' # for (f in files) {
#' #  coords <- geocode_cadastral(f, parse_files = TRUE)
#' # d <- as.data.frame(rbind(d , as.data.frame(coords, stringsAsFactors = F )))
#' # }
#'
#'# separate lat/lon into columns if you prefer using tidyr
#' # d <- tidyr::separate(coords, into = c("longitude","latitude"), sep = "," )
#'}
#' @name geocode_cadastral
#' @importFrom magrittr %>%
#' @export



utils::globalVariables(".")


geocode_cadastral <- function(x, parse_files) {

  if (missing(parse_files)) {
    parse_files <- FALSE
  }

  if (!requireNamespace("magrittr", quietly = TRUE)) {
    stop("magrittr needed for this function to work. Please install it.",
         call. = FALSE)
  }

  if (!requireNamespace("xml2", quietly = TRUE)) {
    stop("xml2 needed for this function to work. Please install it.",
         call. = FALSE)
  }


  if (parse_files) {

    con <- file(x, "rb")

  } else {

    con <-
      paste0(
        "http://ovc.catastro.meh.es/Cartografia/WMS/BuscarParcelaGoogle.aspx?RefCat=",
        x
      )
    Sys.sleep(2)

  }

  try(
    coords <- xml2::read_xml(con) %>%
    sub("kml xmlns", "kml xmlns:X", .) %>%
    xml2::as_xml_document() %>%
    xml2::xml_find_all("//Point/coordinates") %>%
    xml2::xml_text() %>%
    gsub('.{2}$', '', .),
    silent = TRUE)

  if (length(coords) == 0) coords <- NA

  if (parse_files) close(con)

  return(coords)

}

