#read file and put results in original table
or_tbl <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     na.strings = "?")
#combine date and time field into one string
or_tbl$datetime <- paste(or_tbl$Date, or_tbl$Time, sep = " ")

#make a subset on the relevant dates to report on
or_tbl$Date <- as.Date(or_tbl$datetime, format = "%d/%m/%Y")
sub_tbl <- subset(or_tbl,Date>="2007-02-01" & Date <= "2007-02-02")

#on subset, convert datetime to a POSIXlt field
sub_tbl$datetime <- strptime(sub_tbl$datetime, format = "%d/%m/%Y %H:%M:%S")

#Graph
png(filename = "Plot4.png")

#set order for graps, row 1 first then row 2
par(mfrow = c(2,2))

#plot topleft, is former plot 2
plot(sub_tbl$datetime,sub_tbl$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

#plot topright, new plot
with(sub_tbl, plot(datetime,Voltage, type = "l"))

#plot bottomleft, is former plot3
with(sub_tbl, plot(datetime, Sub_metering_1, type = "l", 
                   xlab ="", ylab = "Energy sub metering"))
with(sub_tbl, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(sub_tbl, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
#added parms for cex and bty to formt legend box in smaller plot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty = 1, cex = 0.7, bty = "n")

#plot bottomright, is new plot
with(sub_tbl,plot(datetime, Global_reactive_power, type = "l"))

dev.off()

