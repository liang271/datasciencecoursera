#get data
library("data.table")
library("dplyr")
SCC <- data.table::as.data.table(readRDS("exdata_data_NEI_data/Source_Classification_Code.rds"))
SSCC <- data.table::as.data.table(readRDS("exdata_data_NEI_data/summarySCC_PM25.rds"))

#plot 3
SSCC[, numEmissions := as.numeric(SSCC$Emissions)]
SSCC_plot2 <- SSCC[fips == "24510",]
library("ggplot2")
png(filename = "plot3.png")

ggplot(SSCC_plot2,aes(factor(year),numEmissions,fill=type))+
        geom_bar(stat="identity")+
        facet_grid(.~type)

dev.off()