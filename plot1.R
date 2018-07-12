
# Load data
df <- read.table("household_power_consumption.txt", 
                 header = TRUE, sep = ";", na.strings = "?")

# Keep only useful data
df <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")


# Create hist
png("plot1.png", width = 480, height = 480, 
    units = "px", bg = "white")
hist(df$Global_active_power, col = "Red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()