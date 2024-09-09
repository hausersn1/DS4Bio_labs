# Header ------------------------------------------------------------------
# Assignment name: Assignment 1
# Author name:Samantha Hauser
# Date: 8/28/24
# Notes: Section 4 - Basic Programming with R

# File setup --------------------------------------------------------------

# set working directory below

# load libraries below

# Exercise I --------------------------------------------------------------

### Question 1
z <- seq(from=2, to=100, by=2)
z

### Question 2
z[z%%12 == 0]
length(z[z%%12 == 0]) 

### Question 3
sum(z) # 2550

### Question 4
sum(z) == 51*50 # TRUE

### Question 5
z[5]*z[10]*z[15] # 6000

### Question 6
z^2 # This squares every value in the vector

### Question 7
y <- seq(from=0, to=30)
y <- y[y%%3 ==0]
w <- y[y%%2 == 0 & y > 2]

## Or: 
n <- rep(y,length(z))
m <- rep(z,length(y))
sort(n[n-m == 0])

# Or this: 
n <- matrix(rep(y,length(z)), nrow=length(y), ncol=length(z))
m <- matrix(rep(z,length(y)), nrow=length(z), ncol=length(y))
n[t(m)/n == 1] # 6 12 18 24 30 


### Question 8 
seq(2,100, by = 2) == (1:50) *2 # Yes, True for all values

# Exercise II --------------------------------------------------------------

### Question 1
A <- matrix(1:10, nrow=10, ncol=5)
A

### Question 2
Z <- array(data = c(A[1:5,],A[6:10,]), dim=c(5,5,2))
Z

### Question 3
x <- c("n30", "n101", "n140")
x <- sub("n", "", x)
x <- as.numeric(x)
x
class(x)

# Helpful info ------------------------------------------------------------

# Using Ctrl+Shift+R (Cmd+Shift+R on the Mac) creates new sections which are an easy way to organize
# scripts. You can also use them to navigate around very large scripts whith the stacked line icon in
# the top right of the script window.


# Using Ctrl+Shift+C (Cmd+Shift+C on the Mac) creates multiple commented out lines (e.g., # ) and allows you
# to type longer text segments and then comment them out as a group.
