
source("pollutionmean.R")
source("completes.R")
source("corr.R")
cr <- corr("specdata")  
cr
##1-4
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")
##5-6
cc <- completes("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
cc <- completes("specdata", 54)
print(cc$nobs)
##7
RNGversion("3.5.1")  
set.seed(42)
cc <- completes("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
##8
cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
##9
cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
##10
cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))