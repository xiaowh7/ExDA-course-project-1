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

png(filename="figure/plot2.png", width=480, height=480)
plot(data$DateTime, 
     data$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")
dev.off()