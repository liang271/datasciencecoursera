#get data
library("data.table")
library("dplyr")
library("ggplot2")
SCC <- data.table::as.data.table(readRDS("exdata_data_NEI_data/Source_Classification_Code.rds"))
SSCC <- data.table::as.data.table(readRDS("exdata_data_NEI_data/summarySCC_PM25.rds"))

#plot 4
png("plot4.png")

coalSCC <- SCC[grep("Coal",EI.Sector),]
coalSSCC <- SSCC[SSCC$SCC %in% coalSCC$SCC,]

ggplot(coalSSCC,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity") +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

dev.off()
