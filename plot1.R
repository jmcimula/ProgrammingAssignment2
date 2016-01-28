#plot1.R

rpVal <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")
varToApply <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
names(rpVal) <- varToApply
rpVal$DateTime <- strptime(paste(rpVal$Date, rpVal$Time), format="%d/%m/%Y %H:%M:%S")

for( i in 3:9 ){
    rpVal[[i]] <- sapply(rpVal[[i]], as.character)
    rpVal[[i]] <- sapply(rpVal[[i]], as.numeric)
}

hist(rpVal$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red", ylim = c(0, 1200))

#File production plot1.png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()