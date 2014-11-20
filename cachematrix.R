## Initial commit to test 
## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(varMatrix = matrix()){
        #Add checks for non ivertible matrices
  
        matrixInverse <- NULL
        
        getInverse <- function(){
              return(matrixInverse)
        }
        
        setInverse <- function(inverse){
              matrixInverse <<- inverse
        }   
  
        getValue <- function(){
              return(varMatrix)
        }
        
        #setvalue <- function(varMatrix){
         #     varMatrix <- varMatrix
        #}
        
        invisible(list(getValue = getValue, setInverseM = setInverse,  getInverse = getInverse))
}


## Write a short comment describing this function

cacheSolve <- function(matrix){
        
        inverseMatrix <- matrix$getInverse()
        
        if(!is.null(inverseMatrix)){  # if inverse was already cached (not NULL) ...
              message("The inverse of this matrix has been calculated and is :")
              return(inverseMatrix)
        }
        else {                        # find the inverse of matrix
              originalMatrix <- matrix$getValue()
              inverseMatrix <- solve(originalMatrix)    # check for singular matrices
              
              matrix$setInverse(inverseMatrix)
              
              return(inverseMatrix)
          
        }
        
}
