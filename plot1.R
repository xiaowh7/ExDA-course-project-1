data <- read.table("household_power_consumption.txt", 
                 na.strings = "?",
                 header=T,
                 stringsAsFactors = F,
                 sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
date <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- data[data$Date %in% date,]

png(filename="figure/plot1.png", width=480, height=480)
hist(data$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()