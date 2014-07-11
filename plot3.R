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

# 5. Plot 3

with(data, 
  {plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,type="l",
        ylab="Global Active Power (kilowatts)", xlab="", col="Red")
  lines(Sub_metering_3~Datetime,type="l",
        ylab="Global Active Power (kilowatts)", xlab="",col="Blue")
})

legend("topright", lty=1, col = c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# 6. Save to a file

dev.copy(png, file = "plot3.png",height=480, width=620)
dev.off()