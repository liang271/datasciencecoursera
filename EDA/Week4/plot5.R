#get data
library("data.table")
library("dplyr")
library("ggplot2")
SCC <- data.table::as.data.table(readRDS("exdata_data_NEI_data/Source_Classification_Code.rds"))
SSCC <- data.table::as.data.table(readRDS("exdata_data_NEI_data/summarySCC_PM25.rds"))

#plot 5
png(filename = "plot5")

vehicleSCC <- SCC[grep("Vehicle",EI.Sector),]
baltimore <- SSCC[SSCC$fips == "24510",]
combinedata <- baltimore[(baltimore$SCC %in% vehicleSCC$SCC),]

ggplot(combinedata,aes(factor(year),Emissions)) +
        geom_bar(stat="identity") +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
        labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

dev.off()
