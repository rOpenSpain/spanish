.onLoad <- function(libname, pkgname) {
  if (!interactive() || stats::runif(1) > 0.1) return()
  tips <- c(
    "https://github.com/verajosemanuel/spanish",
    "https://github.com/verajosemanuel/spanish"
  )
  tip <- sample(tips, 1)
  packageStartupMessage(paste(strwrap(tip), collapse = "\n"))
}

.onAttach <- function(libname, pkgname) {
  if (!interactive() || stats::runif(1) > 0.1) return()
  tips <- c(
    "https://github.com/verajosemanuel/spanish",
    "https://github.com/verajosemanuel/spanish"
  )
  
  tip <- sample(tips, 1)
  packageStartupMessage(paste(strwrap(tip), collapse = "\n"))
}
