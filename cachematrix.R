                        #############################
                        #                           #
                        #       cacheMatrix.R       #
                        #                           #
                        #############################

                        
## author himanshu.babbar 
##
## The script file contains two methods 'makeCacheMatrix and 'cacheSolve' 
## used for caching the inverse of an invertible matrix

                        
## makeCacheMatrix()
## params 'varMatrix' : A square invertible matrix
## This method contains getters and setters for the inverse matrices already cached
## Also this has a getter method to pass the input matrix to cacheSolve()

makeCacheMatrix <- function(varMatrix = matrix()){
  
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


## cacheSolve()
## params 'matrix' : The list object returned by makeCacheMatrix()

## We fetch the value of the original matrix from the list object
## and calculate the inverse of the matrix using solve()
## If the inverse has already been calculated, print a message and the inverse
                        
cacheSolve <- function(matrix){
        
        inverseMatrix <- matrix$getInverse()
        
        if(!is.null(inverseMatrix)){                ## if inverse was already cached 
                                                    ## print an empty line before the message
              cat("\n")                           
              message("The inverse of this matrix has been calculated and stored already !!!")
              cat("\n")           
              return(inverseMatrix)
        }
        else {                                       ## find the inverse of matrix
              originalMatrix <- matrix$getValue()
                                                      
              ## Using TryCatch block to check if the matrix entered is invertible
              ## If not, print an error message.
              
              inverse <- tryCatch({        
                      
                      originalMatrix <- matrix$getValue()
                      inverseMatrix <- solve(originalMatrix)
                      matrix$setInverse(inverseMatrix)
                      return(inverseMatrix)
                  
                  },
                
                  error = function(e){
                      message("Error!!! Please enter an invertible matrix")
                  },
                  
                  finally = function(){
                    
                  }
                  
                
              )
              #inverseMatrix <- solve(originalMatrix)    # check for singular matrices
              
              #matrix$setInverse(inverseMatrix)
              
             # return(inverseMatrix)
          
        }
        
}

