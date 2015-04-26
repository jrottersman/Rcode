#conditional probability example

dicesim <- function(nreps) {
  count1 <- 0
  count2 <- 0
  for (i in 1:nreps) {
    d <- sample(1:6, 3, replace = T)
    if (sum(d) > 8) {
      count1 <- count1 + 1
      if (d[1] < 3) count2 <- count2 + 1
    }
  }
  return(count2 / count1)
}