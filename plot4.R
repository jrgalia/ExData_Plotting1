#reads a file in table format
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", dec=".")

#subsetting Feb 1-2, 2007
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subset$Global_active_power)
globalReactivePower <- as.numeric(subset$Global_reactive_power)
voltage <- as.numeric(subset$Voltage)

sub1 <- as.numeric(subset$Sub_metering_1)
sub2 <- as.numeric(subset$Sub_metering_2)
sub3 <- as.numeric(subset$Sub_metering_3)

#plotting
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex=0.2)
plot(datetime, voltage, type="l", ylab="Voltage (volt)")

plot(datetime, sub1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", ylab="Global_reactive_power")

dev.off()