nf<-read.csv("Gesquiere2011_data.csv")
head(nf)

nf<-read.csv("Gesquiere2011_data.csv", header = TRUE)
nf<-read.csv("Gesquiere2011_data.csv", sep = '\t')
nf<-read.csv("Gesquiere2011_data.csv", sep = ';')
nf<-read.csv("Gesquiere2011_data.csv", skip = 5)

write.csv(trees, "MyFile.csv")
write.csv(trees,"MyFile.csv", append = TRUE)
read.csv("MyFile.csv", row.names = TRUE)
read.csv("MyFile.csv", col.names = FALSE)

dim(nf)
head(nf)
tail(nf)

### Question 1

### Question 2

# Exercise Y --------------------------------------------------------------

### Question 1

### Question 2


# Helpful info ------------------------------------------------------------

# Using Ctrl+Shift+R (Cmd+Shift+R on the Mac) creates new sections which are an easy way to organize
# scripts. You can also use them to navigate around very large scripts whith the stacked line icon in
# the top right of the script window.


# Using Ctrl+Shift+C (Cmd+Shift+C on the Mac) creates multiple commented out lines (e.g., # ) and allows you
# to type longer text segments and then comment them out as a group.
