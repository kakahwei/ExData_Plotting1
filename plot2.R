##Download Dataset: Electric power consumption [20Mb] , put it in particular folder.
##Modify the working directory to the folder with dataset "Electric power consumption"
setwd("D:/#Coursera Material/R_workingDir/M4/courseProjectOne")

library(sqldf) ## load library

powerFile <- file("./household_power_consumption.txt")
attr(powerFile, "file.format") <- list(sep = ";", header = TRUE) 
powerList <- sqldf("select * from powerFile where Date = '1/2/2007' or Date = '2/2/2007' ") 

##library(lubridate)
##powerList$Date <- wday(powerList$Date, label= TRUE)

png(filename = "plot2.png", width=480, heigh =480, units="px" , bg="white")
plot( powerList$Global_active_power,
     type="l",
     lwd=1,
     xaxt = "n", ##control if the axis is plotted at all.
     ylab="Global Active Power(kilowatts)",
     xlab="")
axis(side = 1, at = c(0, 1500,2500), labels = c("Thu","Fri","Sat"))

dev.off()