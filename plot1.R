setwd("C:/Users/Usuarioç/Desktop/carlos/Exploratory analysis/ExData_Plotting1")
getwd()
rm(list = ls())
#Reading the data
clases<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
energyDataSet<-read.table(file="household_power_consumption.txt",sep=";",colClasses=clases, dec=".",header = TRUE,na.strings = "?")
energyDataSet$DataTime<-strptime(paste(energyDataSet$Date,energyDataSet$Time),format="%d/%m/%Y %H:%M:%S")
datosPrueba<-subset(energyDataSet,as.Date(DataTime)=="2007-02-01" | as.Date(DataTime)=="2007-02-02")

png(file = "plot1.png", width=480, height=480)
hist(datosPrueba$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()