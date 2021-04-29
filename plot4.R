### Across the United States, how have emissions from coal
### combustion-related sources changed from 1999–2008?
      

source("base.R")

CoalSCC1 <- as.vector(SCC$SCC[grep("coal",SCC$EI.Sector,ignore.case = TRUE)])
CoalSCC2 <- as.vector(SCC$SCC[grep("Comb.*Coal", SCC$Short.Name,ignore.case = TRUE)])

CoalNEI <- NEI[NEI$SCC %in% c(CoalSCC1,CoalSCC2), c(4,6)] 

plotdata <- CoalNEI %>% group_by(year) %>%
                        summarize_all(sum)

png("plot4.png")

g <- ggplot(plotdata,aes(year,Emissions))
g+geom_point()+geom_line() + 
      labs(title = "Total PM2.5 Emissions in US from coal combustion related sources",
           y = expression("Total "*PM[2.5]*" Emissions (in tons)"))

dev.off()
