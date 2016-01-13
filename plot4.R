fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filedownload <- download.file(fileUrl, destfile = "./Data/AnalysisProject1.zip")
##unzip file to destination of your choosing
data <- read.table("C:/Users/Jib Jab/Desktop/Data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Set up of all variables for plot
DateAndTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric <- as.numeric(subSetData$Voltage)
submetering1 <- as.numeric(subSetData$Sub_metering_1)
submetering2 <- as.numeric(subSetData$Sub_metering_2)
submetering3 <- as.numeric(subSetData$Sub_metering_3)

##Now to plot
png("plot4.png", width=480, height=480)
##Need to identify how these plots will be displayed 2 x 2
par(mfrow = c(2, 2))
plot(DateAndTime, globalActivePower, type="l", xlab="", ylab= "Global Active Power")
plot(DateAndTime, voltage, type="l", xlab="DateAndTime", ylab="Voltage")
plot(DateAndTime, submetering1, type="l", xlab="", ylab="Energy Sub metering")
lines(DateAndTime, submetering2, type="l", col="red")
lines(DateAndTime, submetering3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), c("sub_metering_1", "sub_metering_2", "sub_metering_3"),lty=c(1,1), lwd=c(1,1))
plot(DateAndTime, globalReactivePower, type="l", xlab="DateAndTime", ylab="Global_reactive_power")
dev.off()
