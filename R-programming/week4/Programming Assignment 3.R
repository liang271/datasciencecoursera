source("best.R")
source("rankhospital.R")
source("1.R")
source("rankall.R")
##1
best("SC", "heart attack")
##2
best("NY", "pneumonia")
##3
best("AK", "pneumonia")
##4
rankhospital("NC", "heart attack", "worst")
##5
rankhospital("WA", "heart attack", 7)
##6
rankhospital("TX", "pneumonia", 10)
##7
rankhospital("NY", "heart attack", 7)
##8
r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)
##9
r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)
##10
r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)