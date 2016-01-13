fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filedownload <- download.file(fileUrl, destfile = "./Data/AnalysisProject1.zip")
##unzip file to destination of your choosing
data <- read.table("C:/Users/Jib Jab/Desktop/Data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Now to plot / had a lot of errors with x and y of different lengths and resolved issue with sub_metering_1 versus Sub_metering_1 in variable name. 
DateAndTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
submetering1 <- as.numeric(subSetData$Sub_metering_1)
submetering2 <- as.numeric(subSetData$Sub_metering_2)
submetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(DateAndTime, submetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(DateAndTime, submetering2, type="l", col="red")
lines(DateAndTime, submetering3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), c("sub_metering_1", "sub_metering_2", "sub_metering_3"),lty=c(1,1), lwd=c(1,1))
dev.off()
