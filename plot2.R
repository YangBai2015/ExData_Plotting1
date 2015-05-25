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
# plot2.png
png(filename="plot2.png", width=480, height=480)
plot(e_consum_200702_0102$Date.time, e_consum_200702_0102$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
# plot2.pdf
pdf("plot2.pdf")
qplot(Date.time, Global_active_power, data=e_consum_200702_0102, geom="line", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()


