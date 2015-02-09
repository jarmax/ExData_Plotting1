## Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?")

# Subset file - needs improvement
dataSubset <- subset(data, c(data$Date == "1/2/2007", data$Date == "2/2/2007"))
gap <- dataSubset$Global_active_power
time <- strptime(paste(dataSubset$Date,dataSubset$Time),
                 format = "%d/%m/%Y %H:%M:%S")

# Open png device
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
# Create plot
plot(time, gap, main = "", xlab = "", ylab = "Global active power (kW)", type = "l")
# Turn off device
dev.off()