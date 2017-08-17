# Reading the data
data <- read.table("household_power_consumption.txt", header=T, sep= ";", na.strings = "?")

# Filtering just the needed dates
library(dplyr)
data <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")


# Open the PNG device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Plot 1: histogram
hist(data$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

# Close PNG device
dev.off()
