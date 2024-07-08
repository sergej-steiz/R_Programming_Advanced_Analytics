# import data into R

getwd()
#windows
setwd("C:\\Users\\Sergej\\R_Programming_Advanced_Analytics\\R_Programming_Advanced_Analytics")
#check again
getwd()

#read in data
fin <- read.csv("P3-Future-500-The-Dataset.csv", stringsAsFactors = T)

#investigate the fin data set
fin
head(fin)
tail(fin)
str(fin)

# changing from non-factor to factor:
# a few numeric variables are needed as categorical variables, as we do not want to make any descreptive statistics with them.

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




