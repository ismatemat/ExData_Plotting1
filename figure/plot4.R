## Preliminar settings
Sys.setlocale("LC_TIME", "English") #I'm from Mexico, I need to set the language
library(readr) #for reading the txt
library(lubridate) #for using year, month and mday
png("plot4.png", width=480, height=480) #Open a PNG Device 
par(mfrow=c(2,2))

## Read the data base
DF <- read_delim("household_power_consumption.txt", ";", col_types ="ccnnnnnnn",na = "?")
DF$Date<- as.Date(DF$Date,"%d/%m/%Y")
DF<-DF[year(DF$Date)==2007 & month(DF$Date)==2 & (mday(DF$Date)==1 | mday(DF$Date)==2),]
DF$Time <- strptime(paste(DF$Date,DF$Time),format = "%Y-%m-%d %H:%M:%S")

## Plot 
with(DF, {plot(Time,Global_active_power,type="l", 
               xlab="", ylab="Global Active Power")
        plot(Time,Voltage,type="l", 
             xlab="datetime")
        plot(Time,Sub_metering_1,type="l", 
              xlab="", ylab="Energy sub metering")
        lines(Time,Sub_metering_2,col="red")
        lines(Time,Sub_metering_3,col="blue")
        legend("topright", lty=1, 
               col=c("black","red","blue"),
               legend =names(DF)[7:9], bty = "n")
        plot(Time,Global_reactive_power,type="l", 
             xlab="datetime")
})
par(mfrow=c(1,1))
dev.off()
