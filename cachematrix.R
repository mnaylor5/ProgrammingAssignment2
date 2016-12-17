## This function calculates the inverse of a matrix
## However, it checks the cache to see if it's been done before

## this function creates something in place of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function either finds the matrix in the cache or calculates the inverse

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message('getting cached data')
    return(m)
  }
  m <- solve(x)
  x$setsolve(m)
  m
}
