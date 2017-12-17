# to use:
# > source('cachematrix.R')
# > newMatrix <- makeCacheMatrix(matrix(0:8,8,8))
# > newMatrix$get()
# > new$getmatrix()
# > cacheSolve(newMatrix)
# > newMatrix$getmatrix()

makeCacheMatrix <- function(x = matrix()) {
     m<-NULL                   # initialize matrix 'm'
     
     set <-function(y){       # define method 'set'
          x<<-y
          m<<-NULL
     }
     
     get <-function() x        # define method to return value of 'x'
     
     setmatrix<-function(solve) { # define method 'setmatrix'
          m<<- solve
     }
     
     getmatrix<-function() m	  # define method to return value of 'm'
     
     list(set=set, get=get,    # list names of all methods
          setmatrix=setmatrix,
          getmatrix=getmatrix)
}

cacheSolve <- function(x=matrix(), ...) {
     
     m<-x$getmatrix()           # check content of 'm'
     
     if(!is.null(m)){           # if not null, return its value 
          message("getting cached data")
          return(m)
     }
     else {
          datos<-x$get()        # if null: get matrix, create, set,
          m<-solve(datos, ...)   # update and return 'm'
          x$setmatrix(m)
          return(m)
     }
}
