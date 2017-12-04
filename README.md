

# spanish: R package for functions on spanish data [![Build Status](https://travis-ci.org/verajosemanuel/spanish.svg?branch=master)](https://travis-ci.org/verajosemanuel/spanish)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/spanish)](https://cran.r-project.org/package=spanish)
<img src="tools/readme/logo.png" align="right" /> 

### Installation: ###

 ```
devtools::install_github("verajosemanuel/spanish")
```

There's some special data in spain that's not addressed by any R package or function.
This package is my humble (and objectionable) attempt of helping programmers working with this kind of data.

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

### geocode_cadastral() ###
**geocode_cadastral** obtains longitude/latitude from valid cadastral references or kml files from catastro.

```
geocode_cadastral("0636105UF3403N", parse_files = FALSE)

[1] "36.5209422288168,-4.89298751473745"

```

Use lapply to geocode cadastral references from dataframe columns.

```
cadastral_references$new <- lapply(cadastral_references$cadref1, geocode_cadastral)

cadastral_references
         cadref1        cadref2                                new
1 2614501VK6621S 1449804NH1014N -3.44129716598736,40.3007548071216
2 2715807VK6621S 3880109CD6038S -3.44034755388475,40.3008975152619
3 2744702DF3824D 9501722DD6890B  2.19479121426678,41.4065056978248
4 0944328DF3804D 1617647TF8611F  2.17206636096108,41.4071068008502
5 8742806DF2884B 7893306CS7479S  2.14651391794721,41.4046077850113
6 9314903NH3591C 9701703XG8890B -8.51948430067999,42.9131469314961
```

separate generated geocode "new" into columns (lon/lat) usign tidyr

```
library(tidyr)

separate(cadastral_references, new, into = c('longitude','latitude'), sep = "," )

         cadref1        cadref2         longitude         latitude
1 2614501VK6621S 1449804NH1014N -3.44129716598736 40.3007548071216
2 2715807VK6621S 3880109CD6038S -3.44034755388475 40.3008975152619
3 2744702DF3824D 9501722DD6890B  2.19479121426678 41.4065056978248
4 0944328DF3804D 1617647TF8611F  2.17206636096108 41.4071068008502
5 8742806DF2884B 7893306CS7479S  2.14651391794721 41.4046077850113
6 9314903NH3591C 9701703XG8890B -8.51948430067999 42.9131469314961

```

When folder is source. We may process each kml the same way as remote URL.

```

 files <- list.files("folder", full.names = T)

 for (f in files) {
  coords <- geocode_cadastral(f, parse_files = TRUE)
  df <- as.data.frame(rbind(df , as.data.frame(coords, stringsAsFactors = F )))
 }

```

separate lat/lon into columns the same as before

```

 df <- tidyr::separate(coords, into = c("longitude","latitude"), sep = "," )

```


### Requirements:
- magrittr must be installed.
- to_number() needs clean text. So it must be previously cleaned & removed extraneous words, symbols or cents.
- Quantities MUST be written in a correct Spanish (this is not a grammar tool).
- The upper limit is up to the millions range.
- geocode_cadastral() requests to catastro website.

# BE WARNED: You'll be banned if many requests to catastro are made in short time. #
- Because of that geocode_cadastral() waits two seconds between requests.
