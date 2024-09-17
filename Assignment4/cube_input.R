# Script to print z^3 if z>100

# get the user input
z <- commandArgs(trailingOnly = T)
z <- as.numeric(z[1])

# Check if satisfies condition
if (z > 100) {
  print(paste(z^3))
} else { 
  print("input less than or equal to 100, doing nothing")
}