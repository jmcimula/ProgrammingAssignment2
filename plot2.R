#plot2.R
rpVal <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")
varToApply <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
names(rpVal) <- varToApply
rpVal$DateTime <- strptime(paste(rpVal$Date, rpVal$Time), format="%d/%m/%Y %H:%M:%S")
for( i in 3:9 ){
    rpVal[[i]] <- sapply(rpVal[[i]], as.character)
    rpVal[[i]] <- sapply(rpVal[[i]], as.numeric)
}
with(rpVal, plot(DateTime, Global_active_power, type = "n", xlab = "daytime", ylab = "Global Active Power (kilowatts)" , axes = F, frame.plot=TRUE))
axis(1, at=c(as.numeric(min(rpVal$DateTime)), as.numeric(min(rpVal$DateTime))+86400, as.numeric(min(rpVal$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
axis(2, yaxs = "r")
with(rpVal, points(DateTime, Global_active_power, type = "l"))


#File production plot2.png
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()