.onLoad <- function(libname, pkgname) {
  if (!interactive() || stats::runif(1) > 0.1) return()
  tips <- c(
    "ESmisc package is deprecated due to name change needed for CRAN submission.\n Install 'spanish' package instead:\n https://github.com/verajosemanuel/spanish",
    "ESmisc package is deprecated due to name change needed for CRAN submission.\n Install 'spanish' package instead:\n https://github.com/verajosemanuel/spanish"
  )
  tip <- sample(tips, 1)
  packageStartupMessage(paste(strwrap(tip), collapse = "\n"))
}

.onAttach <- function(libname, pkgname) {
  if (!interactive() || stats::runif(1) > 0.1) return()
  tips <- c(
    "ESmisc package is deprecated due to name change needed for CRAN submission.\n Install 'spanish' package instead:\n https://github.com/verajosemanuel/spanish",
    "ESmisc package is deprecated due to name change needed for CRAN submission.\n Install 'spanish' package instead:\n https://github.com/verajosemanuel/spanish"
  )
  
  tip <- sample(tips, 1)
  packageStartupMessage(paste(strwrap(tip), collapse = "\n"))
}
