## Createing a special matrix object that can cache its inverse
makeCacheMatrix <- function( m = matrix() ) {
       
        inv <- NULL
        set <- function( matrix ) {
                mtx <<- matrix
                inv <<- NULL
        }
        get <- function() {
                mtx
        }
        setInver <- function(inverse) {
                inv <<- inverse
        }
        getInverse <- function() {
                inv
        }
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned by 
##makeCacheMatrix above. If the inverse has already been calculated (and 
##the matrix has not changed),then the cachesolve should retrieve the 
##inverse from the cache.
cacheSolve <- function(x, ...) {
        
        mtx <- x$getInverse()
        
        if( !is.null(mtx) ) {
                message("getting cached data")
                return(mtx)
        }
        
        data <- x$get()
        
        mtx <- solve(data) %*% data
        
        x$setInverse(mtx)
        
        mtx
}