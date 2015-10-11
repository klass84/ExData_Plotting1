setwd("C:/Users/Claudiokass/Desktop/R")

#Clean data and create subset of data only for 1st and 2nd Feb 2007

data<-read.table("pconsumption.txt",sep=";",header=T,na.strings=c("?",""))
datt<-data
datt$Date <- as.Date(datt$Date, format = "%d/%m/%Y")
datt$timetemp <- paste(datt$Date, datt$Time)
datt$Time <- strptime(datt$timetemp, format = "%Y-%m-%d %H:%M:%S")
datt1<-datt[datt$Date == "2007-02-01" | datt$Date == "2007-02-02" ,]
rm(datt,data)

#create plot1

hist(datt1$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (Kilowatt)")
dev.print(png, file ="plot1.png", width=480, height=480)
dev.off