## Function - makeCacheMatrix : creates a object to cache the inverse of matrix
## x refers to matrix and m refers to inverse of matrix 
## The function consist of 
## 1. set the value of matrix 
## 2. get the results of matrix
## 3. setinv saves the inverse of matrix
## 4. getinv get the results of inverse 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  setinv <- function(inv) m <<- inv
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## Function - cacheSolve : computes and saves inverse of the special object. 
## If inverse is calculated, function shall retrieve the inverse from cache. 
## x refers to matrix and m refers to inverse of matrix 
cacheSolve <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}
