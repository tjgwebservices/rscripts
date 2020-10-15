library(xml2)
library(rvest)
page<-read_html("http://data.treasury.gov/feed.svc/DailyTreasuryYieldCurveRateData?$filter=year(NEW_DATE)%20eq%202018")

entries<-html_nodes(page,  xpath = "//entry")

fieldnames<-xml_name(xml_find_all(entries, ".//*"))
fields<-xml_text(xml_find_all(entries, ".//*"))
df<-data.frame(fieldnames, fields)
head(df$fieldnames)
head(df$fields)
head(df, 20)
