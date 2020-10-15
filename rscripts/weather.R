library(RCurl)
library(XML)

require(RCurl)

testurl <- getURL("forecast.weather.gov/MapClick.php?lat=29.803&lon=-82.411&FcstType=digitalDWML", 
                  httpheader = c("User-Agent"="Mozilla/5.0 (Windows NT 10.0; Win64; x64)"))


xml.url <- "https://w1.weather.gov/xml/current_obs/KSAT.xml"
script  <- getURL(xml.url,
                  httpheader = c("User-Agent"="Mozilla/5.0 (Windows NT 10.0; Win64; x64)"))
doc     <- xmlParse(script)
titles<- xpathSApply(doc,'//item/title',xmlValue)
descriptions<-xpathSApply(doc,'//item/description',xmlValue)
pubdates<-xpathSApply(doc,'//item/pubDate',xmlValue)
links <-xpathSApply(doc,'//item/link',xmlValue)
dfa<-data.frame(cbind(titles,pubdates,links))
dfa$titles<-as.character(dfa$titles)
dfa$pubdates<-as.POSIXct(strptime(
  gsub(" CST", "", pubdates),  "%a, %d %b %Y %H:%M:%S"
))
dfa$links<-as.character(dfa$links)

script
doc
latitude<- xpathSApply(doc,'//latitude',xmlValue)
longitude<- xpathSApply(doc,'//longitude',xmlValue)
longitude<- xpathSApply(doc,'//longitude',xmlValue)
