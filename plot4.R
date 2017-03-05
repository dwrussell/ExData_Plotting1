plot4 <- function(){
  ## Set delimiter and import data from file
  powerdata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
  
  ## We will only be using data from the dates 2007-02-01 and 2007-02-02
  powerset <- powerdata[(powerdata$Date=="1/2/2007") | (powerdata$Date=="2/2/2007"),]
  
  ## Format the date and time data
  cleandates <- strptime(paste(powerset$Date, powerset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  
  ## name and size the png
  png("plot4.png", width=480, height=480)

  ## Produce the plot
  par(mfrow=c(2,2))
  
  ##top left
  plot(cleandates, as.numeric(powerset$Global_active_power), type="l", xlab="", ylab="Global Active Power")
  
  ## top right
  plot(cleandates, as.numeric(powerset$Voltage), type="l", xlab="datetime", ylab="Voltage")
  
  ## bottom left
  plot(cleandates, as.numeric(powerset$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
  lines(cleandates, as.numeric(powerset$Sub_metering_2), type="l", col="red")
  lines(cleandates, as.numeric(powerset$Sub_metering_3), type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"), bty="n")
  
  ## bottom right
  plot(cleandates, as.numeric(powerset$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
  }
