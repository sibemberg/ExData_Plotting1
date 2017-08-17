# Reading the data
data <- read.table("household_power_consumption.txt", header=T, sep= ";", na.strings = "?")

# Filtering just the needed dates
library(dplyr)
data <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

# Cleaning dates variables
library(lubridate) # Loads lubridate
data$dt <- paste(data$Date, data$Time, sep = " ") # create day-time vector
data$dt <- dmy_hms(data$dt) # format it as date


# Open the PNG device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfcol=c(2,2)) # to insert 4 plots at the same device

# Plot 1: Global Active Power
plot(data$dt, data$Global_active_power, type = "l", xlab="", ylab="Global Active Power")

# Plot 2: Energy sub metering
plot(x=data$dt, y=data$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering") # creates the plotting with submet1 
points(data$dt, data$Sub_metering_2, type = "l", col="red") # insert submet2
points(data$dt, data$Sub_metering_3, type = "l", col="blue") # insert submet3
#insert the legend:
legend("topright", lty="solid" ,col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

# Plot 3: Voltage
plot(data$dt, data$Voltage, ylab = "Voltage", xlab="datetime", type = "l")

# Plot 4: Global reactive power
plot(data$dt, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type = "l")


# Close PNG device
dev.off()

