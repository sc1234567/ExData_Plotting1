rm(list=ls())
setwd('~/Desktop/R/Coursera/04_Exploratory Data Analysis')

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

df$Date = as.Date(df$Date, "%d/%m/%Y")

df2 <- df[df$Date=="2007-02-01" | df$Date=="2007-02-02",]

df2$Global_active_power <- as.character(df2$Global_active_power)
df2$Global_active_power <- as.numeric(df2$Global_active_power)

hist(df2$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()