setwd("C:/Users/Claudiokass/Desktop/R")

#Clean data and create subset of data only for 1st and 2nd Feb 2007

data<-read.table("pconsumption.txt",sep=";",header=T,na.strings=c("?",""))
datt<-data
datt$Date <- as.Date(datt$Date, format = "%d/%m/%Y")
datt$timetemp <- paste(datt$Date, datt$Time)
datt$Time <- strptime(datt$timetemp, format = "%Y-%m-%d %H:%M:%S")
datt1<-datt[datt$Date == "2007-02-01" | datt$Date == "2007-02-02" ,]
rn(datt,data)

#create plot4

par(mfrow=c(2,2))
plot(datt1$Time,datt1$Global_active_power,ylab="Global Active Power", type="l",xlab="")
View(datt1)
View(datt1)
plot(datt1$Time,datt1$Voltage,ylab="Voltage", type="l",xlab="datetime")
plot(datt1$Time, datt1$Sub_metering_1 ,ylab="Energy Sub Metering", xlab="",type="n")
lines(datt1$Time,datt1$Sub_metering_1, col="black")
lines(datt1$Time,datt1$Sub_metering_2, col="red")
lines(datt1$Time,datt1$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black","red","blue"),lwd=c(2.5,2.5),bty="n")
plot(datt1$Time,datt1$Global_reactive_power,ylab="Global_reactive_power", type="l",xlab="datetime")
dev.print(png, file ="plot4.png", width=480, height=480)
dev.off