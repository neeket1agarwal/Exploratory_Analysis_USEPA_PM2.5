### We compare emissions from motor vehicle sources in Baltimore City
### with emissions from motor vehicle sources in Los Angeles County, 
### California (fips == "06037"). 
### Which city has seen greater changes over time in motor vehicle emissions?


source("base.R")
plotdata <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & 
                  NEI$type=="ON-ROAD",c(1,4,6)] %>% 
                        group_by(year,fips) %>%
                              summarise_all(sum) %>%
                                    mutate(County = if_else(fips=="06037","LosAngeles","Baltimore"))


png("plot6.png")
g <- ggplot(plotdata,aes(year,log10(Emissions)))

g + geom_point() + geom_line() + facet_grid(County~.) +
      labs(title = "Motor vehicle Emissions in Baltimore City and Los Angeles",
           y = expression("On-Road "*PM[2.5]*" Emissions (in "*log[10]*" scale)"))

dev.off()

