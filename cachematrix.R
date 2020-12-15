## Pair of functions that cache the inverse of a matrix
## 

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  
  ## Initialize the inverse cache variable
  i <- NULL
  
  ## Set the matrix
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  
  ## Get the matrix
  get <- function() x
  
  ## Set the inverse of the matrix
  setInverse <- function(solve) i <<- solve
  
  ## Get the inverse of the matrix
  getInverse <- function() i
  
  # Return a list of the functions
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned
## by makeCacheMatrix above. If the inverse has already been calculated
## (and the matrix has not changed), then the cachesolve should retrieve
## the inverse from the cache.

cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  i <- x$getInverse()
  
  ## It's already in in the cached data?
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  
  ## Get the matrix 
  data <- x$get()
  
  ## Inverse of the input
  i <- solve(data)
  
  ## Set the inverse
  x$setInverse(m)
  
  ## Return the matrix
  m
}