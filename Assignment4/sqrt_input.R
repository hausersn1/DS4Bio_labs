# Script to print sqrt(z) if z is divisible by 17

# get the user input
z <- commandArgs(trailingOnly = T)
z <- as.numeric(z[1])

# Check if satisfies condition
if (z %% 17 == 0 ) {
  print(paste(sqrt(z)))
} else { 
  print("input not divisible by 17, doing nothing")
}