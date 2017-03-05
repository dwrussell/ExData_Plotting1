plot1 <- function(){
  ## Set delimiter and import data from file
  powerdata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
  
  ## We will only be using data from the dates 2007-02-01 and 2007-02-02
  powerset <- powerdata[(powerdata$Date=="1/2/2007") | (powerdata$Date=="2/2/2007"),]

  ## name and size the png
  png("plot1.png", width=480, height=480)
  
  ## Produce the plot
  hist(as.numeric(powerset$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
  
  dev.off()
  }
