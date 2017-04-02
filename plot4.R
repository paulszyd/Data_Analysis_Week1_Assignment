library(lubridate)
power<-read.csv("./Course 4/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
power<-subset(power, Date=="1/2/2007" | Date=="2/2/2007")

power$Date <- as.Date(dmy(power$Date))
power$Time <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")
x <- as.POSIXct(power$Time)
power$Global_active_power<-as.numeric(power$Global_active_power)
power$Global_reactive_power<-as.numeric(power$Global_reactive_power)
power$Voltage <- as.numeric(power$Voltage)
sm1 <- power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
sm2 <- power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
sm3 <- power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

# Set device
png(filename="plot4.png", height = 480, width = 480)
par(mfrow=c(2,2))
# graphic 1
plot(x,power$Global_active_power, col="black", 
     ylab="Global Active Power", xlab="", type="l")
# graphic 2
plot(x,power$Voltage,   
     xlab = "datetime", ylab="Voltage", type="l")

# Get range of values for x, y
yrange <- range(c(sm1, sm2, sm3))
xrange <- range(x)

# graphic 3
plot(xrange, yrange, type="n",   
     ylab = "Energy sub metering", xlab="")

# Add lines for each sub metering vector
lines(x,sm1, type="l", col="black")
lines(x,sm2, type="l", col="red")
lines(x,sm3, type="l", col="blue")

# Create a legend at top right with proper labels, colors and line types 
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),  
       col=c("black","red", "blue"), lty=1, bty="n")

# graphic 4
plot(x,power$Global_reactive_power, col="black", 
     ylab="Global Active Power", xlab="datetime", type="l")
dev.off()

