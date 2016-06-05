# Note: You must download the data from the UCI Machine Learning 
# Repository on “Individual household electric power consumption Data Set” 
# Unzip the data and run the plot scripts in the same directory
# as "household_power_consumption.txt"
# Now we load data from household power consumption data
# subset it
#
file <- "household_power_consumption.txt"
data <- read.table(file,header=TRUE,sep=";",na.strings = "?",stringsAsFactors = F,as.is=T)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
subsetdf <- subset(data,(Date == "2007-02-01") | (Date == "2007-02-02"))
subsetdf <- within(subsetdf, datetime <- as.POSIXlt(paste(Date,Time)))

# open png graphics and output our plot
png(filename='plot4.png',width=480,height=480)
par(mfcol = c(2,2), mar=c(4,5,2,2))
plot(subsetdf$datetime,subsetdf$Global_active_power,type="l",
     xlab="",main=NULL,ylab="Global Active Power")
plot(subsetdf$datetime,subsetdf$Sub_metering_1,type="n",xlab="",main=NULL,ylab="Energy Sub Metering")
lines(subsetdf$datetime,subsetdf$Sub_metering_1,col="black")
lines(subsetdf$datetime,subsetdf$Sub_metering_2,col="red")
lines(subsetdf$datetime,subsetdf$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       title=NULL,lty=c(1,1),lwd=c(1,1),col=c("black","red","blue"),
       cex=.85,bty="n")
plot(subsetdf$datetime,subsetdf$Voltage,type="l",xlab="datetime",
     main=NULL,ylab="Voltage")
plot(subsetdf$datetime,subsetdf$Global_reactive_power,type="l",xlab="datetime",
     main=NULL,ylab="Global_reactive_power")
dev.off()