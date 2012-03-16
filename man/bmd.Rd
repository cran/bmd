\name{bmd}

\alias{bmd}

\title{Calculation of benchmark doses}

\description{
  Calculation of benchmark doses based on continuous or qunatal dose-response data.
}

\usage{
bmd(object, bmr, backg = 0, def = c("excess", "additional", "relative", "hybrid"), 
interval = c("delta"), ma = FALSE, maList = NULL, display = FALSE)
}

\arguments{
  \item{object}{object of class \code{drc}}
  \item{bmr}{numeric vector of bench mark response levels for which to calculate benchmark doses (should be between 0 and 1)}
  \item{backg}{numeric value specifying the background level (defaults to 0)}
  \item{def}{character string specifiying the definition of the benchmark dose to use in the calculations. "excess" and "additional" are for binomial
  response whereas "relative" and "hybrid" (additive hybrid) are for continuous response}
  \item{interval}{character string specifying the type of confidence interval to use}
  \item{ma}{logical value switching on/off model averaging using a default list of model functions}
  \item{maList}{list of model functions to include in the model averaging}
  \item{display}{logical. If TRUE results are displayed; otherwise they are not}
}

\details{
  This package project just started and is still under development. The aim to provide an R package 
  calculating the benchmark dose (BMD) and the lower limit of the corresponding 95\% confidence interval (BMDL)
  for continuous and quantal dose-response data for a range of dose-response model based on the available
  definitions of the benchmark dose concepts.
  
  Details on the implemented definitions and methods can be found in Crump (2002).
}

\value{
  A matrix with two column, one containing BMD and the other containing BMDL.
}

\references{
  Budtz-Jorgensen, E., Keiding, N., and Grandjean, P. (2001) 
  Benchmark Dose Calculation from Epidemiological Data,
  \emph{Biometrics} \bold{57}, 698--706.  

  Crump, K. (2002)
  Critical Issues in Benchmark Calculations from Continuous Data,
  \emph{Critical Reviews in Toxicology} \bold{32}, 133--153.
}

\author{Christian Ritz}

%\note{}

%\seealso{}

\examples{

## Fitting log-logistic two-parameter model to binomial data
deguelin.m1 <- drm(r/n~dose, weights=n, data=deguelin, fct=LL.2(), type="binomial")

## Estimated EC values for comparison
ED(deguelin.m1, c(5, 10, 50), interval = "delta")

## Excess risk with BMR=5% and background 0
bmd(deguelin.m1, 0.05)

## Additional risk BMR=5% and with background 0
bmd(deguelin.m1, 0.05, def = "additional")

## Excess risk with BMR=5% and known background
bmd(deguelin.m1, 0.05, backg = 0.05)

## Additional risk with BMR=5% and known background
## similar but not identical to excess risk
bmd(deguelin.m1, 0.05, backg = 0.05, def = "additional", display = TRUE)

## Model-average BMD using additional risk
bmd(deguelin.m1, 0.05, backg = 0.05, def = "additional", ma = TRUE, display = TRUE)


## Benchmark doses for a continuous response
ryegrass.m1 <- drm(rootl ~ conc, data = ryegrass, fct = LL.4())

## Standard single-model BMD using relative values (background level cannot be incorporated)
bmd(ryegrass.m1, 0.05, def = "relative", display = TRUE)

## Standard single-model BMD using the hybrid method (background level can be incorporated)
bmd(ryegrass.m1, 0.05, backg = 0.05, def = "hybrid", display = TRUE)

## Model avaraged BMD using relative values (background level cannot be incorporated)
bmd(ryegrass.m1, 0.05, def = "relative", ma = TRUE, display = TRUE)

## Model avaraged BMD using the "hybrid" method
bmd(ryegrass.m1, 0.05, backg = 0.05, def = "hybrid", ma = TRUE, display = TRUE)
 

## Example from p. 41 in: EFSA (2009). Guidance of the Scientific Committee on a request from EFSA 
##  on the use of the benchmark dose approach in risk assessment
##  The EFSA Journal, 1150, 1-72 
efsa2009p41 <- data.frame(dose=c(0,3,12,30), number=c(6,6,34,42), total=rep(50,4))
efsa2009p41.LL2 <- drm(number/total~dose, weights=total, data=efsa2009p41, type="binomial", fct=LL.2())
plot(efsa2009p41.LL2)  # no great fit close to the control group

efsa2009p41.LL3u <- drm(number/total~dose, weights=total, data=efsa2009p41, type="binomial", fct=LL.3u())
plot(efsa2009p41.LL3u)
modelFit(efsa2009p41.LL3u)
summary(efsa2009p41.LL3u)  # background level is 0.096477

bmd(efsa2009p41.LL3u, 0.1, backg = coef(efsa2009p41.LL3u)[2])
# using a background level of 0.096477
# not far from the estimates reported by EFSA: BMD=3.23, BMDL=1.9


## Example from Hwang et al. (2009)
hwang2009 <- data.frame(dose = c(0, 2.68, 10.34, 37.03), number = c(1,0,2,9), total = c(50,50,50,50))
hwang2009.LN2 <- drm(number/total ~ dose, weights = total, data = hwang2009, type = "binomial", fct = LN.2())

plot(hwang2009.LN2)
summary(hwang2009.LN2)

bmd(hwang2009.LN2, 0.1)  # BMR=0.1
# BMD=21.94894, BMDL=13.34339 (smaller than the estimates reported by Piegorsch (2010))
#  but the models also differ as here log-transformed dose is implicitly used
# additional and extra risks are identical for this model (because the background p0 is 0)

hwang2009.N2 <- glm(number/total~dose, weights=total, data=hwang2009, family=binomial("probit"))
summary(hwang2009.N2)  # same estimates as in Piegorsch (2010)
# a model implicitly assuming a non-zero background p0=pnorm(-2.252)=0.012


}
\keyword{models}
\keyword{nonlinear}

\concept{BMD BMDL benchmark dose-response}