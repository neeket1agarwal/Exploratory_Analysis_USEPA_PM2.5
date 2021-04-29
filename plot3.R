### Of the four types of sources indicated by the type (point, 
### nonpoint, onroad, nonroad) variable, which of these four 
### sources have seen decreases in emissions from 1999–2008 for 
### Baltimore City? Which have seen increases in emissions from 99–08?
### Using the ggplot2 plotting system we make a plot answering this question.

source("base.R")

plotdata <- NEI[NEI$fips == "24510",4:6] %>%
      group_by(type,year) %>%
      summarise_all(.funs = sum)


png("plot3.png")

g <- plotdata %>% ggplot(mapping = aes(year,Emissions,color=type))
g + geom_point() + geom_line() + 
            labs(title = "Total PM2.5 Emissions in Baltimore City based on types of sources",
                  y = expression("Total "*PM[2.5]*" Emissions (in tons)"))

dev.off()
