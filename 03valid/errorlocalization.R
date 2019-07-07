library(errorlocate)

# load the rules
rules <- validator(.file = "./03valid/rules.R")

rules

# load the data
data_with_errors <- read.csv("02input/input.csv")

# use locate_errors to find errononuous variables
# and store this in variable "errors"

...

# make a summary of the errors.
# Which fields are found to contain errors?

...


# we have much confidence in turnover, since these also collected via the 
# tax register
weight <- sapply(data_with_errors, function(x) 1)
# Set the weight of turnover to 10 and supply the weight to 
# locate_errors 

# are less errors found in turnover?

# replace the erronuous field with NA using replace_errors
# and store as errors_located.csv
