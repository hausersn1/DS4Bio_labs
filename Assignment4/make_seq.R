# Script to print sqrt(z) if z is divisible by 17

# get the user input
z <- commandArgs(trailingOnly = T)
z <- as.numeric(z[1])

# Check if satisfies condition
if (ceiling(z) != z){
  print("Needs to be positive integer")
} else if (z < 0) {
  stop("Needs to be positive integer")
} else if (z < 100 ) {
  seq <- c(1:z)
  print(seq)
} else { 
  seq <- c(z:-1:1)
  print(seq)
}