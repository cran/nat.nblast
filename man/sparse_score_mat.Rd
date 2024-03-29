% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scoremats.r
\name{sparse_score_mat}
\alias{sparse_score_mat}
\title{Convert a subset of a square score matrix to a sparse representation}
\usage{
sparse_score_mat(neuron_names, dense_matrix)
}
\arguments{
\item{neuron_names}{a character vector of neuron names to save scores for.}

\item{dense_matrix}{the original, dense version of the full score matrix.}
}
\value{
A spare matrix, in compressed, column-oriented form, as an R object
  inheriting from both \code{\link[Matrix]{CsparseMatrix-class}} and
  \code{\link[Matrix]{generalMatrix-class}}.
}
\description{
This can be useful for storing raw forwards and reverse NBLAST scores for a
set of neurons without having to store all the uncomputed elements in the
full score matrix.
}
\examples{
data(kcs20, package = "nat")
scores=nblast_allbyall(kcs20)
scores.3.sparse=sparse_score_mat(names(kcs20)[3], scores)
scores.3.sparse
# can also add additional submatrices
fill_in_sparse_score_mat(scores.3.sparse,scores[3:6,3:4])
}
\seealso{
fill_in_sparse_score_mat
}
