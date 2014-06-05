rm(list = ls())
#Reading the data
clases<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
energyDataSet<-read.table(file="household_power_consumption.txt",sep=";",colClasses=clases, dec=".",header = TRUE,na.strings = "?")
energyDataSet$DataTime<-strptime(paste(energyDataSet$Date,energyDataSet$Time),format="%d/%m/%Y %H:%M:%S")
datosPrueba<-subset(energyDataSet,as.Date(DataTime)=="2007-02-01" | as.Date(DataTime)=="2007-02-02")

png(file = "plot3.png", width=480, height=480)
plot(datosPrueba$DataTime,datosPrueba$Sub_metering_1,ylab="Energy sub metering",
     xlab="", type="l")
lines(datosPrueba$DataTime,datosPrueba$Sub_metering_2, type="l",  col="red")
lines(datosPrueba$DataTime,datosPrueba$Sub_metering_3, type="l",  col="blue")
legend("topright", lty=1, col = c("black","red", "blue"), legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.off() 