rm(list=ls())
setwd('~/Desktop/R/Coursera/04_Exploratory Data Analysis')

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

df$Date = as.Date(df$Date, "%d/%m/%Y")

df2 <- df[df$Date=="2007-02-01" | df$Date=="2007-02-02",]

df2 <- transform(df2, DateTime=as.POSIXct(paste(df2$Date, df2$Time)), "%d/%m/%Y %H:%M:%S")

df2$Sub_metering_1 <- as.character(df2$Sub_metering_1)
df2$Sub_metering_1 <- as.numeric(df2$Sub_metering_1)

df2$Sub_metering_2 <- as.character(df2$Sub_metering_2)
df2$Sub_metering_2 <- as.numeric(df2$Sub_metering_2)

df2$Sub_metering_3 <- as.character(df2$Sub_metering_3)
df2$Sub_metering_3 <- as.numeric(df2$Sub_metering_3)

plot(df2$DateTime, df2$Sub_metering_1, type = 'l', ylab = "Energy sub metering", xlab = "")
lines(df2$DateTime, df2$Sub_metering_2, col = "red")
lines(df2$DateTime, df2$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1), lwd = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
