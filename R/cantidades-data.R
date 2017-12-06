#' Cantidades test data
#'
#' Randomly generated spanish spelled monetary integers to test to_number function
#'
#' @docType data
#'
#' @usage data(cantidades)
#'
#' @format A data frame.
#'
#' @keywords datasets
#'
#'
#' @examples
#' to_number("mil trescientos noventa y dos")
#'
#'
#' ## testing provided dataframe: cantidades
#'
#' cantidades$var3 <- lapply(cantidades$var2, to_number)
#'
"cantidades"
