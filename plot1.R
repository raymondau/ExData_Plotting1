#
#  Plot 1. Histogram of Global Active Power comsumption.
#

#  Read the colon delimited file
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

#  Subset file to extract only records from dates 1/2/2007 and 2/2/2007
df1 <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")

#  Change the Global_active_power class from Factor to Numeric
df1$Global_active_power <- as.numeric(levels(df1$Global_active_power))[df1$Global_active_power]

#  Open PNG file plot1.png and set height and width to 480 pixels 
png(file="plot1.png",width=480,height=480)

#  Plot the histogram
hist(df1$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#  Close the device
dev.off()
