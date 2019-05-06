#' Cadastral references test data
#'
#' Randomly selected data from catastro to test geocode_cadastral function
#'
#' @docType data
#'
#' @usage data(cadastral_references)
#'
#' @format A data frame.
#'
#' @keywords datasets
#'
#' @references Catastro. Ministerio de Hacienda y función pública.
#' (\href{http://www.catastro.meh.es/}{Catastro})
#'
#' @source \href{http://www.catastro.meh.es/}{Sede Electrónica del Catastro}
#'
#' @examples
#' \dontrun{
#' ## source is cadastral reference number ##
#'
#'  geocode_cadastral("0636105UF3403N", parse_files = FALSE)
#'
#' ## Use lapply to geocode cadastral references from dataframe columns.
#'
#'  cadastral_references$new <- lapply(cadastral_references$cadref1, geocode_cadastral)
#'
#' ## separate previously generated "new" data into columns usign tidyr
#'
#' library(tidyr)
#' separate(cadastral_references, new, into = c('longitude','latitude'), sep = "," )
#'
#' ## source is folder. A loop is needed to process each kml file ##
#'
#' files <- list.files("folder", full.names = T)
#'
#' for (f in files) {
#'  coords <- geocode_cadastral(f, parse_files = TRUE)
#'  d <- as.data.frame(rbind(d , as.data.frame(coords, stringsAsFactors = F )))
#' }
#'
#'# separate lat/lon into columns if you prefer using tidyr
#' d <- tidyr::separate(coords, into = c("longitude","latitude"), sep = "," )
#'}
"cadastral_references"
