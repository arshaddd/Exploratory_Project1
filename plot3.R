power <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", skip=1, sep=';')
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

Subpower <- subset(power, power$Date=="1/2/2007" | power$Date == "2/2/2007")


Subpower$Date <- as.Date(Subpower$Date, format="%d/%m/%Y")

Subpower$Time <- strptime(Subpower$Time, format="%H:%M:%S")
Subpower[1:1440,"Time"] <- format(Subpower[1:1440,"Time"], "2007-02-01 %H:%M:%S")
Subpower[1441:2880,"Time"] <- format(Subpower[1441:2880,"Time"], "2007-02-02 %H:%M:%S")

plot(Subpower$Time,Subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(Subpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(Subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="Red"))
with(Subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="Blue"))

legend("topright", lty=1, col=c("Black", "Red", "Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
> title(main = "Energy Sub_Metering")
