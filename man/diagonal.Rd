% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scoremats.r
\name{diagonal}
\alias{diagonal}
\alias{diagonal.default}
\title{Extract diagonal terms from a variety of matrix types}
\usage{
diagonal(x, indices = NULL)

\method{diagonal}{default}(x, indices = NULL)
}
\arguments{
\item{x}{A square matrix}

\item{indices}{specifies a subset of the diagonal using a character vector of
names, a logical vector or integer indices. The default (\code{NULL})
implies all elements.}
}
\value{
a named vector containing the diagonal elements.
}
\description{
Extract diagonal terms from a variety of matrix types
}
\details{
Insists that input matrix is square. Uses the \code{'diagonal'}
  attribute when available and has specialised handling of \code{ff},
  \code{big.matrix}, \code{dgCMatrix} matrices. Does not check that row and
  column names are identical for those matrix classes (unlike the base
  \code{\link{diag}} function, but always uses rownames.
}
\examples{
m=fill_in_sparse_score_mat(letters[1:5])
diagonal(m)
}
