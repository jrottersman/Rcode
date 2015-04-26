roll <- function(nd) return(sample(1:6,nd,replace=TRUE))

#d is the number of dice
#k is the desired sum of the dice
#nreps in the number of times to complete the experiment
probtotk <- function(d,k,nreps) {
  sums <- replicate(nreps,sum(roll(d)))
  return(mean(sums==k))
}