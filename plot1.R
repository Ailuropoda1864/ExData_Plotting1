library(lubridate)
library(dplyr)

# reading in and subsetting data needed
repo <- '~/code/r_coursera/course_repos/ExData_Plotting1/'
data.file <- 'data/household_power_consumption.txt'
data <- read.csv(paste0(repo, data.file), 
                 sep=';',
                 na.strings = '?')

data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

data <- filter(data, Date == ymd('2007-02-01') | Date == ymd('2007-02-02'))


# plotting
fig.name <- 'plot1.png'
png(paste0(repo, fig.name))
par(bg=NA)
hist(data$Global_active_power, 
     col='red',
     main='Global Active Power', 
     xlab='Global Active Power (kilowatts)',
     ylab='Frequency')
dev.off()
