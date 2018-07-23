setwd("~/Desktop/Coursera/4- Exploratory Data Analysis/Course Project 1")
library("data.table")

##Downloading the zip:
url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f<- file.path(getwd(), "Household.zip")
download.file(url, f)
unzip(zipfile="./Household.zip",exdir="./Data")
file<- file.path("./Data" , "Household")
householdFile <- "./Data/household_power_consumption.txt"

plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")
head(plotData)

##Set time
finalData<- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime<- strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData<- cbind(SetTime, finalData)
head(finalData)

##Plot 1
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
