# spanish: R package for functions on spanish data [![Build Status](https://travis-ci.org/rOpenSpain/spanish.svg?branch=master)](https://travis-ci.org/rOpenSpain/spanish)  [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/spanish)](http://cran.r-project.org/package=spanish) [![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable) [![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/spanish)](http://cran.r-project.org/web/packages/spanish/index.html) [![Rdoc](http://www.rdocumentation.org/badges/version/spanish)](http://www.rdocumentation.org/packages/spanish)

![spanish logo](man/figures/logo.png)



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

### to_words() ###
**to_words()** is a quick & dirty (optimization pending) function to translate integers to spanish spelled monetary quantities.
Given a numerical quantity **to_words** translates it to spanish. 

```
to_words(3245235)
[1] "tres millones doscientos cuarenta y cincomil doscientos treinta y cinco"
```
This function can be used on dataframes with apply. Try random numbers.
```
a <- rnorm(n = 12,mean = 1000000,sd = 6000000)
a <- abs(a)  # non negative

> sapply(a, to_words)
 [1] "un millón setecientos ochenta y cuatromil quinientos diez"                 "cuatro millones setecientos sesenta y seismil novecientos noventa y nueve"
 [3] "cinco millones setecientos mil setecientos once"                           "cinco millones trescientos noventa y ochomil setecientos treinta y cuatro"
 [5] "setecientos sesenta y mil cuatrocientos  y cinco"                          "doscientos ochenta y seismil setecientos "                                
 [7] "un millón novecientos sesenta y sietemil cincuenta y tres"                 "ciento noventa y seismil novecientos treinta y seis"                      
 [9] "siete millones doscientos ochenta y ochomil cuatrocientos ochenta y cinco" "dos millones ciento  y sietemil quinientos cincuenta y siete"             
[11] "seis millones ochocientos ochenta y ochomil doscientos  y uno"             "seis millones sesentamil novecientos cuarenta y siete"                    
```

### Requirements:
- magrittr must be installed.
- to_number() needs clean text. So it must be previously cleaned & removed extraneous words, symbols or cents.
- to_number() quantities MUST be written in a correct Spanish (this is not a grammar tool).
- to_words() does not keep sign. If negative numbers are provided, their positive is used for conversion.
- The upper limit is up to the millions range in both cases.

### TO DO

- Try to clean text prior to be used by to_number()
- Include decimals (cents) in to_number() function
- Force to_words() keep sign
- Add Cadastral Geolocation function

