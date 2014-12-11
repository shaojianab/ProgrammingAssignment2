## My functions will find the inversed matrix firstly, if it is not find,
## then it will calculate a inversed matrix for the given matrix, and save it
##in cache.

## This function create a matrix that contain four functions for the
##given matrix just like the example.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  return (list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve))
  
}


## This function will find the x's inversed matrix, if not found in the cache,
##it will calculate the inveresed matrix, and save it in cache.

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  return (m)
        ## Return a matrix that is the inverse of 'x'
}
