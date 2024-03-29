\name{ComputeStatObjectFromFiles}
\alias{ComputeStatObjectFromFiles}
\title{
  Parse an output file to create a summary object (\code{list})
}
\description{
  Parses the file saved by \code{\link{Estim_Simulation}} and re-creates
  a summary list identical to the one produced by
  \code{\link{Estim_Simulation}} when \code{StatSummary} is set to TRUE.
}
\usage{
ComputeStatObjectFromFiles(files, sep_ = ",",
                           FctsToApply = StatFcts,
                           headers_=TRUE,readSizeFrom=1,
                           CheckMat=TRUE,
                           tolFailCheck=tolFailure,
                           MCparam=1000,...)
}
\arguments{
  \item{files}{
    \code{character} vector containing the files name to be parsed.
    See Details.
  }
  \item{sep_}{
    field separator character to be used in function \code{read.csv()}
    and \code{write.table()}.  Values on each line of the file are
    separated by this character. It can also be a character vector (same
    length as \code{files}) if different separators are used for each
    file; default: \code{","}.
  }
  \item{FctsToApply}{
    functions used to produce the statistical summary.
    See \code{\link{Estim_Simulation}}; character vector.
  }
  \item{headers_}{
    \code{boolean} vector of length 1 or same length as \code{files} to
    indicate for each file if the header argument is to be considered or
    not. To be passed to function \code{read.csv()}.
  }
  \item{readSizeFrom}{
    index of the file from which the sample sizes are determined;
    default 1 (from first file in \code{files}).
  }
  \item{CheckMat}{
    logical flag: if set to TRUE, an estimation is declared failed if
    the squared error of the estimation is larger than
    \code{tolFailCheck}; default TRUE.
  }
  \item{tolFailCheck}{
    tolerance on the squared error of the estimation to be declared
    failed; default = 1.5.
  }
  \item{MCparam}{
    number of Monte Carlo simulation for each couple of parameter,
    default = 1000; integer.
  }
  \item{\dots}{
    other arguments to be passed to the estimation function.
    See \code{\link{Estim_Simulation}}.
  }
}
\details{

  The same sample sizes are assumed for all the files and we also assume
  a different set of parameters (\code{alpha},\code{beta}) within each
  file (one and one only).

  This function is particularly useful when simulations are run in
  parallel on different computers/CPUs and the output files are
  collected afterwards. This function is also used to create the Latex
  summary table: see \code{\link{TexSummary}}.

  Some examples are provided in the example folder.
}
\value{
  a list of \code{length} 4 containing a summary \code{matrix} object
  associated to each parameter.
}
\seealso{
  \code{\link{Estim_Simulation}}
}
\keyword{Simulation}
