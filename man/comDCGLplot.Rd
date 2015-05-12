\name{comDCGLplot}
\alias{comDCGLplot}
\title{
Visualization of common DCGs and DCLs
}
\description{
Graphical Representation of common DCLs with regulation information.
}
\usage{
comDCGLplot(comDCGL.res, FigName = "comDCGL.pdf", tf2target, 
	vsize = 5, asize = 0.3, lcex = 0.3, ewidth = 1.5)
}
\arguments{
  \item{comDCGL.res}{
Result of comDCGL function.
}
  \item{FigName}{
A character string of graph name.
}
  \item{tf2target}{
a data frame or matrix for TF-to-target interaction pairs.
}
  \item{vsize}{
A numeric of node size.
}
  \item{asize}{
A numeric of arrow size.
}
  \item{lcex}{
a numeric of lable size.
}
  \item{ewidth}{
a numeric of edge width.
}
}
\details{
We built a function comDCGLplot to display combined information of common DCGs and DCLs with regulation information. 
In this graph, we display DCLs networks, and we rely on different node shapes differentiate TFs and non-TFs 
(square for TFs, circle for non-TFs), different node colors to categorize genes (pink for DCGs, blue for non-DCGs, 
and different edge types to express different relations of DCLs (solid for DCLs, edges with arrow indicate 
TF-to-target relations).
}
\value{
One graph as users' wish have been saved in currently working directory
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

#####################################################
## sort out common DCGs and DCLs in AA, CKD and T2D.
data(tf2target)
comDCGL.res<-comDCGL(Ndis = 3, 
	DCEA.disn = list(dis1 = DCEA.AA.res, dis2 = DCEA.CKD.res, dis3 = DCEA.T2D.res), 
	DisNames = c("AA", "CKD", "T2D"), 
	cutoff = 0.25, tf2target)
#####################################################

#################################################################
## plot common DCGs and common DCLs with regulation information.
#comDCGLplot.res<-comDCGLplot(comDCGL.res,FigName="comDCGL.pdf",tf2target,
#	vsize=5,asize=0.25,lcex=0.3,ewidth=1.5)
#################################################################
}
\keyword{ visualization }
\keyword{ DCGs }
\keyword{ DCLs }
