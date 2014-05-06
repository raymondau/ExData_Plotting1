#
#  Plot 3. Energy sub metering usage over Time. 
#

#  Read the colon delimited file
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

#  Subset file to extract only records from dates 1/2/2007 to 2/2/2007
df1 <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")

#  Convert the Date column as a date class
df1$Date <- as.Date(df1$Date, format="%d/%m/%Y")

#  The Time field contains only the time element. We have to include the Date
#  element to ensure that we get the correct Day of Week that is required in the plot. 
df1$Time <- paste(as.character(df1$Date), as.character(df1$Time))
df1$Time <- strptime(df1$Time, format="%Y-%m-%d %H:%M:%S")

#  Set class of sub meterings 1 & 2 from Factor to Numeric.
#  Sub_metering_3 is already Nemeric
df1$Sub_metering_1 <- as.numeric(levels(df1$Sub_metering_1))[df1$Sub_metering_1]
df1$Sub_metering_2 <- as.numeric(levels(df1$Sub_metering_2))[df1$Sub_metering_2]

#  Open PNG file plot3.png and set height and width to 480 pixels 
png(file="plot3.png",width=480,height=480)

#  Plot the line chart
plot(df1$Time, df1$Sub_metering_1, type="l", yaxt="n", ylab="Energy sub metering", xlab="")
axis(side = 2, at = c(0,10,20,30))
lines(df1$Time, df1$Sub_metering_2, type="l", col="red")
lines(df1$Time, df1$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

#  Close the device
dev.off()