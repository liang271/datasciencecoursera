##Q01
fileurl="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl,destfile = "fdata.csv")
fdata <- read.csv("fdata.csv")
fdata.cut <- which( fdata$AGS == 6 & fdata$ACR==3)
fdata.cut
##Q02
jpgurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileurl,destfile = "jeff.jpg")
install.packages("jpeg")
library(jpeg) 
jeff<-readJPEG("jeff.jpg",native=TRUE)
quantile(jeff, probs = c(0.3, 0.8))
##Q03
fileurl03_1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileurl03_2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileurl03_1,destfile = "fgdp.csv", )
download.file(fileurl03_2,destfile = "contury.csv")
fgdp <- read.csv("fgdp.csv",skip = 4)[1:190,]
country <- read.csv("contury.csv",)
matchdata <- fgdp[fgdp$X %in% country$CountryCode,]
matchdata$X.1 <- as.numeric(matchdata$X.1)
nrow(matchdata)
matchdata <- matchdata[order(matchdata$X.1, decreasing = T), ] 
matchdata[13,]
##Q04
library(dplyr)
mergeDT <- merge(country,fgdp,by.x = "CountryCode",by.y = "X")
mergeDT$X.1 <- as.numeric(mergeDT$X.1)
GDPRanking <- group_by(mergeDT,Income.Group)
summarise(GDPRanking,mean(X.1,na.rm = TRUE))
##Q05
install.packages("Hmisc")
library(Hmisc)
mergeDT$X.1 <- as.numeric(mergeDT$X.1)
mergeDT$RankGroup <- cut2(mergeDT$X.1, g = 5)
table(mergeDT$RankGroup,mergeDT$Income.Group)
