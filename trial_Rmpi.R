# WARNING: Rtools is required to build R packages but is not currently installed. 
# Please download and install the appropriate version of Rtools before proceeding:
#   https://cran.rstudio.com/bin/windows/Rtools/
#   Installing package into ‘C:/Users/shu87/AppData/Local/R/win-library/4.4’
# (as ‘lib’ is unspecified)
# trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/Rmpi_0.7-2.1.zip'

# Install Rmpi under MPICH2
# https://www.stats.uwo.ca/faculty/yu/Rmpi/
library(Rmpi)
library(doMPI)

# set actual number -1 
cl <- startMPIcluster(count=23)
registerDoMPI(cl)
x <- foreach(i=1:100, .combine="c") %dopar% {
  sqrt(i)
}
closeCluster(cl)
x
write.csv(x, "x.csv")
