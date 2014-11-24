n <- 10000
set.seed(106) 
z <- rnorm(n)
mu <- 0.10
sd <- 0.15
delta_t <- 0.25
#apply to expression (*) above
qtr_returns <- mu*delta_t +sd*z*sqrt(delta_t)

hist(qtr_returns, breaks = 100, col = "green")

stats <- c(mean(qtr_returns) * 4, sd(qtr_returns) * 2)
names(stats) <- c("mean", "volatility")
stats