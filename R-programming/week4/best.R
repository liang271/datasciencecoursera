best <- function(state,outcome){
        ## Read outcome data
        rawdata <- read.csv("outcome-of-care-measures.csv",na.strings = "Not Available",header =TRUE, stringsAsFactors=F)
        ##Check that state and outcome are valid
        validoutcome <- c('heart attack','heart failure', 'pneumonia')
        if(!(state %in% unique(rawdata$State))){ 
          stop("Invalid State")
        }
        if(!(outcome %in% validoutcome)){
          stop("invalid outcome")
        } 
        ##Return hospital name in that state with lowest 30-day death  
        names(rawdata)[c(11,17,23)] <- validoutcome
        data <- rawdata[rawdata$State == state,c(2,11,17,23)]
        if(outcome=="heart attack"){
          col <- 2
        } else if(outcome=="heart failure"){
          col <- 3
        } else if(outcome=="pneumonia"){
          col <- 4
        } else{
          stop("invalid outcome")
        }
        aimsubset <- data[,c(1,col)]
        aimsubset <- aimsubset[order(aimsubset[,2]),]
        answer<- aimsubset[1,1]
        answer
}