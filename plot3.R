##Before we start,get prepararion done
setwd("C:\\Users\\Mark\\Desktop\\coursera\\Explortary Data\\ExData_Plotting1")

##Read in data
data<- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##Subset the date
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

##Deal with the date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dt<- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(dt)

##Plot
plot(data$Sub_metering_1~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="",col='Black')
lines(data$Sub_metering_2~data$Datetime,col='Red')
lines(data$Sub_metering_3~data$Datetime,col='Blue')

legend("topright", col=c("black", "red", "blue"),lwd=1,lty=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),xjust=1)

##Generte File
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
