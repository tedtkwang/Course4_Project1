
# Read in Household Power Consumption data
# Uses data from dates 2007-02-01 and 2007-02-02
# Graph time series of Global Active Power usage
# Save time series graph as plot2.png

data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
dataPlot<-data[data$Date%in%as.Date(c("2007-02-01","2007-02-02")),]
dataPlot$datetime<-strptime(paste(dataPlot$Date, dataPlot$Time), "%Y-%m-%d %H:%M:%S")

# plot time series graph
plot(dataPlot$datetime,dataPlot$Global_active_power,type="n",xlab=NA,ylab="Global Active Power (kilowatts)") 
lines(dataPlot$datetime,dataPlot$Global_active_power)

# save time series graph to png file
dev.copy(png,file="plot2.png")
dev.off()

