boardsim <- function(nreps) {
  count4 <- 0
  countbonusgiven4 <- 0
  for (i in 1:nreps) {
    position <- sample(1:6,1)
    if (position == 3) {
      bonus <- TRUE
      position <- (position + sample(1:6,1)) %% 8
    } 
    else bonus <- FALSE
    
    if (position == 4) {
      count4 <- count4 + 1
      if (bonus) countbonusgiven4 <- countbonusgiven4 + 1
    }
  }
  return (countbonusgiven4/count4)
}

