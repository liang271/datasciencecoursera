rankhospital <- function(state,outcome,num = "best"){
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
                if(num != "best" && num != "worst" && num %% 1 != 0){
                        stop("invaild number")
                }
                ## Return hospital name in that state with the given rank
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
                aimsubset <- aimsubset[order(aimsubset[,2],aimsubset$Hospital.Name,na.last = NA),]

                if(num =="best"){
                        return(aimsubset[1,1])
                }else if(num == "worst"){
                        return(aimsubset[nrow(aimsubset),1])
                }else {
                        return(aimsubset[num,1])
                }
}