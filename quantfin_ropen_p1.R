library(quantmod)

getSymbols("QQQ")
getSymbols("YHOO", src = "google")#source is yahoo by default

#Extract closing price to a Vector coerce from xts
yhoo.close <- as.vector(YHOO[, "YHOO.close"])

#Calculate the daily log return of yahoo
log.yahoo <- log(yhoo.close[-1]/yhoo.close[-length(yhoo.close)])
#sanity check 101
head(log.yahoo)
tail(log.yahoo)