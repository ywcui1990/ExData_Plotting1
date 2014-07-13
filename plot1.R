
date <- as.Date(data$Date, "%d/%m/%Y")

globalActivePower <- data$Global_active_power[date=="2007-02-01" | date == "2007-02-02"]
globalActivePower <- as.numeric(globalActivePower)
globalActivePower <- globalActivePower/500
hist(globalActivePower, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
