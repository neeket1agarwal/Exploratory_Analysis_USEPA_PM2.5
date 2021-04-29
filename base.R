library(ggplot2)
library(dplyr)

#Read data files into NEI and SCC
if(!"NEI" %in% ls()){
      NEI <- readRDS("data/summarySCC_PM25.rds")
      str(NEI)
}

if(!"SCC" %in% ls()){
      SCC <- readRDS("data/Source_Classification_Code.rds")
}