to_words <- function(x) {

  if (!requireNamespace("magrittr", quietly = TRUE)) {
    stop("magrittr needed for this function to work. Please install it.",
         call. = FALSE)
  }

  if (as.numeric(x) > 999999999) stop(paste(x, "es demasiado grande!"))


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



x <- as.integer(as.numeric(x))
len <- nchar(x)
digits <- rev(strsplit(as.character(x), "")[[1]])



get_number <- function(x) {

      len <- nchar(x)
      digits <- rev(strsplit(as.character(x), "")[[1]])

      if (len == 1) x <- as.vector(units[digits])

      if (len == 2)
        if (x <= 19) x <- as.vector(dozens[digits[1]]) else x <- as.vector(paste0(tens[digits[2]]," y ", units[digits[1]]))

      if (len == 3) x <- as.vector(paste0(hundred[digits[3]]," ", if (as.numeric(paste0(digits[2],digits[3])) <= 19) as.vector(dozens[digits[1]]) else as.vector(paste0(tens[digits[2]]," y ", units[digits[1]]))))

      if (len == 4) x <- as.vector(paste0(units[digits[4]],"mil ",hundred[digits[3]]," ", if (as.numeric(paste0(digits[2],digits[3])) <= 19) as.vector(dozens[digits[1]]) else as.vector(paste0(tens[digits[2]]," y ", units[digits[1]]))))

      x <- gsub("unomil", "mil", x )
      x <- gsub("unociento", "ciento ", x )
      x <- gsub("veinte y ", "veinti", x )
      x <- gsub("veinti$", "veinte", x, perl = TRUE )
      x <- gsub("veinte y $", "veinte", x, perl = TRUE )
      x <- gsub(" NA ", " ", x)


      return(x)

}


if (len < 5) {
  get_number(x)
} else if (len == 5) {
  paste0(get_number(substr(x,1,2)),"mil ",get_number(substr(x,3,5)))
} else if (len == 6) {
  paste0(get_number(substr(x,1,3)),"mil ",get_number(substr(x,4,6)))
} else if (len == 7) {
  paste0(get_number(substr(x,1,1)), " millones ", get_number(substr(x,2,4)),"mil ",get_number(substr(x,5,7)))
} else if (len == 8) {
  paste0(get_number(substr(x,1,2)), " millones ", get_number(substr(x,3,5)),"mil ",get_number(substr(x,6,8)))
} else if (len == 9) {
  paste0(get_number(substr(x,1,3)), " millones ", get_number(substr(x,4,6)),"mil ",get_number(substr(x,7,9)))
} else {
  stop(paste(x, "muy grande!"))
}



}

