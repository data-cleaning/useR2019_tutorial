# Statistical Data Cleaning
# Mark van der Loo and Edwin de Jonge
# useR!2019


## Approximate matching ----
# Task: merge our 'companies' data with data from the backbone.

# Assignment 1: playing around with 'stringdist'.
library(stringdist)

# 1.a Try these commands and interpret their results. Can you guess
# how the difference between strings is measured? Discuss with your neighbour.
stringdist("hihi", "hihihi")
stringdist("hihi", "haha")
stringdist("hihi", "ihhi")
stringdist("hello", "Hello")


# 1.b compute the stringdistance between your name and your neighbours name.

# 1.c compute the stringdist between your own "firstname lastname" and
#     "lastname, firstname".


# Assignment 2. Matching data on exact keys, using 'match'
# (this can be done easier with 'merge' but we need this method for the 
# final assignment)

# first read in the data
# TODO this data should come from Edwin's part.
companies <- read.csv("data/companies.csv",stringsAsFactors = FALSE) 
backbone  <- read.csv("data/backbone.csv", stringsAsFactors = FALSE)


# i: for each element of 'companies$name' give the index in backbone$company
# with the same value.
i <- match(companies$name, backbone$company)
test <- cbind(backbone[i,,drop=FALSE], companies)
View(test)

# or, to view only the match quality:
d <- data.frame(dirty = companies$name, matched = backbone$company[i])
View(d)


## Assignment 3: SEE SLIDE



# at the end write your result to '02input/input.csv'
write.csv(input, "02input/my_input.csv", row.names=FALSE)







