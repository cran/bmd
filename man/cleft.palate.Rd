\name{cleft.palate}

\alias{cleft.palate}

\docType{data}

\title{Dose-response data on cleft palate}

\description{
  Developmental dose-response data on cleft palate for two compounds believed 
  to operate via similar mechanisms of action.
}

\usage{data(cleft.palate)}

\format{
  A data frame with 9 observations on the following 4 variables.
  \describe{
    \item{\code{dose}}{a numeric vector}
    \item{\code{affected}}{a numeric vector}
    \item{\code{total}}{a numeric vector}
    \item{\code{compound}}{a factor with levels \code{2,3,7,8-TCDD1} \code{2,3,7,8-TCDD2}}
  }
}

\details{
  The data are part of a larger collection of datasets reported in Sand et al. (2002).
}

\source{
  Sand, S., Falk Fillipsson, A. and Victorin, K. (2002) 
  Evaluation of the Benchmark Dose Method for Dichotomous Data: Model Dependence and Model Selection,
  \emph{Regulatory Toxicology and Pharmacology}, \bold{36}, 184--197. 
}

%\references{}

\examples{

cleft.palate

}
\keyword{datasets}
