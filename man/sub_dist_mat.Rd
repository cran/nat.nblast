% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scoremats.r
\name{sub_dist_mat}
\alias{sub_dist_mat}
\title{Convert (a subset of) a raw score matrix to a distance matrix}
\usage{
sub_dist_mat(
  neuron_names,
  scoremat = NULL,
  form = c("matrix", "dist"),
  maxneurons = NA
)
}
\arguments{
\item{neuron_names}{character vector of neuron identifiers.}

\item{scoremat}{score matrix to use (see \code{sub_score_mat} for details of
default).}

\item{form}{the type of object to return.}

\item{maxneurons}{set this to a sensible value to avoid loading huge (order
N^2) distances directly into memory.}
}
\value{
return An object of class matrix or dist (as determined by the form
  argument), corresponding to a subset of the distance matrix
}
\description{
This function can convert a raw score matrix returned by
  \code{nblast} into a square distance matrix or \code{dist} object. It can
  be used with file-backed matrices as well as regular R matrices resident in
  memory.
}
\details{
Note that if \code{neuron_names} is missing then the rownames of
  \code{scoremat} will be used i.e. every neuron in \code{scoremat} will be
  used.
}
\seealso{
Other scoremats: 
\code{\link{nhclust}()}
}
\concept{scoremats}
