df <- read.csv("C:/Users/lenovo/Downloads/household_power_consumption.txt", header=T, sep=';', na.strings="?")
# Subsetting the Data based on Date
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df_Req <- subset(df, df$Date == "2007-02-01"|df$Date == "2007-02-02")
# Changing Date & Time Variables
df_Req$Date <- as.Date(df_Req$Date, format="%d/%m/%Y")
df_Req$Time <- strptime(df_Req$Time, format="%H:%M:%S")
rownames(df_Req) <- seq(length=nrow(df_Req))
df_Req[1:1440,"Time"] <- format(df_Req[1:1440,"Time"],"2007-02-01 %H:%M:%S")
df_Req[1441:2880,"Time"] <- format(df_Req[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#Plot the chart
plot(df_Req$Time,df_Req$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
#title(main="Global Active Power Vs Time")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()