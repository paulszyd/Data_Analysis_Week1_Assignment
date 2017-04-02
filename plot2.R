library(lubridate)
power<-read.csv("./Course 4/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
power<-subset(power, Date=="1/2/2007" | Date=="2/2/2007")

power$Date<-as.Date(dmy(power$Date))
power$Time<-as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")
power$Global_active_power<-as.numeric(power$Global_active_power)

png(filename="plot2.png", height = 480, width = 480)
plot(power$Time, power$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", type="l", xlab="")
dev.off()


