
#Autors: ahmedadnane.boutahar@gmail.com

###Importing Data

url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

zipfile<-'data_set.zip'

if(!file.exists(zipfile))
{  
  download.file(url,zipfile,mode="wb")
  unzip(zipfile)
}


data_elect<-read.csv('household_power_consumption.txt',skip=1,sep = ";",dec=".")


names(data_elect)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

sub_data_elect<-subset(data_elect,data_elect$Date=="1/2/2007"|data_elect$Date=="2/2/2007")

Date_Time<-strptime(paste(sub_data_elect$Date,sub_data_elect$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
G_A_M<-as.numeric(as.character(sub_data_elect$Global_active_power))
png("plot2.png", width=480, height=480)
plot(Date_Time,G_A_M,type = "l",ylab = "Global active power(Kilowatts)",xlab = "")

dev.off()