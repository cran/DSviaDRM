\name{exprs3}
\alias{exprs3}
\docType{data}
\title{Real dataset pulled down from GEO (http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE9006) }
\description{
  Gene expression dataset, containing 1000 rows and 35 columns.
}
\usage{data(exprs3)}
\format{
A data frame with 1000 observations 35 variables.
\itemize{
  \item{exprs3}{ A data frame with 1000 observations 35 columns. The expression values. }
}
}
\details{
In the sample gene expression data matrix exprs, it was designed to study gene expression in Type 2 Diabetes and health samples.
}
\author{ Jing Yang}
\examples{
data(exprs3)
exprs3[,1:12] # exprssion data for Type 2 Diabetes samples
exprs3[,13:35] # exprssion data for health samples
row.names(exprs3) # gene identifiers
}
\keyword{datasets}
