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

  if (as.numeric(abs(x)) > 999999999) stop(paste(x, "¡es demasiado grande! / too big!!"))



  units <- c("", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete",
             "ocho", "nueve")
  names(units) <- 0:9


  dozens <- c("diez", "once", "doce", "trece", "catorce", "quince",
              "dieciseis", " diecisiete", "dieciocho", "diecinueve")
  names(dozens) <- 0:9

  tens <- c("veinte", "treinta", "cuarenta", "cincuenta", "sesenta",
            "setenta", "ochenta", "noventa")
  names(tens) <- 2:9


  hundred <- c("ciento", "doscientos", "trescientos", "cuatrocientos","quinientos",
               "seiscientos", "setecientos","ochocientos", "novecientos")
  names(hundred) <- 1:9


  is_negative <- x<0
  x <- as.integer(abs(as.numeric(x)))
  len <- nchar(x)
  digits <- rev(strsplit(as.character(x), "")[[1]])


  clean <- function(x) {

    x <- gsub("unomil", "mil", x )
    x <- gsub("uno millones", "un millones", x )
    x <- gsub("unociento", "ciento ", x )
    x <- gsub("ciento y ", "ciento ", x )
    x <- gsub("veinte y ", "veinti", x )
    x <- gsub("veinti$", "veinte", x, perl = TRUE )
    x <- gsub("veinte y $", "veinte", x, perl = TRUE )
    x <- gsub("/?NA ", " ", x, perl = TRUE)
    x <- gsub("^ ", "", x, perl = TRUE)
    x <- gsub(" y $", "", x, perl = TRUE)
    x <- gsub("^un millones ","un millón ",x, perl=TRUE)

    return(x)

  }



  get_number <- function(x) {

    len <- nchar(x)

    digits <- rev(strsplit(as.character(x), "")[[1]])


    if (len == 1) {

      x <- as.vector(units[digits])

    } else if (len == 2) {

      if (x <= 19) x <- as.vector(dozens[digits[1]]) else x <- as.vector(paste0(tens[digits[2]]," y ", units[digits[1]]))

    } else if (len == 3) {

      x <- as.vector(paste0(hundred[digits[3]]," ", if ((as.numeric(paste0(digits[2],digits[1])) <= 19) && digits[2]!=0 ) as.vector(dozens[digits[1]]) else as.vector(paste0(tens[digits[2]]," y ", units[digits[1]]))))

    } else if (len == 4) {

      #x <- as.vector(paste0(units[digits[4]],"mil ",hundred[digits[3]]," ", if (as.numeric(paste0(digits[2],digits[3])) <= 19) as.vector(dozens[digits[1]]) else as.vector(paste0(tens[digits[2]]," y ", units[digits[1]]))))
      x <- as.vector(
        paste0(
          units[digits[4]], "mil ", ## thousands, no changes
          hundred[digits[3]], " ", ## hundreds, no changes
          ifelse(
            as.numeric(paste0(digits[2], digits[3])) < 10, ## in case there are no tens (numbers ending in 0x), this is the main change
            units[digits[1]], ## return only the units
            ifelse(as.numeric(paste0(digits[2], digits[3])) <= 19, # these are the cases with the weird names, no changes from here on
                   as.vector(dozens[digits[1]]),
                   as.vector(paste0(
                     tens[digits[2]]," y ",
                     units[digits[1]]))))))
    }


    return(clean(x))

  }


  if (len < 5) {
    x <- get_number(x)
  } else if (len == 5) {
    x <- paste0(get_number(substr(x,1,2)),"mil ",get_number(substr(x,3,5)))
  } else if (len == 6) {
    x <- paste0(get_number(substr(x,1,3)),"mil ",get_number(substr(x,4,6)))
  } else if (len == 7) {
    x <- paste0(get_number(substr(x,1,1)), " millones ", get_number(substr(x,2,4)),"mil ",get_number(substr(x,5,7)))
  } else if (len == 8) {
    x <- paste0(get_number(substr(x,1,2)), " millones ", get_number(substr(x,3,5)),"mil ",get_number(substr(x,6,8)))
  } else if (len == 9) {
    x <- paste0(get_number(substr(x,1,3)), " millones ", get_number(substr(x,4,6)),"mil ",get_number(substr(x,7,9)))
  } else {
    stop(paste(x, "¡muy grande!"))
  }

  if (is_negative) {x=paste0("menos ",clean(x))}
  return(clean(x))

}
