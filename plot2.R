### Have total emissions from PM2.5 decreased 
### in the Baltimore City, Maryland (fips == "24510") 
### from 1999 to 2008?
### Using the base plotting system we make
### a plot answering this question.

source("base.R")


png("plot2.png")
NEI[NEI$fips=="24510",c(4,6)] %>% group_by(year) %>%
      summarise_all(sum) %>%
      plot(type = "b", pch = 3,
           main = "Total PM2.5 Emissions in US from 1999 to 2008",
           ylab = "Total PM2.5 Emmision(in tons)")

dev.off()
