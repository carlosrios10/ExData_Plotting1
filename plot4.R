rm(list = ls())
#Reading the data
clases<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
energyDataSet<-read.table(file="household_power_consumption.txt",sep=";",colClasses=clases, dec=".",header = TRUE,na.strings = "?")
energyDataSet$DataTime<-strptime(paste(energyDataSet$Date,energyDataSet$Time),format="%d/%m/%Y %H:%M:%S")
datosPrueba<-subset(energyDataSet,as.Date(DataTime)=="2007-02-01" | as.Date(DataTime)=="2007-02-02")

png(file = "plot4.png", width=480, height=480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(datosPrueba$DataTime,datosPrueba$Global_active_power,ylab="Global Active Power (kilowatts)",
     xlab="", type="l")

plot(datosPrueba$DataTime,datosPrueba$Voltage,ylab="Voltage",xlab="datatime"
     , type="l")
plot(datosPrueba$DataTime,datosPrueba$Sub_metering_1,ylab="Energy sub metering",
     xlab="", type="l")
lines(datosPrueba$DataTime,datosPrueba$Sub_metering_2, type="l",  col="red")
lines(datosPrueba$DataTime,datosPrueba$Sub_metering_3, type="l",  col="blue")
legend("topright",bty="n", lty=1, col = c("black","red", "blue"), legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))

plot(datosPrueba$DataTime,datosPrueba$Global_reactive_power,ylab="Global_reactive_power",
     xlab="datatime", type="l")
dev.off() 