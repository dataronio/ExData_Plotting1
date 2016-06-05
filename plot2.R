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
png(filename='plot2.png',width=480,height=480)
par(mar=c(3,5,2,2)+0.1)
plot(subsetdf$datetime,subsetdf$Global_active_power,type="l",xlab=NULL,main=NULL,
     ylab="Global Active Power (kilowatts)")
dev.off()

