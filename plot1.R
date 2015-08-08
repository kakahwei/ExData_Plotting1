##Modify the working directory here 
setwd("D:/#Coursera Material/R_workingDir/M4/courseProjectOne")

library(sqldf)

powerFile <- file("./household_power_consumption.txt")
attr(powerFile, "file.format") <- list(sep = ";", header = TRUE) 
powerList2 <- sqldf("select * from powerFile where Date = '1/2/2007' or Date = '3/2/2007' ") 

png(filename = "plot1.png", width=480, heigh =480, units="px" , bg="white")
powerHist <- hist(powerList2$Global_active_power,
     xlab= "Global Active Power(kilowatts)",
     main="Global Active Power", freq= TRUE, col="Red")
dev.off()