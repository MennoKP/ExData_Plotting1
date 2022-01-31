#read file and put results in original table
or_tbl <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     na.strings = "?")
#combine date and time field into one string
or_tbl$DT <- paste(or_tbl$Date, or_tbl$Time, sep = " ")

#make a subset on the relevant dates to report on
or_tbl$Date <- as.Date(or_tbl$DT, format = "%d/%m/%Y")
sub_tbl <- subset(or_tbl,Date>="2007-02-01" & Date <= "2007-02-02")

#on subset, convert DT to a POSIXlt field
sub_tbl$DT <- strptime(sub_tbl$DT, format = "%d/%m/%Y %H:%M:%S")

#Graph
png(filename = "Plot3.png")
with(sub_tbl, plot(DT, Sub_metering_1, type = "l", 
                   xlab ="", ylab = "Energy sub metering"))
with(sub_tbl, lines(DT, Sub_metering_2, type = "l", col = "red"))
with(sub_tbl, lines(DT, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty = 1)
dev.off()

