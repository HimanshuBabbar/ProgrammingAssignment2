library(shiny)
library(googleVis) 
library(lubridate)

nData <- read.csv("national.csv", as.is = T)

nCleanData <- subset(nData, subset = (Subdma != "Global"))
nCleanData$Week <- as.Date(mdy_hm(nCleanData$Week))


sData <- read.csv("spot.csv", as.is = T)

sCleanData <- subset(sData, subset = (Subdma != "Global"))
sCleanData$Week <- as.Date(mdy_hm(sCleanData$Week))

#Removing dma markets
sCleanData$Subdma <- substr(sCleanData$Subdma, 1,3)

# Applying aggregate over each dma group and 
# finding the sum of CLTV
sCleanData <- aggregate(CLTV ~ Subdma, sCleanData, sum)
