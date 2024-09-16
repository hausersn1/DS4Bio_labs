# Quiz 3
# Practice writing fuctions, conditional branching and loops
# Practice generating random numbers or sampling numbers

# Question 1: Translate DNA to RNA
# Write a function to convert input DNA into RNA sequences
# Given the input is a DNA string
# Hint: in R, you cannot change a character within a string directly
# We need to first split the string into a vector of single characters
# make changes to characters, and concatenate them together into a string
# To split a string into a vector of single characters, you can do
DNAstring <- "ATCG"
DNAvec <- strsplit(DNAstring, split="")[[1]]
# We add [[1]] to extract the vector because the output of strsplit is a list. 
# To concatenate a character vector into a string, we can use 
DNAstring <- paste(DNAvec,collapse = "")
# we use the argument "collapse" instead of "sep", because our input is a vector
# and we'd like the output to be collapsed and concatenated into a string. 
# otherwise, output of paste will have the same dimension of the vector
# If adding base pairs to existing string, we can use paste0 (i.e., no sep)
DNAstring <- paste0(DNAstring, "A")
DNAstring <- paste0(DNAstring, "AC")

# write down the design of your function in pseudo-code
# and then fill in the actual function

# DNA -> RNA is essentially replacing thymine (T) with uracil (U). 
# Use a loop to process each base and an `if` statement to make the substitution.
# before substitution, check if the input sequence contains only ATCG
dna_sequence <- "actgacact"
dna_to_rna <- function(dna_sequence) {
  
  # convert the input seq to upper case
  dna_sequence <- toupper(dna_sequence)
  
  # convert dna_seq to a vector
  dna_vec <- strsplit(dna_sequence, split="")[[1]]
  
  # initialize output sequence
  rna_sequence <- ""
  
  # check if the input sequence contains only ATCG
  for (i in 1:length(dna_vec)) {
    # if dna_vec[i] is not in c("A","T","C","G")
    next_base <- dna_vec[i]
    bases <- c("A","T","C","G")
    if (length(bases[next_base == bases]) == 0) {  # if( next_base %in% bases)
      # stop("...")
      stop("Incorrect...DNA must be only ATCG")
    } else if (bases[1]==next_base){
      rna_sequence <- paste0(rna_sequence, "T")
    } else if (bases[2]==next_base){
      # else if the character is "T", 
      rna_sequence <- paste0(rna_sequence, "U")
    } else if (bases[3]==next_base){
      # else if the character is "T", 
      rna_sequence <- paste0(rna_sequence, "G")
    } else if (bases[4]==next_base){
      # else if the character is "T", 
      rna_sequence <- paste0(rna_sequence, "C")
    } else {
      # else add the original character to the sequence use paste(rna_sequence,)
      rna_sequence <- paste0(rna_sequence, next_base)
    }
  }
  return(rna_sequence)
}


# Question 2: Calculate Hamming Distance Between Two Sequences
# Write a function that calculates the Hamming distance (number of mismatches) 
# between two DNA sequences of the same length. 
# stop the function if the input two sequences are not of the same length.
# Use a loop to compare each base and an `if` statement to increment a counter when bases differ.
# return the final count

cal_hamming_dist <- function (seq1, seq2) {
  # initialize the counter
  count <- 0
  
  # convert the input seq to upper case
  seq1 <- toupper(seq1)
  seq2 <- toupper(seq2)
  
  # convert each seq to a vector
  seq1 <- strsplit(seq1, split="")[[1]]
  seq2 <- strsplit(seq2, split="")[[1]]
  
  # check to make sure lengths of the two sequences are the same, otherwise stop
  if (length(seq1)!=length(seq2)){
    stop("Lengths of two sequences must be the same")
  }
  
  for (i in 1:length(seq1)) {
    # compare each in the sequence to each other
    if (seq1[i]!=seq2[i]) {
      # if they are different, then increment the counter,
      count <- count + 1 
    } 
  }
  return(count)
}


# Question 3: Generate allele frequency change under selection pressure
# Write a function that simulates allele frequency changes under selection pressure. 
# There are two alleles of the gene: B and b, 
# with starting frequency p_B defined by the user, thus p_b = 1- p_B
# fitness of B is fit_B, and fitness of b is fit_b
# in the next generation, the frequency of B is 
# its relative fitness over average fitness times its current frequency
# p_B (next generation) = fit_B * p_B / (fit_B * p_B + fit_b * p_b)
# The initial frequencies are considered Generation 0
# Given user defined generations,
# output a dataframe, first column is the generation number, second and third column 
# is the frequency of allele B and b at that generation

simulate_selection <- function(p_B, fit_B, fit_b, total_generations){
  # initialize a matrix to put the data in
  dat <- matrix(data=NA, nrow=total_generations+1, ncol=3)
  dat[1,] <- c(0, p_B, 1-p_B)
  
  for (i in 1:total_generations) {
    dat[i+1,1] <- i
    dat[i+1,2] <- fit_B * dat[i,2] / (fit_B * dat[i,2] + fit_b * (1-dat[i,2]))
    dat[i+1,3] <- 1 - dat[i+1,2]
  }
  
  # output a dataframe, first column is the generation number, second and third column 
  # is the frequency of allele B and b at that generation
  colNames <- c("Generation", "p_B", 'p_b') # name the columns
  df <- as.data.frame(dat)
  colnames(df) <- colNames
  return(df)
}


