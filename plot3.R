data <- read.table("household_power_consumption.txt", 
                   na.strings = "?",
                   header=T,
                   stringsAsFactors = F,
                   sep=";")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "), 
                            format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
date <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- data[data$Date %in% date,]

png(filename="figure/plot3.png", width=480, height=480)
plot(data$DateTime, 
     data$Sub_metering_1, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Energy sub metering", 
     main="")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", 
       lwd=1, 
       lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()