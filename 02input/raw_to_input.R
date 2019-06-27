# Statistical Data Cleaning
# Mark van der Loo and Edwin de Jonge
# useR!2019


## Reading Dirty Data ----



## Approximate matching ----
# Task: merge our 'companies' data with data from the backbone.

# Assignment 1. (see slide)



# Assignment 2. (see slide).

# first read in the data
# TODO this data should come from Edwin's part.
companies <- read.csv("data/companies.csv",stringsAsFactors = FALSE) 
backbone  <- read.csv("data/backbone.csv", stringsAsFactors = FALSE)

# Merge backbone register information with dirty data (left join)
test <- merge(backbone, companies, by.x = "company", by.y="name"
              , all.y = TRUE)
View(test)
# Q: how many records (out of 60) could be matched?


# The equivalent using base R's `match` function works as follows.
# (advantages: now we keep both 'name' and 'company' columns, and we can 
# extend to )
i <- match(companies$name, backbone$company)
test <- cbind(backbone[i,,drop=FALSE], companies)
View(test)


# Code from 2nd assignment here (see slide)


# at the end write your result to '02input/input.csv'
write.csv(input, "02input/input.csv", row.names=FALSE)







