# 1. Get the dataset 

dataset <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

# 2. Subset the dataset

data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# 3. Remove the full dataset (not necessary but otherwise computer will have this huge dataset in its memory)

rm(dataset)

# 4. Convert dates

date_time <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(date_time)

# 5. Plot 4

par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data, {
  plot(Global_active_power~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  
  plot(Voltage~Datetime, type="l",ylab="Voltage (volt)", xlab="")
  
  plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})



# 6. Save to a file

dev.copy(png, file = "plot4.png", height=520, width=620)
dev.off()