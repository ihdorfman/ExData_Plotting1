#Exploratory Data Analysis - Isaac Dorfman
#Peer Graded Assignment - Plot 1

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

#Plotting and saving the graphic
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(p$Global_active_power), col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()