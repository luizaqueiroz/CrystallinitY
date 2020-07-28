
# Set up the data-raw directory and data processing script
# You can use any name you want
usethis::use_data_raw(name = 'mydataset')

# This script in the R directory will contain the documentation.
# You can use any name you want.
file.create("R/data.R")

#' Load a Matrix
#'
#' This function loads a file as a matrix. It assumes that the first column
#' contains the rownames and the subsequent columns are the sample identifiers.
#' Any rows with duplicated row names will be dropped with the first one being
#' kepted.
#'
#' @param infile Path to the input file
#' @return A matrix of the infile
#' @export
c_calibration <- function(infile){
  in.dt <- data.table::fread(infile, header = TRUE)
  in.dt <- in.dt[!duplicated(in.dt[, 1]), ]
  in.mat <- as.matrix(in.dt[, -1, with = FALSE])
  rownames(in.mat) <- unlist(in.dt[, 1, with = FALSE])
  in.mat
}


#' %CI and Raman spectra of MCC batches acquired using a PhAT probe
#'
#'
#' @format A data frame with 60 rows and 1302 variables:
#' \describe{
#'   \item{CrystallinityIndex}{%}
#'   \item{RamanSpectra}{PhATprobe}
#'   ...
#' }
"PLS_PhAT"

#' %CI and Raman spectra of MCC batches acquired using a MR probe
#'
#'
#' @format A data frame with 85 rows and 1302 variables:
#' \describe{
#'   \item{CrystallinityIndex}{%}
#'   \item{RamanSpectra}{MRprobe}
#'   ...
#' }
"PLS_MR"
