electricity <- read.table ("household_power_consumption.txt", sep = ";", header = TRUE,colClasses = "character")
head (electricity)
data <- subset (electricity, Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- as.Date (data$Date, format = "%d/%m/%Y")
data$newdate <- strptime (paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
data$days <- weekdays (data[,"newdate"], abbreviate = TRUE)
data[,3] <- as.numeric(data[,3])
x <- data [,10]
y <- data [,3]
png(file = "Plot2.png")
plot(x,y,type="l",xlab = "", ylab = "Global Active Power (kilowatts")
par (mar = c(4,4,2,2))
dev.off()