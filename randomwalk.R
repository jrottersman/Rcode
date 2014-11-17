.Random.seed

n <- 1000
x <- cumsum(sample(c(-1,1), n, TRUE))
plot(x)