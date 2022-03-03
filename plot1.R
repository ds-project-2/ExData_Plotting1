#load dplyr
install.packages("dplyr")
library('dplyr')

#load tst data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=';')
filtered_data <-
    (
        data %>%
            filter(Date == "1/2/2007"|Date == "2/2/2007") %>%
            mutate(DateNew = as.Date(Date,"%d/%m/%Y"),
            DateTimeNew = as.POSIXct(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"))
    )

#create plot1
png("plot1.png",width = 480,height=480)
hist(as.numeric(filtered_data$Global_active_power),
     xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency',
     main = 'Global Active Power',
     col = 'Red')
dev.off()