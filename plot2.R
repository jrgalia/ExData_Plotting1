#reads a file in table format
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", dec=".")

#subsetting Feb 1-2, 2007
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plotting to png: 480x480
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()