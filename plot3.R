#general configurations
Sys.setlocale("LC_TIME", "C")

#load data
data=read.csv(file="household_power_consumption.txt",colClasses=c(rep("character",7)),header=TRUE,sep=";",nrow=70000)
data = data[data$Date %in% c("1/2/2007", "2/2/2007"),]
for (i in 3:dim(data)[2]){
  data[,i] = as.numeric(data[,i],dec=".")
}
data$datetime=strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$datetime=as.POSIXct(data$datetime)

##generate plot3.png
png("plot3.png",width=480,height=480,units="px",bg = "transparent")
plot(data$Sub_metering_1~data$datetime,type="l",xlab="",ylab="Energy sub metering")
lines(data$Sub_metering_2~data$datetime,col="red")
lines(data$Sub_metering_3~data$datetime,col="blue")
legend("topright",lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()