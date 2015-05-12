\name{DCpathway}
\alias{DCpathway}
\title{
Calculate differential co-expression values (dCs) for each pathways
}
\description{
dCs of pathways are defined as average dC of their component genes.
}
\usage{
DCpathway(DCEA.res = DCEA.res, DisName = "COPD", pathways)
}
\arguments{
  \item{DCEA.res}{
DCEA results for multi-diseases.
}
  \item{DisName}{
Disease names.
}
  \item{pathways}{
A data frame or matix for pathways which generated from MSigDB.
}
}
\details{
We computed the differential co-expression value (dC) of each gene between the disease and the control samples 
for all disease status via DCEA function. Then we assigned dCs of pathways to be the average dC of their component 
genes. Therefore a vector of pathways dC for each disease was obtained.
}
\value{
A data frame of dCs for all pathways with 
}
\author{
Jing Yang
}
\examples{
data(exprs1)
data(exprs2)
data(exprs3)

##########################################################################
## the default value of cutoff in DCEA is 0.25, 
## here cutoff is set to 1 for saving time when demonstrating the examples.
DCEA.AA.res<-DCEA(exprs1[1:200,1:5],exprs1[1:200,6:10],link.method="percent",
	cutoff=1,N=0,nbins=20,p=0.1) 
##########################################################################

##########################################################################
## computate dCs of pathways for disease
data(pathways)
DCpathway.AA.res<-DCpathway(DCEA.res=DCEA.AA.res, DisName="AA",pathways)
DCpathway.AA.res[1:3,]
##########################################################################

}
\keyword{ differential co-expression }
\keyword{ pathway }
