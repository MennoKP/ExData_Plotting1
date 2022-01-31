or_tbl <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     na.strings = "?")
or_tbl$Date <- as.Date(or_tbl$Date, format = "%d/%m/%Y")
sub_tbl <- subset(or_tbl,Date>="2007-02-01" & Date <= "2007-02-02")

#Graph1 
png(filename = "Plot1.png")
hist(sub_tbl$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()

