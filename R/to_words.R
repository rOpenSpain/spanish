#' From integers to spanish spelled quantities.
#'
#' Takes any integer from zero to millions range and returns spanish characters
#'
#'
#' @keywords spanish, integers, money, quantities.
#' @param x A valid integer amount.
#' @return A string for the same integer number in spanish.
#' @name to_words
#' @importFrom magrittr %>%
#' @export



utils::globalVariables(".")


to_words <- function(x) {

  if (!requireNamespace("magrittr", quietly = TRUE)) {
    stop("magrittr needed for this function to work. Please install it.",
         call. = FALSE)
  }

  x <- round(x)
  len <- nchar(x)
  digits <- rev(strsplit(as.character(x), "")[[1]])


  units <- c("", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete",
             "ocho", "nueve")
  names(units) <- 0:9


  dozens <- c("diez", "once", "doce", "trece", "catorce", "quince",
              "dieciseis", " diecisiete", "dieciocho", "diecinueve")
  names(dozens) <- 0:9


  tens <- c("veinte", "treinta", "cuarenta", "cincuenta", "sesenta", "setenta", "ochenta",
            "noventa")
  names(tens) <- 2:9


  hundred <- c("ciento", "doscientos", "trescientos", "cuatrocientos", "quinientos", "seiscientos", "setecientos",
               "ochocientos", "novecientos")
  names(hundred) <- 1:9


  if (len == 1) x <- as.vector(units[digits])

  if (len == 2)
    if (x <= 19) x <- as.vector(dozens[digits[1]]) else x <- as.vector(paste0(tens[digits[2]]," y ", units[digits[1]]))

  if (len == 3) x <- as.vector(paste0(hundred[digits[3]]," ", if (as.numeric(paste0(digits[2],digits[3])) <= 19) as.vector(dozens[digits[1]]) else as.vector(paste0(tens[digits[2]]," y ", units[digits[1]]))))

  x <- gsub("unociento", "ciento ", x )
  x <- gsub("veinte y ", "veinti", x )
  x <- gsub("veinti$", "veinte", x, perl = TRUE )
  x <- gsub("veinte y $", "veinte", x, perl = TRUE )

  return(x)

}
