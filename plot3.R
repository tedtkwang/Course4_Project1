
# Read in Household Power Consumption data
# Uses data from dates 2007-02-01 and 2007-02-02
# Graph time series of Energy sub metering usage
# Save time series graph as plot3.png

data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
dataPlot<-data[data$Date%in%as.Date(c("2007-02-01","2007-02-02")),]
dataPlot$datetime<-strptime(paste(dataPlot$Date, dataPlot$Time), "%Y-%m-%d %H:%M:%S")

# plot time series graph with legend
plot(dataPlot$datetime,dataPlot$Sub_metering_1,type="n",xlab=NA,ylab="Energy sub metering")
lines(dataPlot$datetime,dataPlot$Sub_metering_1,col="black")
lines(dataPlot$datetime,dataPlot$Sub_metering_2,col="red")
lines(dataPlot$datetime,dataPlot$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# save plot to png file
dev.copy(png,file="plot3.png")
dev.off()

