library(xts)
library(quantmod)
library(moments)

getSymbols("SPY", src="google", from="2004-01-01")

SPY.Close <- SPY[, "SPY.Close"]

plot(SPY.Close, main = "Closing Daily Prices for S&P 500 Index ETF (SPY)", col = "red", xlab = "Date", ylab = "Price", major.ticks = 'years', minor.ticks = FALSE)

SPY.ret <- diff(log(SPY.Close), lag = 1)
SPY.ret <- SPY.ret[-1] #Remove the NA from the first position

plot(SPY.ret, main = "Daily Lograthmic Return for S&P 500 Index ETF (SPY)", col = "red", xlab = "Date", ylab = "Return", major.ticks = 'years', minor.ticks = FALSE)

#lets check some stats
statNames <- c("mean", "std dev", "skewness", "kurtosis")
SPY.stats <- c(mean(SPY.ret), sd(SPY.ret), skewness(SPY.ret), kurtosis(SPY.ret))
names(SPY.stats) <- statNames
SPY.stats