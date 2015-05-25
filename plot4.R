library(dplyr)
library(lubridate)
library(ggplot2)
# read date
df_1 <- read.csv("household_power_consumption.txt",sep=";", na.strings="?")
e_consum <- tbl_df(df_1)
# transform date and time variable
e_consum <- mutate(e_consum, Date.time = dmy(Date) + hms(Time))
time_start <- ymd_hms("2007-02-01-00:00:00")
time_end <- ymd_hms("2007-02-03-00:00:00")
# filter data to focus 20070201 and 20070202
e_consum_200702_0102 <- filter(e_consum, Date.time > time_start, Date.time < time_end)
# plot4
par(mfrow=c(2,2), mar=c(4,4,1,1))
#png(filename="plot4.png", width=480, height=480)
# topleft
plot(e_consum_200702_0102$Date.time, e_consum_200702_0102$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# topright
plot(e_consum_200702_0102$Date.time, e_consum_200702_0102$Voltage, type="l", xlab="datetime", ylab="Voltage")
# bottomleft
with(e_consum_200702_0102, plot(Date.time, Sub_metering_1, type="n", xlab="",ylab="Energy sub metering"))
points(e_consum_200702_0102$Date.time, e_consum_200702_0102$Sub_metering_1, type="l")
points(e_consum_200702_0102$Date.time, e_consum_200702_0102$Sub_metering_2, type="l", col="red")
points(e_consum_200702_0102$Date.time, e_consum_200702_0102$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)
# bottomright
plot(e_consum_200702_0102$Date.time, e_consum_200702_0102$Global_active_power, type="l", xlab="datetime", ylab="Global_active_power")
dev.off()



