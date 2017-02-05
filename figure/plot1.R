## Preliminar settings
library(readr) #for reading the txt
library(lubridate) #for using year, month and mday
png("plot1.png", width=480, height=480) #Open a PNG Device 

## Read the data base
DF <- read_delim("household_power_consumption.txt", ";", col_types ="ccnnnnnnn",na = "?")
DF$Date<- as.Date(DF$Date,"%d/%m/%Y")
DF<-DF[year(DF$Date)==2007 & month(DF$Date)==2 & (mday(DF$Date)==1 | mday(DF$Date)==2),]
DF$Time <- strptime(paste(DF$Date,DF$Time),format = "%Y-%m-%d %H:%M:%S")

## Plot 
with(DF,hist(Global_active_power,xlab = "Global Active Power (kilowatts)", 
             main="Global Active Power", col="red"))
dev.off()