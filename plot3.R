plot3 <- function (){
    #read in, parse, and subset the data
    powerCon <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
    powerCon <- subset(powerCon, (Date == "1/2/2007" | Date == "2/2/2007"))
    powerCon$DateTime <- strptime( paste(powerCon$Date, powerCon$Time ), format="%d/%m/%Y %H:%M:%S")
    
    #plot the graph to a png (plotting to screen first gives bad sizing or is not platform independent)
    png(filename = "plot3.png", width = 480, height = 480, units = "px")
    plot(powerCon$DateTime, powerCon$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering" )
    lines(powerCon$DateTime, powerCon$Sub_metering_1, type="l", col="black")
    lines(powerCon$DateTime, powerCon$Sub_metering_2, type="l", col="red")
    lines(powerCon$DateTime, powerCon$Sub_metering_3, type="l", col="blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))
    
    dev.off()
    
}