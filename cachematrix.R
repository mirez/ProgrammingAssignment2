## Functions for creating matrix with inverse capability along with caching since it's such an expensive computation to run

## function creating a matrix object with caching capability

makeCacheMatrix <- function(x = matrix()) {
  inversed <- NULL
  set <- function(y) {
    #new matrix to set
    x <<- y
    
    # Prevent previously cached matrix inverse from being used
    # set inversed to null since new matrix set
    inversed <<- NULL
  }
  
  # return the matrix
  get <- function() x
  
  # return the cached matrix inverse
  getInverse <- function() inversed
  
  # sets the matrix inverse
  setInverse <- function(inverse) inversed <<- inverse
  
  # list of functions to expose out of the object
  # accessible from outside the object
  list(get = get,
       set = set,
       getInverse = getInverse,
       setInverse = setInverse)
}


## functionality that deals with inversion and then caches it via the passed in object's list of functions

cacheSolve <- function(x, ...) { 
  
  ## Return a matrix that is the inverse of 'x'
  inversed <- x$getInverse()
  
  # If it's not null return the cached answer
  if (!is.null(inversed)) {
    
    message("getting cached inversed data")
    
    return(inversed)
  }
  
  # current matrix
  mat <- x$get()
  
  # solve function invoked on matrix (solve computes inverse)
  message("cache miss, will recompute the inverse of matrix")
  inversed <- solve(mat, ...)
  
  # caches the result of the inverse computation via setInverse function
  x$setInverse(inversed)
  
  # return the inversed result from this function
  inversed
}
