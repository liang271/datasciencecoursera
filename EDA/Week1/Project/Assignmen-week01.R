#get data 
library(data.table)
library(datasets)
library(dbplyr)
epc <- data.table::fread("household_power_consumption.txt",na.strings = "?")
epc$Date <- as.Date(epc$Date,  "%d/%m/%Y")
epc <- epc[,datetime:= paste(Date,Time)]
epc<- epc[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
epc$Global_active_power <- as.numeric(epc$Global_active_power)

#plot 1
png("plot1.png", width=480, height=480)
hist(epc[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()

#plot2
epc$datetime <- as.POSIXct(epc$datetime)
png("plot2.png", width=480, height=480)
plot(x = epc[, datetime]
     , y = epc[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

#plot3
png("plot3.png", width=480, height=480)
plot(epc[, datetime], epc[, Sub_metering_1],type="l", xlab="", ylab="Energy sub metering")
lines(epc[, datetime], epc[, Sub_metering_2], col = "red")
lines(epc[, datetime], epc[, Sub_metering_3], col = "blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
dev.off()

#plot4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
##Plot 4-1
plot(epc[, datetime], epc[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

##Plot 4-2
plot(epc[, datetime],epc[, Voltage], type="l", xlab="datetime", ylab="Voltage")

##Plot 4-3
plot(epc[, datetime], epc[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(epc[, datetime], epc[, Sub_metering_2], col="red")
lines(epc[, datetime], epc[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

##Plot 4-4
plot(epc[, datetime], epc[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()