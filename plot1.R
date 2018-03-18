#reads a file in table format
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", dec=".")

#subsetting Feb 1-2, 2007
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plotting to png: 480x480
globalActivePower <- as.numeric(subset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()