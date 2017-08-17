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
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Plot 2:
plot(data$dt, data$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

# Close PNG device
dev.off()

