#' https://class.coursera.org/exdata-030/human_grading/view/courses/975125/assessments/3/submissions
#'
#' Dateset: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#' Description: Measurements of electric power consumption in one household with a one-minute
#' sampling rate over a period of almost 4 years. Different electrical quantities and some
#' sub-metering values are available.
#'
#' The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
#'
#' 1.  Date: Date in format dd/mm/yyyy
#' 2.  Time: time in format hh:mm:ss
#' 3.  Global_active_power: household global minute-averaged active power (in kilowatt)
#' 4.  Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#' 5.  Voltage: minute-averaged voltage (in volt)
#' 6.  Global_intensity: household global minute-averaged current intensity (in ampere)
#' 7.  Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy).
#'     It corresponds to the kitchen, containing mainly a dishwasher, an oven and
#'     a microwave (hot plates are not electric but gas powered).
#' 8.  Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy).
#'     It corresponds to the laundry room, containing a washing-machine, a
#'     tumble-drier, a refrigerator and a light.
#' 9.  Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy).
#'     It corresponds to an electric water-heater and an air-conditioner.

#' Making plots: Examing household energy use on 2007-02-01 and 2007-02-02
#'
#' This script generates the plot1.png as described in:
#'   https://github.com/ww9rivers/ExData_Plotting1

library(data.table)
poweruse <- subset(fread("household_power_consumption.txt", na.strings=c("?"),
                         colClasses=c("date", "time", "numeric", "numeric", "numeric",
                             "numeric", "numeric", "numeric", "numeric")),
                   Date=="1/2/2007" | Date=="2/2/2007")

png("plot2.png", height=480, width=480)
with(poweruse, {
         x = strptime(paste(Date, Time), "%d/%m/%Y %T")
         plot(x, Global_active_power, type="n", main="",
              xlab="", ylab="Global Active Power (kilowatts)")
         lines(x, Global_active_power)
})
dev.off()
