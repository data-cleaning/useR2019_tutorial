
## Data validation ----

# let's read in the matched data.
companies <- read.csv("02input/input.csv")
head(companies)

# try the following code

# load the library
library(validate)

# define some restrictions on data
rules <- validator(
  staff >= 0
  , turnover >= 0
  , other.rev >= 0
  , turnover + other.rev == total.rev
  , if (staff > 0) staff.costs >= 0
)

# confront data with the rules
result <- confront(companies, rules, key="id")

# print the result
result

# Summarize the result and study the output
summary(result)
# Discuss each column with your neighbour

# plot the result
plot(result)
# Explain what you see

# add a new rule
rules <- rules + validator(V6 = total.costs>=0)
rules

# Study the variables staff ... vat. Add at least three more rules, then:
## 1. Summarize and plot the results. Interpret the results.

## 2. Use `as.data.frame` to turn results into a data frame and
## View the results.


## Assignment (on slide, after presentation)










