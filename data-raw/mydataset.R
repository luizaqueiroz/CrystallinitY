## code to prepare `mydataset` dataset goes here
library(readxl)
PLS_PhAT <- read_excel("data-raw/PLS_PhAT.xlsx")
PLS_MR <- read_excel("data-raw/PLS_MR.xlsx")

usethis::use_data(PLS_MR,PLS_PhAT, overwrite = TRUE)


