#get data
library("data.table")
library("dplyr")
library("ggplot2")
SCC <- data.table::as.data.table(readRDS("exdata_data_NEI_data/Source_Classification_Code.rds"))
SSCC <- data.table::as.data.table(readRDS("exdata_data_NEI_data/summarySCC_PM25.rds"))

#plot 6
vhcesSCC <- SCC[grepl("vehicle", SCC.Level.Two, ignore.case=TRUE),SCC]
vhcesSSCC <- SSCC[SSCC[,SCC] %in% vhcesSCC,]

vhcesBaltimore <- vhcesSSCC [fips == "24510",]
vhcesBaltimore[, city := c("Baltimore City")]

vhcesLA <- vhcesSSCC [fips == "06037",]
vhcesLA[, city := c("Los Angeles")]

combinedata <- rbind(vhcesBaltimore,vhcesLA)

png("plot6.png")

ggplot(combinedata, aes(factor(year), Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(.~city) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

dev.off()
