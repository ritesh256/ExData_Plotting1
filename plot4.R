plot4 <- function() {
  dataread <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings=c("?"),colClasses="character")
  dataread$Date <- as.Date(dataread$Date, "%d/%m/%Y")
  finaldata <- dataread[which(dataread$Date >= "2007-02-01" & dataread$Date <= "2007-02-02"),]
  finaldata$Date <- strptime(paste(finaldata$Date,finaldata$Time), format = "%Y-%m-%d %H:%M:%S")
  
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
  
   with(finaldata, {
     plot(finaldata$Date, as.numeric(finaldata$Global_active_power), type="l", ylab="Global Active Power", xlab="")
     plot(finaldata$Date, as.numeric(finaldata$Voltage), type="l", xlab="datatime", ylab="Voltage")
     plot(finaldata$Date, as.numeric(finaldata$Sub_metering_1), type="n", xlab="", ylab="Energy sub metering")
     lines(finaldata$Date, as.numeric(finaldata$Sub_metering_1), col = "grey")
     lines(finaldata$Date, as.numeric(finaldata$Sub_metering_3), col = "blue")
     lines(finaldata$Date, as.numeric(finaldata$Sub_metering_2), col = "red")
     legend("topright", lty="solid", bty="n", cex=0.64, col = c("Grey", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     
     plot(finaldata$Date, as.numeric(finaldata$Global_reactive_power), type="l", ylab="Global_reactive_power", xlab="datetime")
     }) 
  dev.copy(png, file = "plot4.png")
  dev.off()
  
}