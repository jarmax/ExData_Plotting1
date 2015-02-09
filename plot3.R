## Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?")

# Subset file - needs improvement
dataSubset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

sm1 <- dataSubset$Sub_metering_1
sm2 <- dataSubset$Sub_metering_2
sm3 <- dataSubset$Sub_metering_3
time <- strptime(paste(dataSubset$Date,dataSubset$Time),
                 format = "%d/%m/%Y %H:%M:%S")

# Open png device
# png(filename = "plot3.png",
#     width = 480, height = 480, units = "px")
# Create plot
plot(time, sm1, main = "", xlab = "", ylab = "Energy sub metering",
     type = "l", col = "green")
lines(time, sm2, col = "red")
lines(time, sm3)
# Turn off device
dev.off()