## Adjusting values under constraints
library(rspa)
library(validate)


# 1 Toy data
# Suppose we have the following problem: 
# A small ferry can take a car and a driver up to 1500 kg
ferry_rules <- validator(
  weight_car + weight_driver <= 1500,
  weight_driver >= 50, # only adult drivers
  weight_car >= 1000 # only real cars
)

# if we have this data, how can be minimally adjust it?
ferry <- data.frame(weight_car = 500, weight_driver = 80)

# adjust the values
match_restrictions(ferry, ferry_rules)

# discuss what happens.

# 1b) What about?
ferry <- data.frame(weight_car = 500, weight_driver = 40)

# 1c) What about?
ferry <- data.frame(weight_car = 1400, weight_driver = 120)

# 1d) What about?
ferry <- data.frame(weight_car = 1600, weight_driver = 80)

# 1e) Also try
weight <- c(1/ferry$weight_car, 1/ferry$weight_driver)
match_restrictions(ferry, ferry_rules, weight = weight)

# 1f) And also
match_restrictions(ferry, ferry_rules, adjust=matrix(c(TRUE,FALSE), nrow=1))




