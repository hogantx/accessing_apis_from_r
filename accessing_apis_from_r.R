

install.packages("httr")


library(httr)
library(lubridate)
library(jsonlite)

remove.packages("plotly")
remove.packages("sparklyr")

library(httr)
library(jsonlite)


options(stringsAsFactors = FALSE)


### read API
url  <- "http://api.epdb.eu"
path <- "eurlex/directory_code"
raw.result <- GET(url = url, path = path)

### inspect data, get status code
names(raw.result)
raw.result$status_code

### convert from json
this.raw.content <- rawToChar(raw.result$content)
this.content <- fromJSON(this.raw.content)

class(this.content)
this.content[[1]]
this.content[[2]]





url <- "https://data.austintexas.gov/resource/2hik-84fu.json"
raw.result <- GET(url = url)



library(RSocrata)



tmp <- read.socrata(url, stringsAsFactors = FALSE)
str(tmp)

tmp$rep_time <- as.numeric(tmp$rep_time)

hist(tmp$rep_time)


sort(table(tmp$crime_type))



str(tmp)

library(dplyr)
tmp <- tmp %>% filter(zip_code == "78750")



summary(tmp)
