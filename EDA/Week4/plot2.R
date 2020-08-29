#get data
library("data.table")
library("dplyr")
SCC <- data.table::as.data.table(readRDS("exdata_data_NEI_data/Source_Classification_Code.rds"))
SSCC <- data.table::as.data.table(readRDS("exdata_data_NEI_data/summarySCC_PM25.rds"))
#plot 2
SSCC[, numEmissions := as.numeric(SSCC$Emissions)]

png(filename = "plot2.png", width=480, height=480, bg = "transparent")

SSCC_plot2 <- SSCC[fips == "24510",]

target_2<- SSCC_plot2 %>% 
        group_by(year) %>% 
        summarise(totalemiss = sum(numEmissions)) 
target_2 <- as.data.frame(target_2)

barplot(target_2$year,height = target_2$totalemiss,
        main = 'Total PM2.5 Emissions in Baltimore City 1999-2008',
        ylab = 'Total PM2.5 Emissions (tons)',
        xlab = 'Year')

dev.off()