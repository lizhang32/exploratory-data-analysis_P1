##start reading the data from line 66638 and read 2881 lines
power1<-read.table("household_power_consumption.txt",skip=66637, nrows=2881,sep=";")
## read the first line of the data
header<-read.table("household_power_consumption.txt",nrows=1, sep=";", stringsAsFactors = FALSE)
colnames(power1)<-header
power1$Date<-as.Date(power1$Date, "%e/%m/%Y")
power1$time<-strptime(paste(power1$Date, power1$Time), "%Y-%m-%d %H:%M:%S")
power1$datetime<-as.POSIXct(power1$time)
with(power1, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png, file = "plot2.png", height=480, width=480,units="px")
dev.off()