# Statistical Data Cleaning
# Mark van der Loo and Edwin de Jonge
# useR!2019


## Reading Dirty Data ----



## Approximate matching ----
# Task : join the data against a backbone register with accurate company names.

# Try the following code
# TODO this data should come from Edwin's part.
companies <- read.csv("data/companies.csv",stringsAsFactors = FALSE) 
backbone  <- read.csv("data/backbone.csv", stringsAsFactors = FALSE)

# Merge backbone register information with dirty data (left join)
test <- merge(companies, backbone, by = "company", all.x = TRUE)
View(test)


# The equivalent using base R's `match` function works as follows.
i <- match(companies$company, backbone$company)
test <- cbind(companies, backbone[i,,drop=FALSE])


## ASSIGNMENT. Use approximate text matching to improve the result.
# note: to experiment with different string distances, first
# make a data frame with the original data and various matches
# (as shown in the presentation). Next, choose your best result
# and store write to file '02Input/input.csv'






