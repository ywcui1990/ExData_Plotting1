
date <- as.Date(data$Date, "%d/%m/%Y")

globalActivePower <- data$Global_active_power[date=="2007-02-01" | date == "2007-02-02"]
globalActivePower <- as.numeric(globalActivePower)
globalActivePower <- globalActivePower/500

time <- data$Time[date=="2007-02-01" | date == "2007-02-02"]
day <- date[date=="2007-02-01" | date == "2007-02-02"]
tickloc = numeric()
for(i in 1:length(time)){
  if(time[i]=="00:00:00")
    tickloc = c(tickloc, i)
}
tickloc = c(tickloc, length(time))

plot(globalActivePower, col = "black", type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "", xaxt="n")

ticks =tickloc
axis(side = 1, at = ticks, labels = c("Thu","Fri","Sat" ))
axis(side = 2);
