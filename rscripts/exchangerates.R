xml.url <- "https://www.fx-exchange.com/ils/rss.xml"
script  <- getURL(xml.url,
                  httpheader = c("User-Agent"="Mozilla/5.0 (Windows NT 10.0; Win64; x64)"))
doc     <- xmlParse(script)
script
doc
ilsusd<- xpathSApply(doc,'//item/description',xmlValue)
guid<- xpathSApply(doc,'//item/guid',xmlValue)
ilsusd[90]
head(ilsusd,20)
ilsusd[80:90]
