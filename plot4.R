
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
ticks = c(tickloc, length(time))

submeters <- data[date=="2007-02-01" | date == "2007-02-02",c(7,8,9)]
submeter1 <- as.numeric(submeters[,1])
submeter2 <- as.numeric(submeters[,2])
submeter3 <- as.numeric(submeters[,3])

Global_reactive_power <- data$Global_reactive_power[date=="2007-02-01" | date == "2007-02-02"]
Voltage <- data$Voltage[date=="2007-02-01" | date == "2007-02-02"]

par(mfrow=c(2,2))
plot(globalActivePower, col = "black", type = "l", 
     ylab = "Global Active Power ", xlab = "", xaxt="n")
axis(side = 1, at = ticks, labels = c("Thu","Fri","Sat" )) 
axis(side = 2);

plot(1:length(Voltage), Voltage, col = "black", type = "l", 
     ylab = "Voltage", xlab = "", xaxt="n")
axis(side = 1, at = ticks, labels = c("Thu","Fri","Sat" )) 
axis(side = 2);

mtext("datetime", side=1, line=3)
matplot( cbind(submeter1, submeter2, submeter3), type="l",lty=1,
         ylab = "Energy sub metering", xlab = "", xaxt="n", col=c("black","red","blue"))
legend("topright", lty=1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty = "n")
axis(side = 1, at = ticks, labels = c("Thu","Fri","Sat" )) 
axis(side = 2);


plot(1:length(Voltage), Global_reactive_power, col = "black", type = "l", 
     ylab = "Global_reactive_power", xlab = "", xaxt="n")
axis(side = 1, at = ticks, labels = c("Thu","Fri","Sat" )) 
axis(side = 2);
mtext("datetime", side=1, line=3)