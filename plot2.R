plot2 <- function(){
  ## Set delimiter and import data from file
  powerdata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
  
  ## We will only be using data from the dates 2007-02-01 and 2007-02-02
  powerset <- powerdata[(powerdata$Date=="1/2/2007") | (powerdata$Date=="2/2/2007"),]
  
  ## Format the date and time data
  datetime <- strptime(paste(powerset$Date, powerset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

  ## name and size the png
  png("plot2.png", width=480, height=480)
  
  
  ## Produce the plot
  plot(datetime, as.numeric(powerset$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.off()
  }
