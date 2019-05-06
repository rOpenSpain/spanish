#' translate spanish spelled quantities into their integer counterparts.
#'
#' Allows you to translate to integer numerical words spelled in spanish.
#' Text must be previously cleaned & removed extraneous words or symbols
#' Quantities MUST be written in a correct Spanish (this is not a grammar tool)
#' The upper limit is up to the millions range. Cents must be removed.
#'
#' @param x A spanish spelled number.
#' @examples
#' to_number("mil trescientos noventa y dos")
#'
#' # Example table is provided: cantidades
#' cantidades$var3 <- lapply(cantidades$var2, to_number)
#' @name to_number
#' @keywords money, currency, euros, translate
#' @importFrom magrittr %>%
#' @export


utils::globalVariables(".")


to_number <- function(x) {

  if (!requireNamespace("magrittr", quietly = TRUE)) {
    stop("magrittr needed for this function to work. Please install it.",
         call. = FALSE)
  }

    x <- gsub("^mil", "1000)+", x , ignore.case = T) %>%
    gsub("once", "+11", . , ignore.case = T) %>%
    gsub("doce", "+12", . , ignore.case = T ) %>%
    gsub("trece", "+13", . , ignore.case = T) %>%
    gsub("catorce", "+14", . , ignore.case = T) %>%
    gsub("quince", "+15", . , ignore.case = T) %>%
    gsub("dieciseis", "+16", . , ignore.case = T) %>%
    gsub("diecisiete|diez y siete", "+17", . , ignore.case = T) %>%
    gsub("dieciocho", "+18", . , ignore.case = T) %>%
    gsub("diecinueve", "+19", . , ignore.case = T) %>%
    gsub("veinte|veinti", "+20", . , ignore.case = T) %>%
    gsub("treinta", "+30", . , ignore.case = T) %>%
    gsub("cuarenta", "+40", . , ignore.case = T) %>%
    gsub("cincuenta", "+50", . , ignore.case = T) %>%
    gsub("sesenta", "+60", . , ignore.case = T) %>%
    gsub("setenta", "+70", . , ignore.case = T) %>%
    gsub("ochenta", "+80", . , ignore.case = T) %>%
    gsub("noventa", "+90", . , ignore.case = T) %>%
    gsub("doscientos", "+200", . , ignore.case = T) %>%
    gsub("trescientos", "+300", . , ignore.case = T) %>%
    gsub("cuatrocientos", "+400", . , ignore.case = T) %>%
    gsub("quinientos", "+500", . , ignore.case = T) %>%
    gsub("seiscientos", "+600", . , ignore.case = T) %>%
    gsub("setecientos", "+700", . , ignore.case = T) %>%
    gsub("ochocientos", "+800", . , ignore.case = T) %>%
    gsub("novecientos", "+900", . , ignore.case = T) %>%
    gsub("uno", "+1", . , ignore.case = T) %>%
    gsub("dos", "+2", . , ignore.case = T) %>%
    gsub("tres", "+3", . , ignore.case = T) %>%
    gsub("cuatro", "+4", . , ignore.case = T) %>%
    gsub("cinco", "+5", . , ignore.case = T) %>%
    gsub("seis", "+6", . , ignore.case = T) %>%
    gsub("siete", "+7", . , ignore.case = T) %>%
    gsub("ocho", "+8", . , ignore.case = T) %>%
    gsub("nueve", "+9", . , ignore.case = T) %>%
    gsub("millones", ")*(1000000)+(0", . , ignore.case = T) %>%
    gsub("millon", ")*(1000000)+(0", . , ignore.case = T) %>%
    gsub("mil", ")*(1000)+(0", . , ignore.case = T) %>%
    gsub("ciento", "+100", . , ignore.case = T) %>%
    gsub("cien", "+100", . , ignore.case = T) %>%
    gsub("diez", "+10", . , ignore.case = T) %>%
    gsub("un", "+1", . , ignore.case = T) %>%
    gsub("Y", "", . , ignore.case = T) %>%
    gsub(" ", "", . , ignore.case = T) %>%
    gsub("^", "(0", . , ignore.case = T) %>%
    gsub("$", ")", . , ignore.case = T) %>%
    gsub("\\(0\\(", "", . , ignore.case = T ) %>%
    gsub("\\+\\+", "\\+\\(", . , ignore.case = T ) %>%
    gsub("\\)\\+\\)", "\\)", . , ignore.case = T )

  return(as.integer(eval(parse(text = x))))
}
