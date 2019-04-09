##start reading the data from line 66638 and read 2881 lines
power1<-read.table("household_power_consumption.txt",skip=66637, nrows=2881,sep=";")
## read the first line of the data
header<-read.table("household_power_consumption.txt",nrows=1, sep=";", stringsAsFactors = FALSE)
colnames(power1)<-header
power1$Date<-as.Date(power1$Date, "%e/%m/%Y")
power1$time<-strptime(paste(power1$Date, power1$Time), "%Y-%m-%d %H:%M:%S")
power1$datetime<-as.POSIXct(power1$time)
with(power1, plot(datetime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
lines(power1$datetime, power1$Sub_metering_1, col="black")
lines(power1$datetime, power1$Sub_metering_2, col="red")
lines(power1$datetime, power1$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red","blue"), x.intersp=0.5, y.intersp=0.5)
dev.copy(png, file = "plot3.png", height=480, width=480,units="px")
dev.off()