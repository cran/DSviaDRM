\name{exprs2}
\alias{exprs2}
\docType{data}
\title{Real dataset pulled down from GEO (http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE35487) }
\description{
  Gene expression dataset, containing 1000 rows and 31 columns.
}
\usage{data(exprs2)}
\format{
A data frame with 1000 observations 31 variables.
\itemize{
  \item{exprs2}{ A data frame with 1000 observations 31 columns. The expression values. }
}
}
\details{
In the sample gene expression data matrix exprs, it was designed to study gene expression in Chronic kidney disease and health samples.
}
\author{ Jing Yang}
\examples{
data(exprs2)
exprs2[,1:25] # exprssion data for Chronic kidney disease samples
exprs2[,26:31] # exprssion data for health samples
row.names(exprs2) # gene identifiers
}
\keyword{datasets}
