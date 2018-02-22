

# spanish: R package for functions on spanish data [![Build Status](https://travis-ci.org/rOpenSpain/spanish.svg?branch=master)](https://travis-ci.org/rOpenSpain/spanish)  [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/spanish)](http://cran.r-project.org/package=spanish) [![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable) [![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/spanish)](http://cran.r-project.org/web/packages/spanish/index.html) [![Rdoc](http://www.rdocumentation.org/badges/version/spanish)](http://www.rdocumentation.org/packages/spanish)

![spanish logo](man/figures/logo.png)
<img src="tools/readme/logo.png" align="right" />

There are some special data in spain that is not addressed by any R package or function. Mainly on data processing and NLP.
This package is my humble (and objectionable) attempt of helping programmers working with this kind of data creating some functions for it.

### Installation: ###

*spanish* is available on CRAN:

```
install.package("spanish")
```

Development version:

```
devtools::install_github("verajosemanuel/spanish")
```

### to_number() ###
**to_number()** is a quick & dirty function to translate spanish spelled monetary quantities into their numerical counterparts.
Given a numerical quantity spelled in spanish **to_number** translates it to integer.

```
to_number("dosmil ciento cuarenta y ocho")
[1] 2148
```
This function can be used on dataframes with lapply. Try the provided example dataframe (cantidades).
```
cantidades$var3 <- lapply(cantidades$var2, to_number)

head(cantidades[ , c("var2","var3")])
                                                                var2    var3
1                                                                DOS       2
2                                       CINCO MIL NOVECIENTOS VEINTE    5920
3 DOS MILLONES QUINIENTOS VEINTISIETEMIL DOSCIENTOS CUARENTA Y CINCO 2527245
4                   cientoveintisietemil cuatrocientos ochenta y dos  127482
5                               Dos mil cuatrocientos noventa y seis    2496
6                                                    dosmil cuarenta    2040
```



### Requirements:
- magrittr must be installed.
- to_number() needs clean text. So it must be previously cleaned & removed extraneous words, symbols or cents.
- Quantities MUST be written in a correct Spanish (this is not a grammar tool).
- The upper limit is up to the millions range.

### TO DO

- Try to clean text prior to conversion automagically
- Include decimals (cents) into conversion
- reverse conversion (from numbers to chars)
- Add Cadastral Geolocation function

