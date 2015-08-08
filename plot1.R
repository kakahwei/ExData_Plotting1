##Download Dataset: Electric power consumption [20Mb] , put it in particular folder.
##Modify the working directory to the folder with dataset "Electric power consumption"
setwd("D:/#Coursera Material/R_workingDir/M4/courseProjectOne")

library(sqldf) ## load library

powerFile <- file("./household_power_consumption.txt")
attr(powerFile, "file.format") <- list(sep = ";", header = TRUE) 
powerList <- sqldf("select * from powerFile where Date = '1/2/2007' or Date = '2/2/2007' ") 

png(filename = "plot1.png", width=480, heigh =480, units="px" , bg="white")
hist(powerList$Global_active_power,
     xlab= "Global Active Power(kilowatts)", 
     main="Global Active Power",  
     col="Red",
     freq= TRUE)
dev.off()