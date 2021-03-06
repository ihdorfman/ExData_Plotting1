#Exploratory Data Analysis - Isaac Dorfman
#Peer Graded Assignment - Plot 3

#Importing the data set, converting the 'Date' variable and subsetting
p <- read.csv("household_power_consumption.txt", sep = ";",header = TRUE)
p$Date <- strptime(p$Date, "%d/%m/%Y")
p <- subset(p, Date == "2007-02-01" | Date == "2007-02-02")

#Recoding nonstandard NA values as NA
p$Global_active_power[p$Global_active_power=="?"] <- NA
p$Global_reactive_power[p$Global_reactive_power=="?"] <- NA
p$Voltage[p$Voltage=="?"] <- NA
p$Global_intensity[p$Global_intensity=="?"] <- NA
p$Sub_metering_1[p$Sub_metering_1=="?"] <- NA
p$Sub_metering_2[p$Sub_metering_2=="?"] <- NA
p$Sub_metering_3[p$Sub_metering_3=="?"] <- NA

#Combing 'Date' and 'Time' variables into a new 'datetime' variable
p$datetime <- strptime(paste(p$Date,p$Time), "%Y-%m-%d %H:%M:%S")

#Transforming Sub_metering_(num) variable into a numeric w/out loss of information
p$Sub_metering_1<-as.numeric(paste(p$Sub_metering_1))
p$Sub_metering_2<-as.numeric(paste(p$Sub_metering_2))
p$Sub_metering_3<-as.numeric(paste(p$Sub_metering_3))

#Plotting and saving the graphic
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(p$datetime,p$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")
lines(p$datetime, p$Sub_metering_1, type = "l")
lines(p$datetime, p$Sub_metering_2, type = "l", col= "red")
lines(p$datetime, p$Sub_metering_3, type = "l", col= "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)
dev.off()