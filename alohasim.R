#find if there are two active nodes at the first epoch
# two active nodes at the second epoch and the probability 
#that two nodes will be active at the end of the second epoch
#if one was active at the end of the first epoch
#or to put it in math terms p(x1 = 2), p(x2 =2) and p(x2 = 2 | x1 = 1)

#p is the probability of transmitting
#q is the probability of the node becoming active
#nreps is the number of reps
sim <- function(p,q,nreps) {
  countx2eq2 <- 0
  countx1eq1 <- 0
  countx1eq2 <- 0
  countx2eq2givx1eq1 <- 0
  
  # simulate the experiment nreps times
  for(i in 1:nreps) {
    numsend <- 0 #no messages sent so far
    #simulate the decision to send in epoch 1
    for (j in 1:2) {
      if (runif(1) < p) numsend <- numsend + 1
      if (numsend == 1) X1 <- 1
      else X1 <- 2
      if (X1 == 2) countx1eq2 <- countx1eq2 + 1
    }
    #epoch 2
    #if X1 = 1 one node can generate a new message
    numactive <- X1
    if (X1 == 1 && runif(1) < q) numactive <- numactive + 1
    #do we send maybe
    if (numactive == 1)
      if (runif(1) < p) X2 <- 0
      else X2 <- 1
    else {#numactive = 2
      numsend <- 0
      for(i in 1:2)
        if (runif(1) < p) numsend <- numsend + 1
      if (numsend == 1) X2 <- 1
      else X2 <- 2
    }
    if (X2 == 2) countx2eq2 <- countx2eq2 + 1
    if (X1 == 1) {
      countx1eq1 <- countx1eq1 + 1
      if (X2 == 2) countx2eq2givx1eq1 <- countx2eq2givx1eq1 + 1
    }
  }
  
  cat("P(X1 = 2):", countx1eq2/nreps, "\n")
  cat("P(X2 =2):", countx2eq2/nreps, "\n")
  cat("P(X2 = 2 | X1 = 1):", countx2eq2givx1eq1 / nreps, "\n")
}