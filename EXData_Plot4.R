hpc <- read.csv("hpc.txt",sep=";")
index <- which(hpc[,1] == "2/2/2007")

# setting plotting environment
par(mfcol = c(2,2), mar = c(5,5,1,1))

# plot1
plot(hpc[,3], xlab = "", ylab = "Global_active_power (kilowatts)", type = "l", xaxt = "n")
axis(1, at= c("0",as.character(index[1]),"2880"), labels = c("Thu","Fri","Sat"), xlab = "")

# plot2
plot(hpc[,7], xlab = "", ylab = "Energy sub metering", type = "l", xaxt = "n")
lines(hpc[,8],xlab = "", col = "red")
lines(hpc[,9],xlab = "", col = "blue")
axis(1, at = c("0",as.character(index[1]),"2880"), labels = c("Thu","Fri","Sat"), xlab = "")
leg_txt <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",leg_txt, text.col = c("black","red","blue"), lty = c(1,1,1), col = c("black","red","blue"), cex = 0.5)

# plot3
plot(hpc[,5], type = "l", xlab = "datetime", ylab = "Voltage", xaxt ="n")
axis(1, at = c("0",as.character(index[1]),"2880"), labels = c("Thu","Fri","Sat"))

# plot4
plot(hpc[,4], type = "l", xlab = "datetime", ylab = "Global_reactive_power", xaxt ="n")
axis(1, at = c("0",as.character(index[1]),"2880"), labels = c("Thu","Fri","Sat"))

# save as png
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
