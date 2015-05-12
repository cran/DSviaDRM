\name{exprs1}
\alias{exprs1}
\docType{data}
\title{Real dataset pulled down from GEO (http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE22528) }
\description{
  Gene expression dataset, containing 1000 rows and 10 columns.
}
\usage{data(exprs1)}
\format{
A data frame with 1000 observations 10 variables.
\itemize{
  \item{exprs1}{ A data frame with 1000 observations 10 columns. The expression values. }
}
}
\details{
In the sample gene expression data matrix exprs, it was designed to study gene expression in Allergic Asthma samples and health samples.
}
\author{ Jing Yang}
\examples{
data(exprs1)
exprs1[,1:5] # exprssion data for Allergic Asthma samples
exprs1[,6:10] # exprssion data for health samples
row.names(exprs1) # gene identifiers
}
\keyword{datasets}
