factorial <- function(n, print = TRUE){
  if(n<1){
    return(1)
  }
  else{
    return(n*factorial(n-1))
  }
}
factorial(4)
