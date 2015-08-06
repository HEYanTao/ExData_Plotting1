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

##Before Plot
par(mfrow=c(2,2),mar=c(4,4,1,1))

##Plot
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power", xlab="")
plot(data$Voltage~data$Datetime, type="l", ylab="Voltage", xlab="datetime")
plot(data$Sub_metering_1~data$Datetime, type="l", ylab="Global Active Power", xlab="")
lines(data$Sub_metering_2~data$Datetime,col='Red')
lines(data$Sub_metering_3~data$Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Global_reactive_power~data$Datetime, type="l", ylab="Global_Rective_Power",xlab="datetime")

##Generte File
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
