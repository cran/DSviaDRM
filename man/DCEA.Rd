\name{DCEA}
\alias{DCEA}
\title{ Identify DCGs (Differentially Co-expressed Genes) and DCLs (Differentially Co-expressed Links) based on the 'Differential Co-Expression Analysis' }
\description{
   A method to pick out DCGs and DCLs from gene expression data based on the 'Differential Co-Expression Analysis' (DCEA).
   DCEA method was published in our previous work, it cantained DCp and DCe method. (Yu et al. 2010, Liu et al. 2011, Yang et al. 2013).
   DCGs are identified by DCp, DCLs are identified by DCe.
}
\usage{
DCEA(exprs.1,exprs.2,
	r.method=c('pearson','spearman')[1],
	link.method=c('qth','rth','percent')[1],
	cutoff=0.25,
	N=0, N.type=c('pooled','gene_by_gene')[1],
	q.method=c("BH","holm", "hochberg", "hommel", "bonferroni", "BY","fdr")[1],
	nbins=20,p=0.1)
}
\arguments{
  \item{exprs.1}{ a data frame or matrix for condition A, with rows as variables (genes) and columns as samples. }
  \item{exprs.2}{ a data frame or matrix for condition B, with rows as variables (genes) and columns as samples. }
  \item{r.method}{ a character string indicating which correlation coefficient (or covariance) is to be computed. One of "pearson" (default) or "spearman", can be abbreviated. }
  \item{link.method}{ a character string indicating link filtering method, default is 'qth'. }
  \item{cutoff}{ cutoff used for link filtration, can be rth, qth, or percent depending on link.method. must be within [0,1]. }
  \item{N}{ permutation times. If N>0, the permutation step will be implemented. The default value for N is 0.}
  \item{N.type}{a character string indicating permutation type, default is 'pooled'.}
  \item{q.method}{ a character string indicating which correction method to be utilized. the default is 'BH'.}
  \item{nbins}{ number of x bins for fitting y=a+(b/x). }
  \item{p}{ the cutoff of q-value; must be within [0,1]. }
}
\details{
DCp starts with a set of gene coexpression value pairs, where each pair is made up with two coexpression 
values of a gene pair calculated under two different conditions. For a particular gene, a 'condition-specific coexpression profile' 
is defined as the vector of the coexpression values that relate to it in one condition, and the two condition-specific 
coexpression profiles of one gene become the two components of the gene's 'differential coexpression profile'. 
A differential coexpression measure (dC) is calculated from the differential coexpression profile as a length-normalized Euclidean Distance.
Then the samples between the two conditions will be disturbed and the samples will be separated to two conditions.
Calculate dC of this condition. Repeat the above process for N times. Pool all the dC together to form a null distribution of dC. 
The corresponding statistical significance (p-value) is estimated against null statistics (short for pooled). Or calculate p-value of a gene
only in this gene's null distribution of dC (short for gene_by_gene).

DCe is based on the 'Limit Fold Change' or 'LFC' model, a robust statistical method originally proposed for selecting DEGs from microarray 
data (Mutch et al. 2002). In LFC, we categorize correlation coefficients into bins according to their maximum coexpression values, and within each bin,
select a fraction p of links with highest log fold changes, and fit a curve y = a + (b/x) over the boundary links.
Links lying above the fitted curve are considered as DCLs. In most experiments of this work, we set p = 0.1.
}
\value{
A table with DCGs will be listed including 'dC' value, profile 'links','p.value' and 'q.vaule' value for each gene.
A table with DCLs will be listed including 'cor.1' and 'cor.2' (correlation coefficients in two conditions), 'type' and 'diff.cor'.

}
\references{
H. Yu, B.H. Liu, Z.Q. Ye, C. Li, Y.X. Li, Y.Y. Li, Link-based Quantitative Methods to Identify Differentially Coexpressed Genes and Gene Pairs, BMC Bioinformatics 12 (2011) 315.

B.H. Liu, H. Yu, K. Tu, C. Li, Y.X. Li, Y.Y. Li, DCGL: an R package for identifying differentially coexpressed genes and links from gene expression microarray data, Bioinformatics 26 (2010) 2637-2638.

J. Yang, H. Yu, B.H. Liu, Z. Zhao, L. Liu, L.X. Ma, Y.X. Li, Y.Y. Li, DCGL v2.0: An R Package for Unveiling Differential Regulation from Differential Co-expression, PLoS One 8 (2013) e79729.

Mutch, D.M., Berger, A., Mansourian, R., Rytz, A. and Roberts, M.A, The limit fold change model: a practical approach for selecting differentially expressed genes from microarray data, BMC Bioinformatics, 3 17 (2002).

}
\author{ Jing Yang }
\examples{
data(exprs1)
exprs.1<-exprs1[1:200,1:5]
exprs.2<-exprs1[1:200,6:10]

###########################################################
## calculate differentially co-expressed genes (DCGs) and 
## differentially co-expressed links (DCLs) by DCEA.
DCEA.res<-DCEA(exprs.1,exprs.2,
	r.method=c('pearson','spearman')[1],
	link.method=c('qth','rth','percent')[3],
	cutoff=0.05,
	N=0, N.type=c('pooled','gene_by_gene')[1],
	q.method=c("BH","holm", "hochberg", "hommel", "bonferroni", "BY","fdr")[1],
	nbins=20,p=0.1)
DCEA.res$genes[1:3,]
DCEA.res$links[1:3,]
###########################################################

###########################################################
## calculate differentially co-expressed genes (DCGs) and 
## differentially co-expressed links (DCLs) with 100 permutation times.
#DCEA.res.N<-DCEA(exprs.1,exprs.2,
#	r.method=c('pearson','spearman')[1],
#	link.method=c('qth','rth','percent')[3],
#	cutoff=0.05,
#	N=100, N.type=c('pooled','gene_by_gene')[1],
#	q.method=c("BH","holm", "hochberg", "hommel", "bonferroni", "BY","fdr")[1],
#	nbins=20,p=0.1)
#DCEA.res.N$genes[1:3,]
#DCEA.res.N$links[1:3,]
###########################################################
}
\keyword{ DCGs }
\keyword{ DCLs }
\keyword{ DCEA }
\keyword{ DCGL }
