rm(list=ls())
setwd('~/Desktop/R/Coursera/04_Exploratory Data Analysis')

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

df$Date = as.Date(df$Date, "%d/%m/%Y")

df2 <- df[df$Date=="2007-02-01" | df$Date=="2007-02-02",]

df2$Global_active_power <- as.character(df2$Global_active_power)
df2$Global_active_power <- as.numeric(df2$Global_active_power)

plot(df2$Global_active_power, type = 'l', axes = F, ylab = "Global Active Power (kilowatts)", xlab = "")
box()
axis(side = 1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
axis(side = 2, at=c(0, 2, 4, 6), labels = c("0", "2", "4", "6"))

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()