plot3 <- function() {
  dataread <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings=c("?"),colClasses="character")
  dataread$Date <- as.Date(dataread$Date, "%d/%m/%Y")
  finaldata <- dataread[which(dataread$Date >= "2007-02-01" & dataread$Date <= "2007-02-02"),]
  finaldata$Date <- strptime(paste(finaldata$Date,finaldata$Time), format = "%Y-%m-%d %H:%M:%S")
  with(finaldata,plot(finaldata$Date, as.numeric(finaldata$Sub_metering_1), type="n", xlab="", ylab="Energy sub metering"))
  with(finaldata, lines(finaldata$Date, as.numeric(finaldata$Sub_metering_1), col = "grey"))
  with(finaldata, lines(finaldata$Date, as.numeric(finaldata$Sub_metering_3), col = "blue"))
  with(finaldata, lines(finaldata$Date, as.numeric(finaldata$Sub_metering_2), col = "red"))
  legend("topright", lty="solid", , cex=0.64, col = c("Grey", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   dev.copy(png, file = "plot3.png")
  dev.off()
}
