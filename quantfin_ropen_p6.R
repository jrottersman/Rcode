require(quantmod)
require(lubridate)

ad <- ymd(20140515, tz = "US/Pacific")

marketDates <- c(ad, ad + days(1), ad + weeks(1), ad + months(1),
                 ad + months(2), ad + months(3), ad + months(6),
                 ad + months(9), ad + years(1), ad + years(2),
                 ad + years(3), ad + years(5), ad + years(7),
                 ad + years(10), ad + years(15), ad + years(20),
                 ad + years(25), ad + years(30))

marketDates <- as.Date(substring(marketDates, 1, 10))

marketRates <- c(0.0, 0.08, 0.125, 0.15, 0.20, 0.255,
                 0.35, 0.55, 1.65, 2.25, 2.85, 3.10, 3.35,
                 3.65, 3.95, 4.65, 5.15, 5.85) * 0.01

numRates <- length(marketRates)
marketData.xts<- as.xts(marketRates, order.by = marketDates)

#Market zero rates plot
colnames(marketData.xts) <- "ZeroRate"
plot(x = marketData.xts[, "ZeroRate"], xlab = "time", ylab = "zero rate",
      main = "Market Zero Rates 2014-05-14", ylim = c(0.0,0.06),
      major.ticks = "years", minor.ticks = FALSE, col = "red")


createEmptyTermStructureXtsLub <- function(anchorDate, plusYears)
{
  #anchorDate is using lubridate here:
  endDate <- anchorDate + years(plusYears)
  numDays <- endDate - anchorDate
  #convert anchor date to standard r date and add one to capture both ends
  xts.termStruct <- xts(rep(NA, numDays + 1), as.Date(anchorDate) +
                          0:numDays)
  return(xts.termStruct)
}

termStruct <- createEmptyTermStructureXtsLub(ad, 30)

for(i in (1:numRates)) termStruct[marketDates[i]] <-
  marketData.xts[marketDates[i]]
head(termStruct, 8)
tail(termStruct)

#linear approximation
termStruct.lin.interpolate <- na.approx(termStruct)
head(termStruct.lin.interpolate,8)
tail(termStruct.lin.interpolate)

#spline interpolation
termStruct.spline.interpolate <- na.spline(termStruct, method = "hyman")
head(termStruct.spline.interpolate,8)
tail(termStruct.spline.interpolate)

termStruct.spline.interpolate.default <- na.spline(termStruct)
colnames(termStruct.spline.interpolate.default) <- "ZeroRate"
plot(x = termStruct.spline.interpolate.default[, "ZeroRate"], xlab = "Time",
     ylab = "Zero Rate",
     main = "Interpolated Market Zero Rates 2014-05-14 - 
        Default Cubic Spline",
     ylim = c(0.0, 0.06), major.ticks= "years",
     minor.ticks = FALSE, col = "darkblue")
  