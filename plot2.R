#
#  Plot 2. Global Active Power comsumption over Time.
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

#  Change the Global_active_power class from Factor to Numeric
df1$Global_active_power <- as.numeric(levels(df1$Global_active_power))[df1$Global_active_power]

#  Open PNG file plot2.png and set height and width to 480 pixels 
png(file="plot2.png",width=480,height=480)

#  Plot the line chart
plot(df1$Time, df1$Global_active_power, type="l", ylab="Gloabal Active Power (kilowatts)", xlab="")

#  Close the device
dev.off()