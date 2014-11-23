require(GLDEX)
require(quantmod)

getSymbols("SPY", from = "1994-02-01")
SPY.Close <- SPY[,4]

SPY.vector <- as.vector(SPY.Close)

#calculate log returns
sp500 <- diff(log(SPY.vector), lag =1)
sp500 <- sp500[-1] #remove na from first row

# Sets normalise="Y" so that kurtosis (peakedness)
#is calculated with refrence to kurtosis = 0 under 
#Normal distribution
fun.moments.r(sp500, normalise = "Y")
#fit a GLD function
spLambdaDist <- fun.data.fit.mm(sp500)
fun.plot.fit(fit.obj = spLambdaDist, data = sp500,
             nclass = 100, param = c("rs", "fmkl"),
             xlab = "Returns")

#Seperate out the individual lambda functions of RS and FMKL
lambda_params_rs <- spLambdaDist[ ,1]
lambda1_rs <- lambda_params_rs[1]
lambda2_rs <- lambda_params_rs[2]
lambda3_rs <- lambda_params_rs[3]
lambda4_rs <- lambda_params_rs[4]

lambda_params_fmkl <- spLambdaDist[ ,2]
lambda1_fmkl <- lambda_params_fmkl[1]
lambda2_fmkl <- lambda_params_fmkl[2]
lambda3_fmkl <- lambda_params_fmkl[3]
lambda4_fmkl <- lambda_params_fmkl[4]

#RS version:
set.seed(100) #Set seed to obtain a reproducible set
rs_sample <- rgl(n = 10000000, lambda1 =lambda1_rs,
                 lambda2 = lambda2_rs,
                 lambda3 = lambda3_rs,
                 lambda4 = lambda4_rs, param = "rs")

fmkl_sample <- rgl(n = 10000000, lambda1 =lambda1_fmkl,
                 lambda2 = lambda2_fmkl,
                 lambda3 = lambda3_fmkl,
                 lambda4 = lambda4_fmkl, param = "fmkl")

#Moments of simulated returns using RS method:
fun.moments.r(rs_sample, normalise = "Y")
#Moments calculated from market data
fun.moments.r(sp500, normalise = "Y")
fun.moments.r(fmkl_sample, normalise="Y")
fun.moments.r(sp500, normalise= "Y")
