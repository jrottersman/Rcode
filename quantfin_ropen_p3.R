library(quantmod) #autoloads xts

tickers <- c("SPY", "QQQ", "GDX","DBO","VWO")
getSymbols(tickers, from = "2007-01-01")

SPY.Close <- SPY[,4]
QQQ.Close <- QQQ[,4]
GDX.Close <- GDX[,4]
DBO.Close <- DBO[,4]
VWO.Close <- VWO[,4]

SPY1 <- as.numeric(SPY.Close[1])
QQQ1 <- as.numeric(QQQ.Close[1])
GDX1 <- as.numeric(GDX.Close[1])
DBO1 <- as.numeric(DBO.Close[1])
VWO1 <- as.numeric(VWO.Close[1])

SPY <- SPY.Close/SPY1
QQQ <- QQQ.Close/QQQ1
GDX <- GDX.Close/GDX1
DBO <- DBO.Close/DBO1
VWO <- VWO.Close/VWO1

basket <- cbind(SPY, QQQ, GDX, DBO, VWO)


myColors <- c("red", "darkgreen", "goldenrod", "darkblue", "darkviolet")

plot(x = basket[,"SPY.Close"], xlab= "time",
     ylab = "Cumulative Returns", ylim = c(0.0,2.5),
        major.ticks = "years", minor.ticks = "FALSE",
        col = "red")
lines(x = basket[,"QQQ.Close"], col = "darkgreen")
lines(x = basket[,"GDX.Close"], col = "goldenrod")
lines(x = basket[,"DBO.Close"], col = "darkblue")
lines(x = basket[,"VWO.Close"], col = "darkviolet")
legend(x = 'topleft', legend = c("SPY", "QQQ", "GDX", "DBO", "VWO"),
       lty = 1, col = myColors)
