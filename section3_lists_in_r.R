#lists in R
# deliverable - a list with the following components:
# character: Machine name
# vector: (min, mean, max) Utilization for the month (excluding unknown hours)
# logical: Has utilization ever fallen below 90%  TRUE/FALSE
# vector: all hours where utilization is unknown (NAs)
# dataframe: for this machine
# plot : for all machines

getwd()
setwd("C:\\Users\\Sergej\\R_Programming_Advanced_Analytics\\R_Programming_Advanced_Analytics")
getwd()

util <- read.csv("P3-Machine-Utilization.csv", stringsAsFactors = T, na.strings = c(""))
str(util)
head(util,12)
summary(util)

# derive utilization column
util$Utilization <- 1 - util$Percent.Idle
head(util,12)

# handling Date-Times in R
# universal type of format
?POSIXct
as.POSIXct(util$Timestamp, format="%d/%m/%Y %H:%M")
util$PosixTime <- as.POSIXct(util$Timestamp, format="%d/%m/%Y %H:%M") 
summary(util)
#TIP: how to rearange columns in a data frame
util$Timestamp <- NULL
util <- util[,c(4,1,2,3)]
head(util)
