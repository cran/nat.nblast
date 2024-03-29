% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spam.r
\docType{methods}
\name{[}
\alias{[}
\alias{[,spam,character,character,logical-method}
\alias{[,spam,character,character,missing-method}
\alias{[,spam,character,missing,logical-method}
\alias{[,spam,character,missing,missing-method}
\alias{[,spam,missing,character,logical-method}
\alias{[,spam,missing,character,missing-method}
\title{Extract parts of a sparse \code{spam} matrix}
\usage{
\S4method{[}{spam,character,character,logical}(x, i, j, ..., drop = TRUE)

\S4method{[}{spam,character,character,missing}(x, i, j, ..., drop = TRUE)

\S4method{[}{spam,character,missing,logical}(x, i, j, ..., drop = TRUE)

\S4method{[}{spam,character,missing,missing}(x, i, j, ..., drop = TRUE)

\S4method{[}{spam,missing,character,logical}(x, i, j, ..., drop = TRUE)

\S4method{[}{spam,missing,character,missing}(x, i, j, ..., drop = TRUE)
}
\arguments{
\item{x}{object to extract from.}

\item{i}{row identifiers.}

\item{j}{column identifiers.}

\item{...}{additional arguments.}

\item{drop}{logical indicating that dimensions should be dropped.}
}
\description{
Extract parts of a sparse \code{spam} matrix
}
