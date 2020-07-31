corr <- function(directory,threshold = 0 ){
  collection <- vector()
  nobs <- as.numeric(0)
  caltable <- completes("specdata", 1:332)
  nobs <- caltable$nobs
  id <- caltable$id[nobs > threshold]
  for( i in id ){
    allcsv <- na.omit(read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep=''), comment.char = "", header = T))
    coresult<- cor(allcsv$sulfate, allcsv$nitrate)
    collection <- c(collection,coresult)
    }
  collection
}