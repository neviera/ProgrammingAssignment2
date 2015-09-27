## Put comments here that give an overall description of what your
## functions do

##Function makeCacheMatrix creates special matrix object, that contains functions
##to set source matrix cache, get source matrix, set inverse matrix to chache,
##get inverse matrix from cache

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL 
        set <- function(y) { 
            x <<- y      #cache source matrix 
            inv <<- NULL #reset inverse matrix
        }
        get <- function() x #retrieve matrix
        setinv <- function(solved) inv <<- solved  #set calculated inverse matrix
        getinv <- function() inv  #retrieve cahced inverse matrix
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Function cacheSolve Calculates inverse matrix. if inverse matrix has already 
##been calculated and input (source) matrix is the same (not changed), then gets
##previously calculated inverse matrix from cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv<- x$getinv() #retrieve inverse matrix
        data <- x$get() #retrieve source matrix
        if(!is.null(inv)&(data==x)) { #if inverse matrix exists and source 
                                    #matrix is same, return cached result
            message("getting cached inverse matrix")
            return(m)
        }
        inv <- solve(data, ...) #calculate inverse matrix
        x$setinv(inv) #store calculated inverse matrix
        inv #return calculated inverse matrix
    }
