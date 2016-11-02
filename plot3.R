## Read in file - note stored in ./data directory

dat <- read.table(file="data/household_power_consumption.txt", 
                  sep = ";", header = TRUE, na.strings = "?",
                  stringsAsFactors=FALSE)

## Conditioning of dates
dat$Date <- as.Date.character(dat$Date, "%d/%m/%Y")

## Limit on dates 2007-02-01 and 2007-02-02
dat_t <- dat[ dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02",]

## Conditioning of times
dat_t$DateTime <- strptime(paste(dat_t$Date,dat_t$Time, sep=' '),
                           format = "%Y-%m-%d %H:%M:%S")

## Plot 3
png(file = "plot3.png")

with(dat_t, plot( DateTime, Sub_metering_1, 
                  xlab = "",
                  ylab = "Energy Sub Metering",
                  type="l", 
                  lty=1, lwd=1, pch=".") )
with(dat_t, lines( DateTime, Sub_metering_2,
                   col = "red"))
with(dat_t, lines( DateTime, Sub_metering_3,
                   col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lty = 1, lwd = 2)

dev.off()


