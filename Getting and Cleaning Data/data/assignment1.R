install.packages("xlsx")
library(xlsx)
install.packages("XML")
library(XML)
library(data.table)
##01
if (!file.exists("data")){
        dir.create("data")
}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,destfile = "./data/getdata.csv")
dateDownloaded <- date()
setwd("E:/rrepo/datasciencecoursera/GACD/Week1/data")
dt01 <- fread("getdata.csv")
dt01[,VALTF:= VAL>=24]
dt01[,.N,by=VALTF]
##02
##The answer is: tidy data has one variable per column… FES has: gender, marital status and empoloyement status.
##03
url03 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url03,destfile = "./NGAP.xlsx")
dateDownloaded03 <- date()
rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx(file="NGAP.xlsx", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex, header=TRUE)
sum(dat$Zip*dat$Ext,na.rm=T)
##04
url04 <- "http://d396qusza40orc.cloudfront.net/getdata/data/restaurants.xml"
doc <- xmlTreeParse(file=url04,useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
zipcode <- xpathSApply(root.Node, "//zipcode", xmlValue)
length(zipcode[zipcode==21231])
##5
url05 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url05,destfile = "./pid.csv")
DT <- fread(input="pid.csv", sep=",")
mean(DT$pwgtp15,by=DT$SEX)

