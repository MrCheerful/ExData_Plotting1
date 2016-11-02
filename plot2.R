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



## Plot 2
png(file = "plot2.png")

with(dat_t, plot( DateTime, Global_active_power, 
                 xlab = "",
                 ylab = "Global Active Power (kilowatts)",
                 type="l",
                 lty=1, lwd=1, pch=".") )

dev.off()


