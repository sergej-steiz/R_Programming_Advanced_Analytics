# MEDIAN imputation
getwd()
#windows
setwd("C:\\Users\\Sergej\\R_Programming_Advanced_Analytics\\R_Programming_Advanced_Analytics")
#check again
getwd()

#read in data , confirm NA for missing/empty values
fin <- read.csv("P3-Future-500-The-Dataset.csv", stringsAsFactors = T, na.strings = c(""))

fin$Expenses <- gsub(" Dollars","",fin$Expenses)
fin$Expenses <- gsub(",","",fin$Expenses)
# replace $ ->special character , we need to create an escape sequence with \\
fin$Revenue <- gsub("\\$","",fin$Revenue)
fin$Revenue <- gsub(",","",fin$Revenue)
fin$Growth <- gsub("%","",fin$Growth)
#finally we convert character to numeric. as above factors were converted to character with gsub function
fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Growth <- as.numeric(fin$Growth)
str(fin)
summary(fin)
#Replacing Missing Data: Factual Analysis:
fin[!complete.cases(fin),]
fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City=="New York",]
# overwrite values with "New York"
fin[is.na(fin$State) & fin$City=="New York","State"] <- "NY"
# check
fin[c(11,379),]

fin[!complete.cases(fin),]
# overwrite values with "San Francisco"
fin[is.na(fin$State) & fin$City=="San Francisco","State"] <- "CA"

############################### Replacing Missing Data: Median Imputation Method (Part 1)
fin[!complete.cases(fin),]

median(fin[,"Employees"])
median(fin[,"Employees"], na.rm = TRUE)
#mean(fin[,"Employees"], na.rm = TRUE)

median(fin[fin$Industry=="Retail","Employees"], na.rm = TRUE)
# is always a good idea to save the median as a vector
med_empl_retail <- median(fin[fin$Industry=="Retail","Employees"], na.rm = TRUE)

# now we want to replace NA Employees with that median
# our filter
fin[is.na(fin$Employees) & fin$Industry=="Retail",]

# replace NA for Employees column using filter 
fin[is.na(fin$Employees) & fin$Industry=="Retail","Employees"] <- med_empl_retail
#check:
fin[3,]

# now the same for Employees in Financial Services industry:
median(fin[fin$Industry=="Financial Services","Employees"], na.rm = TRUE)
# is always a good idea to save the median as a vector
med_empl_financial <- median(fin[fin$Industry=="Financial Services","Employees"], na.rm = TRUE)
# our filter
fin[is.na(fin$Employees) & fin$Industry=="Financial Services",]

# replace NA for Employees column using filter 
fin[is.na(fin$Employees) & fin$Industry=="Financial Services","Employees"] <- med_empl_financial
#check:
fin[332,]

fin <- fin[!is.na(fin$Industry),]
rownames(fin) <- NULL


############################### Replacing Missing Data: Median Imputation Method (Part 2)

fin[!complete.cases(fin),]
med_growth_constr <- median(fin[fin$Industry=="Construction","Growth"], na.rm = TRUE)

# replace NA for Growth column using filter 
fin[is.na(fin$Growth) & fin$Industry=="Construction","Growth"] <- med_growth_constr
#check:
fin[8,]

med_revenue_constr <- median(fin[fin$Industry=="Construction","Revenue"], na.rm = TRUE)
#median(fin[,"Revenue"], na.rm = TRUE) 

# replace NA for Revenue column using filter 
fin[is.na(fin$Revenue) & fin$Industry=="Construction","Revenue"] <- med_revenue_constr
#check:
fin[c(8,42),]

med_expenses_constr <- median(fin[fin$Industry=="Construction","Expenses"], na.rm = TRUE)
#median(fin[,"Expenses"], na.rm = TRUE)

# replace NA for Expenses column using filter 
fin[is.na(fin$Expenses) & fin$Industry=="Construction","Expenses"] <- med_expenses_constr
#check:
fin[c(8,42),]

med_expenses_it <- median(fin[fin$Industry=="IT Services","Expenses"], na.rm = TRUE)
#median(fin[,"Expenses"], na.rm = TRUE)

# replace NA for Expenses column using filter 
fin[is.na(fin$Expenses) & fin$Industry=="IT Services","Expenses"] <- med_expenses_it
#check:
fin[15,]

fin[!complete.cases(fin),]
