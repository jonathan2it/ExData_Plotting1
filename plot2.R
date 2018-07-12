# Load data
df <- read.table("household_power_consumption.txt", 
                 header = TRUE, sep = ";", na.strings = "?")

# Keep only useful data
df <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# Create DateTime column
df$DateTime <- strptime(paste(df$Date, df$Time), 
                        format="%d/%m/%Y %H:%M:%S")

# Create plot
png("plot2.png", width = 480, height = 480, 
    units = "px", bg = "white")

plot(df$DateTime, df$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()