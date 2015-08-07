plot1 <- function (){
    #read in, parse, and subset the data
    powerCon <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
    powerCon <- subset(powerCon, (Date == "1/2/2007" | Date == "2/2/2007"))
    powerCon$DateTime <- strptime( paste(powerCon$Date, powerCon$Time ), format="%d/%m/%Y %H:%M:%S")
    
    #plot the histogram and output to a png
    hist(powerCon$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
    dev.copy(png, filename = "plot1.png", width = 480, height = 480, units = "px")
    dev.off()
    
}