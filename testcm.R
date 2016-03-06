source("/Users/mirez/Documents/coursera/JHU/R Prog/Week3/assignment 2/ProgrammingAssignment2/cachematrix.R")
testcm <- function(){ 
  
 matr <- makeCacheMatrix(matrix(99:102, 2, 2))
 
 matr$get() # [ 99, 101, 100, 102]
 
 matr$getInverse() # Null
 
 cacheSolve(matr)
 
 cacheSolve(matr)
 
 matr$getInverse()
 
 cacheSolve(matr)
 
 matr$set(matrix(c(1:4), 2, 2))
 matr$get()
 
 matr$getInverse()
 
 cacheSolve(matr)
 
 cacheSolve(matr)
 
 matr$getInverse()
}
