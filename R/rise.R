#' Water Table Rises
#'
#' Identify groundwater rises based on hydrographs of daily values.
#'
#' @param x the daily value data to be summarized. Missing values are not permitted
#'within the time specified by \code{Start} and \code{end}.
#' @param Dates the date for each \code{x}, should be of class "Date." Missing values
#'are not permitted.
#' @param Start the start date for the analysis, can be either a character string or
#'class "Date."
#' @param End the end date for the analysis, can be either a character string or
#'class "Date."
#' @param MPelev the measuring point elevation. Required if \code{x} is a depth below land
#'surface or measuring point.
#' @param STAID the station identifier for the data.
#' @return An object of class "rise" and inherits class "data.frame" of the selected data, a data
#'frame of the recession information, and other information about the analysis.
#' @note Rutledge (2002) describes the rise methed for computing recharge. the method is
#'a variation on the water-table fluctuation method that assumes no recession.
#' @references Rutledge, A.T., 2002, User guide for the PULSE program: 
#'U.S. Geological Survey Open-File Report 02--455, 34 p.
#' @keywords recession
#' @examples
#'
#'\dontrun{
#'library(smwrData)
#'data(GlacialRidge)
#'with(GlacialRidge, rise(G12, datetime, MPelev=1126.42, STAID="G12"))
#'}
#'@export
rise <- function(x, Dates, Start=NULL, End=NULL, MPelev=NULL,
                 STAID="Unknown") {
  ## Coding history:
  ##    2006Jul25 DLLorenz Initial coding.
  ##    2006Aug28 DLLorenz Standardized interface
  ##    2006Aug30 DLLorenz Finished standardization
  ##    2006Aug30          This version
  ##
  if(is.null(Start))
    Start <- Dates[1L]
  else if(is.character(Start))
    Start <- as.Date(Start)
  if(is.null(End))
     End <- Dates[length(Dates)]
  else if(is.character(End))
    End <- as.Date(End)
  sel <- (Dates >= Start) & (Dates <= End)
  Dates <- Dates[sel]
  GWlevel <- x[sel]
  if(any(is.na(x)))
    stop("Missing values between ", Start, " and ", End)
  if(any(diff(as.double(Dates)) != 1))
    stop("Date data are not continuous between start and end")
  if(!is.null(MPelev))
    GWlevel <- MPelev - GWlevel
  ## compute the rise and hypothetical recession (none)
  Rise <- pmax(c(0, diff(GWlevel)), 0)
  EventRise <- eventNum(Rise > 0, reset=T)
  if(EventRise[2L] == 1L) {
    EventRise[1L] == 1L # Assume that this is actually part of the initial rise
  }
  Hypo <- GWlevel
  for(i in seq(2L, length(Hypo))) {
    if(EventRise[i] > 0L) {
      Hypo[i] <- Hypo[i-1L] # carry forward
    }
  }
  retval <- data.frame(Dates=Dates, GWLevel=GWlevel, HypoRecess=Hypo, Rise=Rise, EventRise=EventRise)
  if(!is.null(STAID))
    attr(retval, "STAID") <- STAID
  class(retval) <- c("rise", "data.frame")
  return(retval)
}
