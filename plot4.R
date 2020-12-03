temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), na.strings = "?", sep = ";", header = TRUE)
unlink(temp)

data$dateTime = paste(data$Date, data$Time)
data$dateTime <- strptime(as.character(data$dateTime), "%d/%m/%Y %H:%M:%S")
# Subsetting to 2 day period Feb 2007
subsData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
head(subsData)

#Q4
subsData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
par(mfrow = c(2, 2))
#P1
plot(as.numeric(subsData$dateTime), subsData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", xaxt = "n")
axis(side = 1, at = c(1170295200, 1170381570, 1170467940), labels = c("Thu", "Fri", "Sat"))
#P2
plot(as.numeric(subsData$dateTime), subsData$Voltage, type = "l", xlab = "", ylab = "Voltage", xaxt = "n")
axis(side = 1, at = c(1170295200, 1170381570, 1170467940), labels = c("Thu", "Fri", "Sat"))
#P3
plot(as.numeric(subsData$dateTime), subsData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(as.numeric(subsData$dateTime), subsData$Sub_metering_2, col = "red")
lines(as.numeric(subsData$dateTime), subsData$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
axis(side = 1, at = c(1170295200, 1170381570, 1170467940), labels = c("Thu", "Fri", "Sat"))
#P4
plot(as.numeric(subsData$dateTime), subsData$Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power", xaxt = "n")
axis(side = 1, at = c(1170295200, 1170381570, 1170467940), labels = c("Thu", "Fri", "Sat"))
dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()