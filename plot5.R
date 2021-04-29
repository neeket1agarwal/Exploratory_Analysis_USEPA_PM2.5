### How have emissions from motor vehicle sources changed from 
### 1999–2008 in Baltimore City?
    

source("base.R")
plotdata <- NEI[NEI$fips=="24510"&NEI$type=="ON-ROAD",c(4,6)] %>% 
                  group_by(year) %>%
                        summarise_all(sum)

png("plot5.png")

g <- plotdata %>% ggplot(mapping = aes(year,Emissions))
g + geom_point() + geom_line() + 
      labs(title = "Total PM2.5 Emissions in Baltimore City from motor vehicle sources",
           y = expression("Total "*PM[2.5]*" Emissions (in tons)"))

dev.off()
