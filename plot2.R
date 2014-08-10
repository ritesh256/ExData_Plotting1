plot2 <- function() {
  dataread <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings=c("?"),colClasses="character")
  dataread$Date <- as.Date(dataread$Date, "%d/%m/%Y")
  finaldata <- dataread[which(dataread$Date >= "2007-02-01" & dataread$Date <= "2007-02-02"),]
  finaldata$Date <- strptime(paste(finaldata$Date,finaldata$Time), format = "%Y-%m-%d %H:%M:%S")
  plot(finaldata$Date, as.numeric(finaldata$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab="")
  dev.copy(png, file = "plot2.png")
  dev.off()
}