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
par(mfrow=c(2,2))
with(df_Req,{
  plot(df_Req$Time,df_Req$Global_active_power,type="l",  xlab="",ylab="Global Active Power")  
  plot(df_Req$Time,df_Req$Voltage, type="l",xlab="datetime",ylab="Voltage")
  plot(df_Req$Time,df_Req$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(df_Req,lines(Time,Sub_metering_1,col = "Black"))
  with(df_Req,lines(Time,Sub_metering_2, col ="Red"))
  with(df_Req,lines(Time,Sub_metering_3,col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.2)
  plot(df_Req$Time,df_Req$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
