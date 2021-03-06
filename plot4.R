##Download Dataset: Electric power consumption [20Mb] , put it in particular folder.
##Modify the working directory to the folder with dataset "Electric power consumption"
setwd("D:/#Coursera Material/R_workingDir/M4/courseProjectOne")

library(sqldf) ## load library

powerFile <- file("./household_power_consumption.txt")
attr(powerFile, "file.format") <- list(sep = ";", header = TRUE) 
powerList <- sqldf("select * from powerFile where Date = '1/2/2007' or Date = '2/2/2007' ") 

png(filename = "plot4.png", width=480, heigh =480, units="px" , bg="white")
par(mfrow = c(2, 2),mar = c(5, 4, 2, 1))

## Plot number 1
plot( powerList$Global_active_power,
      type="l",
      lwd=1,
      xaxt = "n", ##control if the axis is plotted at all.
      ylab="Global Active Power",
      xlab="")
axis(side = 1, at = c(0, 1500,2500), labels = c("Thu","Fri","Sat"))

## Plot number 2
plot( powerList$Voltage,
      type="l",
      lwd=1,
      xaxt = "n", ##control if the axis is plotted at all.
      ylab="Voltage",
      xlab="datatime")
axis(side = 1, at = c(0, 1500,2500), labels = c("Thu","Fri","Sat"))

## Plot number 3
plot( powerList$Sub_metering_1,
      type="l",
      lwd=1,
      xaxt = "n", ##control if the axis is plotted at all.
      ylab="Enegrgy sub meeting",
      xlab="")

lines( powerList$Sub_metering_2,
       col = "red",
       type="l",
       lwd=1)

lines( powerList$Sub_metering_3,
       col = "blue",
       type="l",
       lwd=1)

nameList <- names(powerList)
legend(x="topright", legend=nameList[7:9],col=c("black", "red","blue"),lty = 1)
axis(side = 1, at = c(0, 1500,2500), labels = c("Thu","Fri","Sat"))

## Plot number 4
plot( powerList$Global_reactive_power,
      type="l",
      lwd=1,
      xaxt = "n", ##control if the axis is plotted at all.
      ylab="Global_reactive_power",
      xlab="datatime")
axis(side = 1, at = c(0, 1500,2500), labels = c("Thu","Fri","Sat"))

dev.off()