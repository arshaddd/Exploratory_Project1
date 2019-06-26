plot4....................

#  Reading Data
power <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", skip=1, sep=';')
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
Subpower <- subset(power, power$Date=="1/2/2007" | power$Date == "2/2/2007")

# Transforming the Date and Time vars from char into objects 
Subpower$Date <- as.Date(Subpower$Date, format="%d/%m/%Y")
Subpower$Time <- strptime(Subpower$Time, format="%H:%M:%S")
Subpower[1:1440,"Time"] <- format(Subpower[1:1440,"Time"], "2007-02-01 %H:%M:%S")
Subpower[1441:2880,"Time"] <- format(Subpower[1441:2880,"Time"], "2007-02-02 %H:%M:%S")

#initiating a composite plot...
par(mfrow=c(2,2))

#calling the basic plot function...... 
with(Subpower, {
    plot(Subpower$Time, as.numeric(as.character(Subpower$Global_active_power)), type="l", xlab="", ylab="Global Active Power(kilowatts")

plot(Subpower$Time,as.numeric(as.character(Subpower$Voltage)), type="l", xlab="datetime",ylab="Voltage")
plot(Subpower$Time,Subpower$Sub_metering_1,type="n", xlab="",ylab="Energy Sub Metering")

with(Subpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(Subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="Red"))
with(Subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="Blue"))

legend("topright", lty=1, col=c("Black", "Red", "Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
plot(Subpower$Time, as.numeric(as.character(Subpower$Global_active_power)), type="l", xlab="datetime", ylab="Global Active Power")


})