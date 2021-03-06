% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/QPPQ.R
\name{QPPQ}
\alias{QPPQ}
\title{QPPQ}
\usage{
QPPQ(Q.in, FDC.in, FDC.out)
}
\arguments{
\item{Q.in}{the input index flows (missing values?)}

\item{FDC.in}{the index FDC dataset}

\item{FDC.out}{the FDC for the ungaged location}
}
\value{
A vector of output flows at the ungaged site
}
\description{
Compute estimated flow at an ungaged site given the flow at the
reference streamgage, and the FDCs for the reference and ungaged sites.
}
\note{
Q-normal-log interpolation is used. This function can be applied
anywhere the method is valid.
}

