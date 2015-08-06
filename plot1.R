##Before we start,get prepararion done
setwd("C:\\Users\\Mark\\Desktop\\coursera\\Explortary Data\\ExData_Plotting1")

##Read in data
data<- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##Subset the date
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

##Plot
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
