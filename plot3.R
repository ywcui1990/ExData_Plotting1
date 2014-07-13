date <- as.Date(data$Date, "%d/%m/%Y")

submeters <- data[date=="2007-02-01" | date == "2007-02-02",c(7,8,9)]
submeter1 <- as.numeric(submeters[,1])
submeter2 <- as.numeric(submeters[,2])
submeter3 <- as.numeric(submeters[,3])

time <- data$Time[date=="2007-02-01" | date == "2007-02-02"]
day <- date[date=="2007-02-01" | date == "2007-02-02"]
tickloc = numeric()
for(i in 1:length(time)){
  if(time[i]=="00:00:00")
    tickloc = c(tickloc, i)
}
tickloc = c(tickloc, length(time))

matplot( cbind(submeter1, submeter2, submeter3), type="l",lty=1,
     ylab = "Energy sub metering", xlab = "", xaxt="n", col=c("black","red","blue"))
legend("topright", lty=1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))

ticks =tickloc
axis(side = 1, at = ticks, labels = c("Thu","Fri","Sat" ))
axis(side = 2);
