
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filedownload <- download.file(fileUrl, destfile = "./Data/AnalysisProject1.zip")
##unzip file to destination of your choosing
data <- read.table("C:/Users/Jib Jab/Desktop/Data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Now to plot
DateAndTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(DateAndTime, globalActivePower, type= "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
