completes <- function(directory,id = 1:332){
  nobs <- numeric(0)
  for (i in id) {
    allcsv <- na.omit(read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep=''), comment.char = "", header = T))
    nobs <- c(nobs,nrow(allcsv))
  }
  data.frame("id" = id, "nobs" = nobs)
}
