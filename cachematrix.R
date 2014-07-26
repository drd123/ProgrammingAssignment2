## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Creates a list with 4 functions
## set -- set the matrix
## get -- get the matrix
## setinverse -- sets the inverse of the matrix
## getinverse -- gets the inverse of the matrix.
makeCacheMatrix <- function(x = matrix()) {
         m_inverse <- NULL
         set <- function(y) {
             x <<- y
             m_inverse <<- NULL
         }
         get <- function() x
         setinverse <- function(inverse) m_inverse <<- inverse
         getinverse <- function() m_inverse
         list(set = set, get = get,
              setinverse = setinverse,
              getinverse = getinverse)
}


## Writ"e a short comment describing this function
##  x is expected to be a list resturned by makeCacheMatrix
## this function will get the cached inverse of the matrix
## if the inverse is null, it will calculate the inverse and
## the next time, the cached inverse will be returned.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if(!is.null(inv)){
            message("getting cached inverse")
            return(inv)
        }
        data <- x$get()
        theinverse <- solve(data, ...)
        x$setinverse(theinverse)
        theinverse 
}
