
# Read in Household Power Consumption data
# Uses data from dates 2007-02-01 and 2007-02-02
# Graph time series of Global active power, Voltage, Energy sub metering, Global reactive power usage
# Save time series graph as plot4.png

data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
dataPlot<-data[data$Date%in%as.Date(c("2007-02-01","2007-02-02")),]
dataPlot$datetime<-strptime(paste(dataPlot$Date, dataPlot$Time), "%Y-%m-%d %H:%M:%S")

# 4 graphs in 2 rows and 2 cols
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

# time series graph of Global active power
plot(dataPlot$datetime,dataPlot$Global_active_power,type="n",xlab=NA,ylab="Global Active Power") 
lines(dataPlot$datetime,dataPlot$Global_active_power)

# time series graph of Voltage
plot(dataPlot$datetime,dataPlot$Voltage,type="n",xlab="datetime",ylab="Voltage") 
lines(dataPlot$datetime,dataPlot$Voltage)

# time series graph of Energy sub metering
plot(dataPlot$datetime,dataPlot$Sub_metering_1,type="n",xlab=NA,ylab="Energy sub metering")
lines(dataPlot$datetime,dataPlot$Sub_metering_1,col="black")
lines(dataPlot$datetime,dataPlot$Sub_metering_2,col="red")
lines(dataPlot$datetime,dataPlot$Sub_metering_3,col="blue")
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# time series graph of Global reactive power
plot(dataPlot$datetime,dataPlot$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power") 
lines(dataPlot$datetime,dataPlot$Global_reactive_power)

# save plot to png file
dev.copy(png,file="plot4.png")
dev.off()

