# Load data
df <- read.table("household_power_consumption.txt", 
                 header = TRUE, sep = ";", na.strings = "?")

# Keep only useful data
df <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# Create DateTime column
df$DateTime <- strptime(paste(df$Date, df$Time), 
                        format="%d/%m/%Y %H:%M:%S")

# Create plot
png("plot4.png", width = 480, height = 480, 
    units = "px", bg = "white")

par(mfrow = c(2,2))

plot(df$DateTime, df$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power")

plot(df$DateTime, df$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")

with(df, plot(DateTime, Sub_metering_1, xlab="", 
              ylab="Energy Sub Metering", type="n"))
with( df[,c(10,7)], lines(df[,c(10,7)], col="Black") )
with( df[,c(10,8)], lines(df[,c(10,8)], col="Red") )
with( df[,c(10,9)], lines(df[,c(10,9)], col="Blue") )
legend("topright", lty=1, col=c("Black","Red","Blue"), 
       legend=c("Sub_metering_1","Sub_metering_2",
                "Sub_metering_3"))

plot(df$DateTime, df$Global_reactive_power, 
     type="h", xlab="datetime", ylab="Global_reactive_power")

dev.off()