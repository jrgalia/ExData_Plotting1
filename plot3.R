#reads a file in table format
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", dec=".")

#subsetting Feb 1-2, 2007
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plotting to png: 480x480
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subset$Global_active_power)
sub1 <- as.numeric(subset$Sub_metering_1)
sub2 <- as.numeric(subset$Sub_metering_2)
sub3 <- as.numeric(subset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sub1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()