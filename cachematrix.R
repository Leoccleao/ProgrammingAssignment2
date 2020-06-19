## creates a special "matrix" object that can cache its inverse

## Establishes sets and getters for solve

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
  
}


## Retrieves cached solve data or solves matrix.

cacheSolve <- function(x, ...) {
    m <- x$getsolve()
    if(!is.null(m)) {
      message("getting cached data")## Confirms the use of cached data
      return(m)## Outputs M
    }
    data <- x$get()
    m <- solve(data)
    x$setsolve(m)
    m
}
