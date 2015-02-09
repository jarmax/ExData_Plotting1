## Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?")

# Subset file - needs improvement
dataSubset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Data for plotting
volt <- dataSubset$Voltage
gap <- dataSubset$Global_active_power
grp <- dataSubset$Global_reactive_power
sm1 <- dataSubset$Sub_metering_1
sm2 <- dataSubset$Sub_metering_2
sm3 <- dataSubset$Sub_metering_3
time <- strptime(paste(dataSubset$Date,dataSubset$Time),
                 format = "%d/%m/%Y %H:%M:%S")

# Open png device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

# Command for subplotting
par(mfcol = c(2, 2))

# Create plot 1
plot(time, gap, main = "", xlab = "", ylab = "Global active power (kW)",
     type = "l")

# Create plot 2
plot(time, sm1, main = "", xlab = "", ylab = "Energy sub metering",
     type = "l", col = "black")
lines(time, sm2, col = "red")
lines(time, sm3, col = "blue")
legend("topright", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
       col = c("black", "red", "blue"), lty = 1)

# Create plot 3
plot(time, volt, main = "", xlab = "datetime", ylab = "Voltage (V)",
     type = "l")

# Create plot 1
plot(time, grp, main = "", xlab = "datetime", ylab = "Global reactive power (kW)",
     type = "l")

# Turn off device
dev.off()