
## Imputation ----

# try the following code
library(simputation)
library(magrittr)
companies <- read.csv("03valid/errors_located.csv",stringsAsFactors = FALSE)

# for convenience, we take only the financial variables
finvar <- companies[7:14]
head(finvar, 3)

# Let's study the behavior of 'simputation' a bit.

# 1. Impute 'other.rev', using a linear model, with 'turnover' and 'total.rev' 
# as predictors.
imputed <- impute_lm(finvar, other.rev ~ total.rev + turnover)

# Compare 
head(finvar,3)
# with 
head(imputed,3)  
# is other.rev imputed everywhere? Explain what happened

# let's make a plot: imputed data in blue
plot(imputed$turnover, imputed$other.rev, col='blue', pch=16)
# overlay with original data in black so imputed data stands out.
points(finvar$turnover, finvar$other.rev, col='black',pch=16)

# 2. Now use a robust linear model (M-estimator) to impute
#    'staff.costs' as a function of 'staff'. Use 'impute_rlm'
#    and make the same plot (but for staff and staff costs).


# 3. The same imputation, but we now add a random residual.
#    use impute_rlm, and add the option add_residual="normal"
#    plot the results again.
set.seed(2019)



## Assignment (on slide) ----

