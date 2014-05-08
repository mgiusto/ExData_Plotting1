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

##generate plot1.png
png("plot1.png",width=480,height=480,units="px",bg = "transparent")
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
