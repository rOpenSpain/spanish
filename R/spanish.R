#' spanish: A package for spanish related data functions.
#'
#' The spanish package provides some functions for spanish data:
#' to_number()  geocode_cadastral() to_words()
#'
#' @section to_number():
#' Translate spanish spelled quantities into their integer counterparts.
#' Allows you to translate to integer numerical words spelled in spanish.
#' Text must be previously cleaned & removed extraneous words or symbols.
#' Quantities MUST be written in a correct Spanish (this is not a grammar tool)
#' The upper limit is up to the millions range. Cents must be removed.
#' (in my TODO list to parse cents part)
#'
#' @section to_words():
#' Translate to spanish spelled quantities from integers
#'
#' @section geocode_cadastral():
#' geocode by longitude and latitude from cadastral references.
#' Get longitude/latitude from valid cadastral ref. or kml files from catastro.
#'
#' @docType package
#' @name spanish
NULL
