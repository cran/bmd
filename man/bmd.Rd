\name{bmd}

\alias{bmd}

\title{Calculation of benchmark doses}

\description{
  Calculation of benchmark doses based on continuous or qunatal dose-response data.
}

\usage{
bmd(object, level, def = c("excess", "additional"), interval = c("delta"))
}

\arguments{
  \item{object}{object of class \code{drc}}
  \item{level}{numeric vector of response levels for which to calculate benchmark doses}
  \item{def}{character string specifiying the definition of benchmark dose to use}
  \item{interval}{character string specifying the type of confidence interval to use}
}

\details{
  This package project just started and is still under development. The aim to provide an R package 
  calculating the benchmark dose (BMD) and the lower limit of the corresponding 95\% confidence interval (BMDL)
  for continuous and quantal dose-response data for a range of dose-response model based on the available
  definitions of the benchmark dose concepts.
}

\value{
  A matrix with two column, one containing BMD and the other containing BMDL.
}

%\references{}

\author{Christian Ritz}

%\note{}

%\seealso{}

\examples{


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
\keyword{nonlinear}

\concept{BMD BMDL benchmark dose-response}