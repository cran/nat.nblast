% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/smat.r
\name{neuron_pairs}
\alias{neuron_pairs}
\title{Utility function to generate all or random pairs of neurons}
\usage{
neuron_pairs(query, target, n = NA, ignoreSelf = TRUE)
}
\arguments{
\item{query, target}{either \code{\link{neuronlist}}s or character vectors of
names. If target is missing, query will be used as both query and target.}

\item{n}{number of random pairs to draw. When NA, the default, uses
\code{expand.grid} to draw all pairs.}

\item{ignoreSelf}{Logical indicating whether to omit pairs consisting of the
same neuron (default \code{TRUE}).}
}
\value{
a data.frame with two character vector columns, query and target.
}
\description{
Utility function to generate all or random pairs of neurons
}
\examples{
neuron_pairs(nat::kcs20, n=20)
}
\seealso{
\code{\link{calc_score_matrix}, \link{expand.grid}}
}
