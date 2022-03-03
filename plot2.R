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

#create plot2
with(filtered_data,
     plot(Global_active_power ~ DateTimeNew,type = 'l',ylab = 'Global Active Power (kilowatts)',xlab = ''))
dev.copy(png,file="plot2.png",height = 480,width=480)
dev.off()