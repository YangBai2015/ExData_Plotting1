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
# plot1.png
png(filename="plot1.png", width=480, height=480)
hist(e_consum_200702_0102$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
# plot1.pdf
pdf("plot1.pdf")
qplot(Global_active_power, data=e_consum_200702_0102, fill="red", main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")
dev.off()





