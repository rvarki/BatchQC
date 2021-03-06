% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/batchQC.R
\name{combatPlot}
\alias{combatPlot}
\title{Adjust for batch effects using an empirical Bayes framework
ComBat allows users to adjust for batch effects in datasets where the 
batch covariate is known, using methodology described in Johnson et al. 2007.
It uses either parametric or non-parametric empirical Bayes frameworks for 
adjusting data for batch effects. Users are returned an expression matrix 
that has been corrected for batch effects. The input
data are assumed to be cleaned and normalized before batch effect removal.}
\usage{
combatPlot(dat, batch, mod = NULL, par.prior = TRUE, prior.plots = TRUE)
}
\arguments{
\item{dat}{Genomic measure matrix (dimensions probe x sample) - for example,
expression matrix}

\item{batch}{{Batch covariate (only one batch allowed)}}

\item{mod}{Model matrix for outcome of interest and other covariates 
besides batch}

\item{par.prior}{(Optional) TRUE indicates parametric adjustments will be 
used, FALSE indicates non-parametric adjustments will be used}

\item{prior.plots}{(Optional)TRUE give prior plots with black as a kernel 
estimate of the empirical batch effect density and red as the parametric}
}
\value{
data A probe x sample genomic measure matrix, adjusted for 
batch effects.
}
\description{
Adjust for batch effects using an empirical Bayes framework
ComBat allows users to adjust for batch effects in datasets where the 
batch covariate is known, using methodology described in Johnson et al. 2007.
It uses either parametric or non-parametric empirical Bayes frameworks for 
adjusting data for batch effects. Users are returned an expression matrix 
that has been corrected for batch effects. The input
data are assumed to be cleaned and normalized before batch effect removal.
}
\examples{
nbatch <- 3
ncond <- 2
npercond <- 10
data.matrix <- rnaseq_sim(ngenes=50, nbatch=nbatch, ncond=ncond, npercond=
    npercond, basemean=10000, ggstep=50, bbstep=2000, ccstep=800, 
    basedisp=100, bdispstep=-10, swvar=1000, seed=1234)
batch <- rep(1:nbatch, each=ncond*npercond)
condition <- rep(rep(1:ncond, each=npercond), nbatch)
pdata <- data.frame(batch, condition)
mod = model.matrix(~as.factor(condition), data = pdata)
combatPlot(data.matrix, batch, mod=mod)
}
