% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scoremats.r
\name{fill_in_sparse_score_mat}
\alias{fill_in_sparse_score_mat}
\title{Add one or more submatrices to a sparse score matrix}
\usage{
fill_in_sparse_score_mat(sparse_matrix, ..., diag = NULL)
}
\arguments{
\item{sparse_matrix}{either an existing (square) sparse matrix or a character
vector of names that will be used to define an empty sparse matrix.}

\item{...}{Additional matrices to insert into \code{sparse_matrix}. Row and
column names must have matches in \code{sparse_matrix}.}

\item{diag}{optional full diagonal for sparse matrix i.e. self-match scores.}
}
\description{
Add one or more submatrices to a sparse score matrix
}
\seealso{
sparse_score_mat
}
