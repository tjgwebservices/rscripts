library(readr)
InterestRates2020 <- read_csv("~/InterestRates2020.csv", 
                              col_types = cols(Date = col_date(format = "%m/%d/%Y")))


plot(InterestRates2020$Mo1~InterestRates2020$Date, ylim=c(0, 3), xlim=c(as.Date("2020-01-01"),as.Date("2020-07-12")),
     xlab = "Date", ylab="Interest Rates", main="2020 Interest Rates 3 Month",  type="o", major.ticks="years", 
     major.format="%d-%b-%Y", minor.ticks=FALSE, las=1, cex.axis=0.8) 


plot(InterestRates2020$Yr1~InterestRates2020$Date, ylim=c(0, 3), xlim=c(as.Date("2020-01-01"),as.Date("2020-07-12")),
     xlab = "Date", ylab="Interest Rates", main="2020 Interest Rates 1 Year",  type="o", major.ticks="years", 
     major.format="%d-%b-%Y", minor.ticks=FALSE, las=1, cex.axis=0.8) 
