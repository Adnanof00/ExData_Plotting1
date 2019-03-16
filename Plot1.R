
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
G_A_M<-as.numeric(sub_data_elect$Global_active_power)

png("plot1.png", width=480, height=480)
hist(G_A_M,col = "red",main = "Global active power",xlab = "Global active power(kilowatts)")

dev.off()