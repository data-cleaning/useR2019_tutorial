# Statistical Data Cleaning
# Mark van der Loo and Edwin de Jonge
# useR!2019

# We start with json file that was collected/scraped from a websource

# We use the jsonlite to read in the data
companies_raw <- jsonlite::read_json("01raw/companies.json")

# look at the structure 
str(companies_raw)

# Ok, jsonlite has read it as a list, we have to supply simplifyVector = TRUE
# so it will turn it into a data.frame (if possible)
companies_raw <- jsonlite::read_json("01raw/companies.json", simplifyVector = TRUE)

str(companies_raw)

# We have read the data into a data.frame, but is the data "technically" 
# correct?

# 1 Look at the type and contents of the columns, discuss with your neighbor
# which technical problems with the data you see.
# e.g. what data type do you expect each column to be?

# 2 fix the "staff" column, which should be turned into a integer, check if we 
# correctly introduced NA's.
staff <- as.integer(companies_raw$staff)

# did we correctly introduced NA?
unique(companies_raw$staff[is.na(staff)])

# if so, update raw_data:
companies_raw$staff <- staff

# 3 Turn profit into a numeric, by first removing its unit.
# hint, try `str_*` functions from `stringr` or `parse_*`  from `readr`
profit <- readr::parse_number(companies_raw$profit)

# 4 Do this for all financial columns.
companies_raw[-c(1,2)] <- lapply(companies_raw[-c(1,2)], readr::parse_number)

# 5 save the resulting data.frame:
write.csv(companies_raw, "01raw/my_companies.csv", row.names = FALSE, na ="")

# Assignment 6 SEE SLIDE

library(XML)
backbone_xml <- XML::xmlParse("01raw/backbone.xml")
backbone <- XML::xmlToDataFrame(backbone_xml)

# remove spaces
backbone$zipcode <- str_remove_all(backbone$zipcode, " ")
# to uppercase
backbone$zipcode <- str_to_upper(backbone$zipcode)

# and save the result
write.csv( backbone, "01raw/my_backbone.csv"
           , row.names = FALSE, na="")
