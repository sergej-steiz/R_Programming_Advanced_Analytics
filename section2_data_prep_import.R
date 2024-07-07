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