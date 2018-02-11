library(lubridate)
library(dplyr)

# reading in and subsetting data needed
repo <- '~/code/r_coursera/course_repos/ExData_Plotting1/'
data.file <- 'data/household_power_consumption.txt'
data <- read.csv(paste0(repo, data.file), 
                 sep=';',
                 na.strings = '?')

data$dt<- dmy_hms(paste(data$Date, data$Time))

data <- filter(data, dt >= ymd('2007-02-01') & dt < ymd('2007-02-03'))


# plotting
fig.name <- 'plot4.png'
png(paste0(repo, fig.name))
par(mfrow=c(2,2), bg=NA)

# subplot top left
with(data, {
    plot(dt, Global_active_power, 
         xlab='',
         ylab='Global Active Power', 
         type='n');
    lines(dt, Global_active_power)
    }
)

# subplot top right
with(data, {
    plot(dt, Voltage, 
         xlab='datetime',
         type='n');
    lines(dt, Voltage)
    }
)

# subplot bottom left
plot(data$dt, data$Sub_metering_1, 
     type='n', 
     xlab='', 
     ylab='Energy sub metering')
lines(data$dt, data$Sub_metering_1)
lines(data$dt, data$Sub_metering_2, col='red')
lines(data$dt, data$Sub_metering_3, col='blue')
legend('topright', 
       legend=paste0('Sub_metering_', 1:3), 
       col=c("black","red","blue"), 
       lty=c(1,1,1), 
       bty='n')

# subplot bottom right
with(data, {
    plot(dt, Global_reactive_power, 
         xlab='datetime',
         type='n');
    lines(dt, Global_reactive_power)
    }
)

dev.off()
