#' Cluster a set of neurons
#'
#' Given an NBLAST all by all score matrix (which may be specified by a package
#' default) and/or a vector of neuron identifiers use \code{\link{hclust}} to
#' carry out a hierarchical clustering. The default value of the \code{distfun}
#' argument will handle square distance matrices and R \code{dist} objects.
#'
#' @param neuron_names character vector of neuron identifiers.
#' @param method clustering method (default Ward's).
#' @param scoremat score matrix to use (see \code{sub_score_mat} for details of
#'   default).
#' @param distfun function to convert distance matrix returned by
#'   \code{sub_dist_mat} into R \code{dist} object (default=
#'   \code{\link{as.dist}}).
#' @param ... additional parameters passed to \code{\link{hclust}}.
#' @inheritParams sub_dist_mat
#' @return An object of class \code{\link{hclust}} which describes the tree
#'   produced by the clustering process.
#' @export
#' @family scoremats
#' @seealso \code{\link{hclust}, \link{dist}}
#' @examples
#' library(nat)
#' kcscores=nblast_allbyall(kcs20)
#' hckcs=nhclust(scoremat=kcscores)
#' # divide hclust object into 3 groups
#' library(dendroextras)
#' dkcs=colour_clusters(hckcs, k=3)
#' # change dendrogram labels to neuron type, extracting this information
#' # from type column in the metadata data.frame attached to kcs20 neuronlist
#' labels(dkcs)=with(kcs20[labels(dkcs)], type)
#' plot(dkcs)
#' # 3d plot of neurons in those clusters (with matching colours)
#' open3d()
#' plot3d(hckcs, k=3, db=kcs20)
#' # names of neurons in 3 groups
#' subset(hckcs, k=3)
#' @importFrom stats hclust
nhclust <- function(neuron_names, method='ward', scoremat=NULL, distfun=as.dist, ..., maxneurons=4000) {
  if(!missing(neuron_names) && is.matrix(neuron_names) && is.numeric(neuron_names)){
    scoremat=neuron_names
    warning("Assuming that first argument is a score matrix - please call like:\n",
            "  nhclust(scoremat=",deparse(substitute(neuron_names)),") in future!")
    neuron_names=NULL
  }
  subdistmat <- sub_dist_mat(neuron_names, scoremat, maxneurons=maxneurons)
  if(min(subdistmat) < 0)
    stop("Negative distances not allowed. Are you sure this is a distance matrix?")
  hclust(distfun(subdistmat), method=method, ...)
}


#' Methods to identify and plot groups of neurons cut from an \code{hclust}
#' object
#'
#' @description \code{plot3d.hclust} uses \code{plot3d} to plot neurons from
#'   each group, cut from the \code{hclust} object, by colour.
#' @details Note that the colours are in the order of the dendrogram as assigned
#'   by \code{colour_clusters}.
#' @param x an \code{\link{hclust}} object generated by \code{\link{nhclust}}.
#' @param k number of clusters to cut from \code{\link{hclust}} object.
#' @param h height to cut \code{\link{hclust}} object.
#' @param groups numeric vector of groups to plot.
#' @param col colours for groups (directly specified or a function).
#' @param colour.selected When set to \code{TRUE} the colour palette only
#'   applies to the displayed cluster groups (default \code{FALSE}).
#' @param ... additional arguments for \code{plot3d}
#' @return A list of \code{rgl} IDs for plotted objects (see
#'   \code{\link[rgl]{plot3d}}).
#' @export
#' @seealso \code{\link{nhclust}, \link[rgl]{plot3d}, \link{slice},
#' \link{colour_clusters}}
#' @importFrom dendroextras slice
#' @importFrom grDevices rainbow
#' @examples
#' # 20 Kenyon cells
#' data(kcs20, package='nat')
#' # calculate mean, normalised NBLAST scores
#' kcs20.aba=nblast_allbyall(kcs20)
#' kcs20.hc=nhclust(scoremat = kcs20.aba)
#' # plot the resultant dendrogram
#' plot(kcs20.hc)
#'
#' # now plot the neurons in 3D coloured by cluster group
#' # note that specifying db explicitly could be avoided by use of the
#' # \code{nat.default.neuronlist} option.
#' plot3d(kcs20.hc, k=3, db=kcs20)
#'
#' # only plot first two groups
#' # (will plot in same colours as when all groups are plotted)
#' plot3d(kcs20.hc, k=3, db=kcs20, groups=1:2)
#' # only plot first two groups
#' # (will be coloured with a two-tone palette)
#' plot3d(kcs20.hc, k=3, db=kcs20, groups=1:2, colour.selected=TRUE)
plot3d.hclust <- function(x, k=NULL, h=NULL, groups=NULL, col=rainbow,
                          colour.selected=FALSE, ...) {
  # Cut the dendrogram into k groups of neurons. Note that these will now have
  # the neurons in dendrogram order
  kgroups <- slice(x,k,h)
  k <- max(kgroups)
  neurons <- names(kgroups)

  if(!is.null(groups)){
    matching <- kgroups%in%groups
    kgroups <- kgroups[matching]
    neurons <- neurons[matching]
  }

  if(colour.selected) {
    k=length(unique(groups))
    if(is.function(col))
      col <- col(k)
    else if(length(col)==1) col=rep(col,k)
    kgroups=match(kgroups,unique(groups))
  } else {
    if(is.function(col))
      col <- col(k)
    else if(length(col)==1) col=rep(col,k)

  }

  # NB we need to substitute right away to ensure that the non-standard
  # evaluation of col does not fail with a lookup problem for kgroups
  plot3d(neurons, col=substitute(col[kgroups]), ..., SUBSTITUTE=FALSE)
}


#' Return the labels of items in 1 or more groups cut from hclust object
#'
#' @details Only one of \code{h} and \code{k} should be supplied.
#'
#' @inheritParams dendroextras::slice
#' @param groups a vector of which groups to inspect.
#'
#' @return A character vector of labels of selected items
#' @export
#' @importFrom dendroextras slice
subset.hclust <- function(x, k=NULL, h=NULL, groups=NULL, ...) {
  kgroups=slice(x, k, h)

  neurons=names(kgroups)

  if(!is.null(groups)){
    matching=kgroups%in%groups
    kgroups=kgroups[matching]
    neurons=neurons[matching]
  }
  neurons
}
