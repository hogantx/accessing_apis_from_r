

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



library(RSocrata)

a <- "https://data.austintexas.gov/resource/spbg-9v94.json" #2015
b <- "https://data.austintexas.gov/resource/8iue-zpf6.json" #2016
c <- "https://data.austintexas.gov/resource/3t4q-mqs5.json" #2017
d <- "https://data.austintexas.gov/resource/pgvh-cpyq.json" #2018


crime_reports <- "https://data.austintexas.gov/resource/fdj4-gpfu.json"
tmp <- read.socrata(crime_reports, stringsAsFactors = FALSE)
str(tmp)

tmp$rep_time <- as.numeric(tmp$rep_time)

hist(tmp$rep_time)


sort(table(tmp$crime_type))



str(tmp)

library(lubridate)
tmp$year <- year(tmp$occ_date)
table(tmp$year)


setwd("C:/Users/bhogan/Documents/R/austin open data")
saveRDS(tmp, file = "austin_police_crime_2003_2020") 

library(dplyr)
tmp <- tmp %>% filter(zip_code == "78750")



summary(tmp)
