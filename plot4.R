##start reading the data from line 66638 and read 2881 lines
power1<-read.table("household_power_consumption.txt",skip=66637, nrows=2881,sep=";")
## read the first line of the data
header<-read.table("household_power_consumption.txt",nrows=1, sep=";", stringsAsFactors = FALSE)
##assign the column names
colnames(power1)<-header
## convert to Date using as.Date function
power1$Date<-as.Date(power1$Date, "%e/%m/%Y")
power1$time<-strptime(paste(power1$Date, power1$Time), "%Y-%m-%d %H:%M:%S")
power1$datetime<-as.POSIXct(power1$time)
par(mfrow=c(2,2))
with(power1, {
  plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
  plot(datetime, Voltage, type="l")
  plot(datetime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
  with(power1, lines(datetime, Sub_metering_1))
  with(power1, lines(datetime, Sub_metering_2, col="red"))
  with(power1, lines(datetime, Sub_metering_3, col="blue"))
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red","blue"),bty="n", cex=0.75)
  plot(datetime, Global_reactive_power, type="l")
}
)
dev.copy(png, file = "plot4.png", height=480, width=480, units="px")
dev.off()



