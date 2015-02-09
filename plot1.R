## Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?")

# Subset file - needs improvement
dataSubset <- subset(data, c(data$Date == "1/2/2007", data$Date == "2/2/2007"))
gap <- dataSubset$Global_active_power


# Open png device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
# Create histogram
hist(gap, main = "Global active power", xlab = "Global active power (kW)",
     col = "red")
# Turn off device
dev.off()