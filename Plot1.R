df <- read.csv("C:/Users/lenovo/Downloads/household_power_consumption.txt", header=T, sep=';', na.strings="?")
# Subsetting the Data based on Date
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df_Req <- subset(df, df$Date == "2007-02-01"|df$Date == "2007-02-02")
# Plot
hist(df_Req$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#Get Picture
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
