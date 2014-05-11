electricity <- read.table ("household_power_consumption.txt", sep = ";", header = TRUE,colClasses = "character")
head (electricity)
data <- subset (electricity, Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- as.Date (data$Date, format = "%d/%m/%Y")
data$newdate <- strptime (paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
data$days <- weekdays (data[,"newdate"], abbreviate = TRUE)
data [,7] <- as.numeric (data[,7])
data [,8] <- as.numeric (data[,8])
data [,9] <- as.numeric (data[,9])
x <- data [,10]
a <- data [,7]
b <- data [,8]
c <- data [,9]
png (file ="Plot3.png")
par (mar = c(3,4,1,1))
plot (x,a, type ="l", ylab = "Energy sub metering")
lines (x,b, col= "red")
lines (x,c, col = "blue")
legend ("topright",lwd = "1", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()