##Download Dataset: Electric power consumption [20Mb] , put it in particular folder.
##Modify the working directory to the folder with dataset  
setwd("D:/#Coursera Material/R_workingDir/M4/courseProjectOne")

library(sqldf) ## load library

powerFile <- file("./household_power_consumption.txt")
attr(powerFile, "file.format") <- list(sep = ";", header = TRUE) 
powerList2 <- sqldf("select * from powerFile where Date = '1/2/2007' or Date = '3/2/2007' ") 

png(filename = "plot1.png", width=480, heigh =480, units="px" , bg="white")
powerHist <- hist(powerList2$Global_active_power,
     xlab= "Global Active Power(kilowatts)", 
     main="Global Active Power",  
     col="Red",
     freq= TRUE)
dev.off()