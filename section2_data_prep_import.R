# import data into R

getwd()
#windows
setwd("C:\\Users\\Sergej\\R_Programming_Advanced_Analytics\\R_Programming_Advanced_Analytics")
#check again
getwd()

#read in data
fin <- read.csv("P3-Future-500-The-Dataset.csv", stringsAsFactors = T)


#read in data , confirm NA for missing/empty values
fin <- read.csv("P3-Future-500-The-Dataset.csv", stringsAsFactors = T, na.strings = c(""))



#investigate the fin data set
fin
head(fin)
tail(fin)
str(fin)

# changing from non-factor to factor:
# a few numeric variables are needed as categorical variables, as we do not want to make any descriptive statistics with them.

fin$ID <- factor(fin$ID)
summary(fin)
str(fin) # now we can see id is also recognized as a factor

fin$Inception <- factor(fin$Inception)
str(fin$Inception)

# Factor Variable Trap (FVT)
# the fact of FVT comes into play when you are trying to convert a variable from a factor into a non-factor

# Converting into Numeric for characters:
a <- c("12","13","14","12","12")
a
typeof(a)
b <- as.numeric(a)
b
typeof(b)

# Converting into Numeric for factors: 
z <-factor(c("12","13","14","12","12"))
typeof(z)

# now try the same as above
y <- as.numeric(z)
typeof(y)
#-------------- correct way:
# first to convert z into a character and then convert it into a factor
x <- as.numeric(as.character(z))
typeof(x)

# Factor Variable Trap (FVT) example:
head(fin)
str(fin)

#for the example purpose we will factorize Profit variable
fin$Profit <- factor(fin$Profit)
str(fin)
str(fin$Profit)

# overwriting with a wrong values happen here:
fin$Profit <- as.numeric(fin$Profit)
str(fin$Profit)
head(fin)
# now the top rows for Profit are looking completely different


# sub() and gsub() functions
?sub

fin$Expenses <- gsub(" Dollars","",fin$Expenses)
fin$Expenses <- gsub(",","",fin$Expenses)
head(fin)
str(fin)

# replace $ ->special character , we need to create an escape sequence with \\
fin$Revenue <- gsub("\\$","",fin$Revenue)
fin$Revenue <- gsub(",","",fin$Revenue)
head(fin)
str(fin)

fin$Growth <- gsub("%","",fin$Growth)
head(fin)
str(fin)

#finally we convert character to numeric. as above factors were converted to character with gsub function
fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Growth <- as.numeric(fin$Growth)
str(fin)
summary(fin)

# What is NA?

?NA

TRUE  #1
FALSE #0
NA
# fin <- read.csv("P3-Future-500-The-Dataset.csv", stringsAsFactors = T, na.strings = c(""))
# locating missing data
fin
head(fin,24)

# function to check if observation has no missing values
complete.cases(fin)
# here you can keep only non missing values
fin[complete.cases(fin),]

# here you can keep only missing values
fin[!complete.cases(fin),]

# filtering using which() for non missing data
head(fin)

#usual way
fin$Revenue==9746272
fin[fin$Revenue==9746272,] # also NA included as we are not able to confirm the value for NA cases

#now with which()
which(fin$Revenue==9746272)  # only return true values. the number of the correct rows 
fin[which(fin$Revenue==9746272),]

#another one example
head(fin)
fin[fin$Employees==45,]

fin[which(fin$Employees==45),]

#filtering using is.na() for missing data:
head(fin,24)


# get rows with NA in expenses variable
fin[!complete.cases(fin$Expenses),]

# you cannot compare anything to NA
fin$Expenses == NA
fin[fin$Expenses == NA,]

# another way to find NA use is.na()
# is.na() is checking if something is NA

a <- c(1,24,543,NA,76,45,NA)
a
is.na(a)
is.na(fin$Expenses)
fin[is.na(fin$Expenses),]
