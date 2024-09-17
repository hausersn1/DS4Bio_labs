# Header ------------------------------------------------------------------
# Assignment name: Assignment 4
# Author name: Samantha Hauser
# Date: Sept 20, 2024
# Notes: Chapter 5, Ex 1-3

# File setup --------------------------------------------------------------

# set working directory below
setwd("C:/Users/saman/Desktop/Code/DS4Bio_labs/Assignment4")

# load libraries below

# Exercise I --------------------------------------------------------------

### Question 1
# run in command line
Rscript cube_input.R 11 
# output is "input less than or equal to 100, doing nothing"
Rscript cube_input.R 110
# output is 1331000

### Question 2
# run in command line
Rscript sqrt_input.R 170
# output is 13.038" 
Rscript sqrt_input 110
# output is "input not divisible by 17, doing nothing" 

### Question 3
# run in the command line
Rscript make_seq.R 

# Exercise II -------------------------------------------------------------
### Question 1

z <- seq(1, 1000, by = 3) # makes a vector of numbers from 1 to 1000, counting by 3's (e.g., [1,4,7,10,...])
# for each number in the vector z, check to see if it is divisible by 4. 
# if it is, then print that number, otherwise, do nothing and check the next number in z
for (k in z) {
  if (k %% 4 == 0) {
    print(k)
  }
}

### Question 2

# As the user to enter a number in the console
z <- readline(prompt = "Enter a number: ")

# make the value they entered numeric type
z <- as.numeric(z)

# initialize a variable isthisspecial to true
isthisspecial <- TRUE

# initialize i to 2
i <- 2

# see if z (the entered number) is greater than 2 (i)
# if z > 2, then check to see if z is divisible by 2 (ie even)
# if z is even, then set is this special to false, then add one to i (now 3)
# do the process again, see if i is less than z, if it is, then check to see if z is divisible by i
# continue until i is not less than z
while (i < z) {
  if (z %% i == 0) {
    isthisspecial <- FALSE
    break
  }
  i <- i + 1
}

# in the case that the user entered a value (z) that is less than or equal to i, 
# or if z is not divisible by i or any of the values that i gets, then isthisspecial will remain TRUE
# if that happens, then it will print the number (z)
if (isthisspecial == TRUE) {
  print(z)
}


# Exercise III ------------------------------------------------------------

### Question 1
tell_fortune <- function(){
  # you can use runif(1) 
  rand_float <- runif(1)
  if (rand_float < 0.3) {
    print("Yes")
  } else {
    print("No")
  }
}

# run it
tell_fortune()

### Question 2
order_three <- function(x, y, z){
  return(sort(c(x,y,z)))
}

# Run it: 
order_three(33,9,2)

### Question 3
order_three <- function(x, y, z){
  my_ord <- sort(c(x,y,z))
  return(list("first" = my_ord[1],
              "second" = my_ord[2], 
              "third"= my_ord[3]
  ))
}

### Question 4
data(trees)
str(trees)

new_col <- function(x){
  Exp <- ceiling(runif(nrow(x))*10)
  for (i in 1:length(Exp)) {
    if (Exp[i]>5) {
      Exp[i] <- 2 
    } else 
      Exp[i] <- 1
  }
x <- cbind(x, Exp)
}

new_trees <- new_col(trees)

### Question 5
data(trees)
p_val <- 0
for (i in 1:100) {
  new_trees <- new_col(trees)
  x <- new_trees$Volume[new_trees$Exp == 1]
  y <- new_trees$Volume[new_trees$Exp == 2]
  t <- t.test(x,y)
  p_val[i] <- round(t$p.value, 3)
}

prop_significant <- sum(p_val < 0.05) / length(p_val)

# this proportion were significantly different 
prop_significant
