#get data
library("data.table")
library("dplyr")
SCC <- data.table::as.data.table(readRDS("exdata_data_NEI_data/Source_Classification_Code.rds"))
SSCC <- data.table::as.data.table(readRDS("exdata_data_NEI_data/summarySCC_PM25.rds"))

#plot 1
SSCC[, numEmissions := as.numeric(SSCC$Emissions)]
target<- SSCC %>% 
  group_by(year) %>% 
  summarise(totalemiss = sum(numEmissions)) 
target <- as.data.frame(target)

png(filename = "plot1.png", width=480, height=480, bg = "transparent")

barplot(target$year,height = target$totalemiss,
        main = 'Total PM2.5 Emissions in United States 1999-2008',
        ylab = 'Total PM2.5 Emissions (tons)',
        xlab = 'Year')

dev.off()

