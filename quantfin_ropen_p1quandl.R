library(Quandl)

gold <- Quandl("OFDP/FUTURE_GC2", collapse = "monthly")

#20 years of monthly gold prices
gold20 <- Quandl("OFDP/FUTURE_GC2", collapse= "monthly", start_date = "1992-06-01", end_date = "2012-05-01") 


#calculating log prices again monthly this time
#shocking I know
gold.settle <- gold20[, "Settle"]
gold.settle <- rev(gold.settle)
log.gold <- log(gold.settle[-1]/gold.settle[-length(gold.settle)])

#Mimimal Sanity check
head(log.gold)
tail(log.gold)