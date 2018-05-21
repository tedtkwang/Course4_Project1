
# Read in Household Power Consumption data
# Uses data from dates 2007-02-01 and 2007-02-02
# Graph histogram of Global Active Power usage
# Save histogram as plot1.png

data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
dataPlot<-data[data$Date%in%as.Date(c("2007-02-01","2007-02-02")),]
dataPlot$datetime<-strptime(paste(dataPlot$Date, dataPlot$Time), "%Y-%m-%d %H:%M:%S")

# plot histogram
hist(dataPlot$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# save histogram to png file
dev.copy(png,file="plot1.png")
dev.off()

