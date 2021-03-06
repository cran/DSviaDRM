\name{comDCGL}
\alias{comDCGL}
\title{
Sort out common DCGs and DCLs in multi-diseases
}
\description{
common DCGs and DCLs maybe imply the similar regulation mechanisms which are the underlying reasons to disease relationships.
Therefore comDCGL are implemented to sort out shared DCGs and DCLs in multi-disease.
}
\usage{
comDCGL(Ndis = 3, DCEA.disn, DisNames = c("AA", "CKD", "T2D"), cutoff = 0.05, tf2target)
}
\arguments{
  \item{Ndis}{
Disease number.
}
  \item{DCEA.disn}{
DCEA results for multi-diseases.
}
  \item{DisNames}{
Disease names.
}
  \item{cutoff}{
the cutoff of 'q.vaule' in DCEA results; must be within [0,1]; If there is no 'q.value' value (when N=0 in DCEA function), 'dC' will be sorted in decreasing order and retained the highest by 'cutoff' percent.
}
  \item{tf2target}{
a data frame or matrix for TF-to-target interaction pairs.
}
}
\value{
A list with two components:
  \item{comDCGs }{Displaying common DCGs with annotated regulator information.}
  \item{comDCLs }{Displaying common DCLs with annotated regulation relationship information. }
}
\author{
Jing Yang
}
\examples{
##################################################################
## computate DCEA results for three disease, Allergic asthma (AA), 
## Chronic kidney disease (CKD) and Type 2 Diabetes (T2D).
##################################################################
data(exprs1)
data(exprs2)
data(exprs3)

##########################################################################
## the default value of cutoff in DCEA is 0.25, 
## here cutoff is set to 1 for saving time when demonstrating the examples.
DCEA.AA.res<-DCEA(exprs1[1:200,1:5],exprs1[1:200,6:10],link.method="percent",
	cutoff=1,N=0,nbins=20,p=0.1) 
DCEA.CKD.res<-DCEA(exprs2[1:300,1:25],exprs2[1:300,26:31],link.method="percent",
	cutoff=1,N=0,nbins=20,p=0.1) 
DCEA.T2D.res<-DCEA(exprs3[1:200,1:12],exprs3[1:200,13:35],link.method="percent",
	cutoff=1,N=0,nbins=20,p=0.1) 
##########################################################################

##########################################################################
## sort out common DCGs and DCLs in AA, CKD and T2D.
data(tf2target)
DCEA.disn <- list(dis1 = DCEA.AA.res, dis2 = DCEA.CKD.res, dis3 = DCEA.T2D.res)
comDCGL.res<-comDCGL(Ndis = 3, DCEA.disn, DisNames = c("AA", "CKD", "T2D"), 
	cutoff = 0.25, tf2target)
comDCGL.res$comDCGs[1:3,]
comDCGL.res$comDCLs[1:3,]
##########################################################################
}

\keyword{ DCGs }
\keyword{ DCLs }
