#Loads packages for seawater carbonate chemistry calculations and for .xlsx interaction
library(seacarb); library(XLConnect)

#Enter voltage cutoffs
min <- 190; max <- 225

#Enter target file
x <- '0517_CRM_END.csv'

#Reads file
A <- read.csv(file = x)
#Reads sample mass
mass <- as.numeric(substr(A[10,3], 1, 6))

#Strips off first 34 rows, final 4 rows, and first column for formatting
A <- head(A, -4); A <- tail(A, -34); A <- A[,2:4]
#Transforms volume, voltage, and temperature into numeric values
A[,1] <- as.numeric(substr(A[, 1], 1, 5)); A[,2] <- as.numeric(substr(A[, 2], 1, 5)); A[,3] <- as.numeric(substr(A[, 3], 1, 4))

#Calculates TA for designated sample
print(1000200*at(C=.1011, S=33.571, T=mean(A[,3][A[,2]>min & A[,2]<max]), w=mass, E=A[,2][A[,2]>min & A[,2]<max], v=A[,1][A[,2]>min & A[,2]<max]))
