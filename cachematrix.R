## Caching the inverse of a matrix
## Matrix inversion is usually a costly computation
## So caching may have more benifits than repeated computation

## makeCacheMatrix creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
     inv <- NULL
     set <- function(y){
            x <<- y
            inv <- NULL
   }
     get <- function() x
     setInverse <- function(inverse) inv <<- inverse
     getInverse <- function() inv
     list(set=set,get=get,setInverse=setInverse,getInverse=getInverse) 

}


## The function computes the inverse of the special "matrix" created by makeCacheMatrix
## If the inverse has already been calculated (matrix remains the same),then it retrieve the inverse from cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of "x"
      inv <- x$getInverse()
      if(!is.null(inv)){
          message("getting cached data")
          return(inv)
      }
      
      mat <- x$get()
      inv <- solve(mat,...)
      x$setInverse(inv)
      inv
}
