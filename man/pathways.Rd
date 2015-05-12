\name{pathways}
\alias{pathways}
\docType{data}
\title{The dataset of human pathways downloaded from two collections of MSigDB }
\description{
  There are 572,639 pathways and their component genes downloaded from collection 2 and collection 5 of MSigDB (http://www.broadinstitute.org/gsea/msigdb/index.jsp).
}
\usage{data(pathways)}
\format{
A data frame with 572,639 observations 2 variables.
\itemize{
\item{pathways}{ A data frame with 572,639 observations 2 columns. TF-to-target interaction pairs. }
}
}
\details{
We downloaded collection 2 and collection 5 files from MSigDB (http://www.broadinstitute.org/gsea/msigdb/index.jsp). 
There are 6,176 pathways including 21,075 genes.
}
\author{ Jing Yang}
\examples{
data(pathways)
pathways[1:3,] # pathways (column 1) and their component genes (column 2)
}
\keyword{pathways}
\keyword{MSigDB}