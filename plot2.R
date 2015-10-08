# READ DATA
library(data.table)
mydata <- fread("household_power_consumption.txt", na.strings="?")
# We will only be using data from the dates 2007-02-01 and 2007-02-02
mydata.small <- (subset(mydata, Date=="1/2/2007" | Date=="2/2/2007"))
# convert the Date and Time variables to Date/Time classes in R
mydata.small$Date <- as.Date(mydata.small$Date, "%d/%m/%Y")
mydata.small$Time <- as.POSIXct(paste(mydata.small$Date, as.character(mydata.small$Time)))

# PLOT2
png("plot2.png", width = 480, height=480, type="window")
par(mfrow =  c(1,1))
with(mydata.small, {
    plot(Time, Global_active_power, type="l", 
         ylab = "Global Active Power (kilowatts)")
})
dev.off()