## For the validation the example below
## p <- makeCacheMatrix(matrix(c(0,2,2,0),2,2))
## cacheSolve(p)
## cacheSolve(p)   

makeCacheMatrix <- function(x = matrix()) {

  ## Initialization the variable inverse to null
  inverse <- NULL
  
  ## Create the setVal function for storing x and inverse 
  setVal <- function(y) {
    x <<- y    # Initialization of the matrix
    inverse <<- NULL
  }  
  ## Create getVal function ton return x
  getVal <- function() x
  ## Create setinvrs to set the value of inverse to ValInv
  setinvrs <- function(valInv) inverse <<- valInv
  ## Create getinvrs to return to retrieve value of inverse
  getinvrs <- function() inverse
  
  # Return the matrix as defined
  list(setVal = setVal, getVal = getVal,setinvrs = setinvrs, getinvrs = getinvrs)
}

cacheSolve <- function(x) {

  ## Check the cache for the inverse
  valInv <- x$getinvrs()
  
  ## Control structure
  if(!is.null(valInv)) {
    message("getting cached data")
    return(valInv)
  }
  ## matrix and find the inverse
  data <- x$getVal()
  valInv <- solve(data)  
  
  ## Cache the inverse
  x$setinvrs(valInv)
  
  ## Return inverse  
  valInv  
}