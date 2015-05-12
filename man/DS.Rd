\name{DS}
\alias{DS}

\title{
Identification of disease similarity
}
\description{
Identify disease similarity through computating partial correlation coefficients of differenital co-expression values of pathways in different diseases.
}
\usage{
DS(DCpathway.disn , Ndis = 3, DCEA.disn, 
		DisNames = c("AA", "IgA", "T2D"), pathways, cutoff = 0.05,
		Nper = 0, 
		FigName = "DisNetwork.pdf", vsize = 5, lcex = 0.5, ewidth = 1.5)
}
\arguments{
  \item{DCpathway.disn}{
Results of DCpathway function for each disease.
}
  \item{Ndis}{
Disease number.
}
  \item{DCEA.disn}{
DCEA results for multi-diseases.
}
  \item{DisNames}{
Disease names.
}
  \item{pathways}{
A data frame or matix for pathways which generated from MSigDB.
}
  \item{cutoff}{
the cutoff of 'p.vaule' for sorting out a list of significant disease pairs; must be within [0,1].
}
  \item{Nper}{
Permutation times
}
  \item{FigName}{
A character string of Figure name for plotting disease network.
}
  \item{vsize}{
a numeric of node size.
}
  \item{lcex}{
a numeric of lable size.
}
  \item{ewidth}{
a numeric of edge width.
}
}
\details{
We computed the differential co-expression value (dC) of each gene between the disease and the control samples 
for all disease status via DCEA function. Then we assigned dCs of pathways to be the average dC of their component 
genes. So a vector of pathways dC for each disease was obtained. We emploied the R package, ppcor, to account the 
partial spearman correlation between two diseases finally.

In order to evaluate the statistical significance of observed disease partial correlation coefficients, 
we performed a permutation test, in which we randomly re-assigned the affiliation of gene to pathway with the 
number of pathways, the number of pathways component genes and the number of pathways a given gene belongs to 
unchanged, accounted the pathways dCs, and calculated the partial correlation coefficients using permuted data. 
This procedure can be set with 'Nper', when 'Nper' is larger than 0, a large number of partial correlation 
coefficient statistics form an empirical null distribution. The p-value for each disease pairs can then be 
estimated and FDR value can be obtained accordingly.
}
\value{
A graph have been saved in currently working directory. And a data frame for each disease pairs with its partial 
correlation coefficient (pcor) and 'p.value' and 'q.value'.
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

#########################################################################
### computate dCs of pathways for each disease.
#data(pathways)
#DCpathway.AA.res<-DCpathway(DCEA.res=DCEA.AA.res, DisName="AA",pathways)
#DCpathway.CKD.res<-DCpathway(DCEA.res=DCEA.CKD.res, DisName="CKD",pathways)
#DCpathway.T2D.res<-DCpathway(DCEA.res=DCEA.T2D.res, DisName="T2D",pathways)
#########################################################################

#########################################################################
### computate disease similarities.
#DCpathway.disn = cbind(DCpathway.AA.res, DCpathway.CKD.res, DCpathway.T2D.res)
#DCEA.disn = list(dis1 = DCEA.AA.res, dis2 = DCEA.CKD.res, dis3 = DCEA.T2D.res)
#DS.res<-DS(DCpathway.disn , Ndis = 3, DCEA.disn , 
#	DisNames = c("AA", "CKD", "T2D"), pathways, cutoff=0.05,
#	Nper = 0, 
#	FigName = "DisNetwork.pdf", vsize = 5, lcex = 0.3, ewidth = 1)
#DS.res[1:3,]
##########################################################################
}
\keyword{ disease similarity }
\keyword{ pathway }
