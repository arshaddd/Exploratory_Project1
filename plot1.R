# Reading Data..

power <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", skip=1, sep=';')
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
Subpower <- subset(power, power$Date=="1/2/2007" | power$Date == "2/2/2007")

#base plot function
hist(as.numeric(as.character(Subpower$Global_active_power)), col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

title(main="Global Active Power")

png("plot4.png", width = 480, height = 480)
dev.off()   #closing png file

