library(Quandl)

sp = Quandl("YAHOO/INDEX_GSPC", type = "raw")
head(sp)
