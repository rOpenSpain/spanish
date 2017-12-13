#' spanish: A package for spanish related data functions.
#'
#' The spanish package provides two important functions:
#' to_number() and geocode_cadastral()
#'
#' @section to_number():
#' Translate spanish spelled quantities into their integer counterparts.
#' Allows you to translate to integer numerical words spelled in spanish.
#' Text must be previously cleaned & removed extraneous words or symbols.
#' Quantities MUST be written in a correct Spanish (this is not a grammar tool)
#' The upper limit is up to the millions range. Cents must be removed.
#' (in my TODO list to parse cents part)
#'
#' @section geocode_cadastral():
#' Geocode by longitude and latitude from cadastral references.
#' Get longitude/latitude from valid cadastral ref. or kml files from catastro.
#'
#' @section Warning: You may be banned if many requests in short time are made
#' to catastro. Please be warned.
#'
#' @docType package
#' @name spanish
NULL
