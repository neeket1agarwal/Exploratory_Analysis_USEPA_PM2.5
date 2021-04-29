### Have total emissions from PM2.5 decreased in the United States 
### from 1999 to 2008? 
### Using the base plotting system, we make a plot showing 
### total PM2.5 emission from all sources for each of the years
### 1999, 2002, 2005, and 2008.

source("base.R")


png("plot1.png")
NEI[,c(4,6)] %>% group_by(year) %>%
                     summarise_all(sum) %>%
                        plot(type = "b", pch = 3, 
                             main = "Total PM2.5 Emissions in US from 1999 to 2008",
                             ylab = "Total PM2.5 Emmision(in tons)")
dev.off()
