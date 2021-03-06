% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rora.R
\name{rora}
\alias{rora}
\title{Estimate recharge}
\usage{
rora(Dates, Flow, Start = NULL, End = NULL, da, recessIndex, minQ = 0.01,
  incAnteRec = 0, STAID = NULL)
}
\arguments{
\item{Dates}{the date of the flow, can be ewither character or class "Date."}

\item{Flow}{the mean daily flow for the corresponding date.}

\item{Start}{the starting year for the analysis. If \code{NULL}, then
begin with the first year in \code{Dates}.}

\item{End}{the ending year for the analysis. If \code{NULL}, then
end with the last year in \code{Dates}.}

\item{da}{the drainage area of the basin.}

\item{recessIndex}{the recession index, in days per common log cycle. 
This is typcially estimated using \code{recess}.}

\item{minQ}{the value to use for the minimum value in \code{flow}. Any
value in \code{Flow} less than the value for \code{minQ} is set to the
value for \code{minQ}.}

\item{incAnteRec}{a value to add to the base antecedent recession time, 
in days. In general, this should always be 0.}

\item{STAID}{a character string to be used as the station identifier. This is
used only for documentation when printing or plotting.}
}
\value{
An object of class rora, which has these components.\cr
iyr, the year of the observed streamflow. \cr
imon, the month of the observed streamflow. \cr
idy, the day of the observed streamflow. \cr
flow, the observed streamflow. \cr
Nobs, the number of observed values of streamflow. \cr
iyearst, the starting year of the recharge analysis. \cr
iyearen, the ending year of the recharge analysis. \cr
minQ, the value of minQ. \cr
idiff, the value of incAnteRec. \cr
k, the value of recessIndex. \cr
te, the time to end day of the recession following a peak in streamflow, in days. \cr
ta, the time at the critical time after the previous peak. \cr
qp, the streamflow of the peak. \cr
qa, the streamflow the critical time after the previous peak. \cr
qb, the streamflow at the critical time that would have occurred in the 
absence of the current and any subsequent peaks. \cr
qc, the streamflow at the critical time that would have occurred 
in the absence of any subsequent peaks. \cr
c, the average value for the current peak calculated from the difference 
between the flow during recession and flow computed from the recession 
index for each day between the peak and the critical time. \cr
delq, the difference in flow between the hypothetical flow at the 
critical time after the current peak and the hypothetical flow at 
the critical time after the previous peak. \cr
rech, the estimated recharge for the peak, in inches. \cr
year, the year of the peak. \cr
mon, the month of the peak. \cr
day, the day of the peak. \cr
npeaks, the number of peaks. \cr
itbase, the antecedent flow base time, in days. This is the minimum time 
from a peak to when the flow can be considered to be ground-water discharge.\cr
ierr, the error code. \cr
STAID, the station identifier.
}
\description{
Estiamte recharge by the method of hydrograph recession displacement.
}

