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

# 5. Plot 2

plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

# 6. Save to a file

dev.copy(png, file = "plot2.png")
dev.off()