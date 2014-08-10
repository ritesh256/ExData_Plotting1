plot1 <- function() {
  dataread <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings=c("?"),colClasses="character")
  dataread$Date <- as.Date(dataread$Date, "%d/%m/%Y")
  finaldata <- dataread[which(dataread$Date >= "2007-02-01" & dataread$Date <= "2007-02-02"),]
  hist(as.numeric(finaldata$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="RED")
  dev.copy(png, file = "plot1.png")
  dev.off()
}

