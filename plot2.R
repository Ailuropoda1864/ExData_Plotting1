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
fig.name <- 'plot2.png'
png(paste0(repo, fig.name))
par(bg=NA)
with(data, {
    plot(dt, Global_active_power, 
         xlab='',
         ylab='Global Active Power (kilowatts)', 
         type='n');
    lines(dt, Global_active_power)
    }
)
dev.off()
