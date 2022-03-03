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

#create plot 4
par(mar=c(4,4,1,1),mfrow = c(2,2))
with(filtered_data,{
    plot(Global_active_power ~ DateTimeNew,type = 'l',ylab = 'Global Active Power',xlab = '')
    plot(Voltage ~ DateTimeNew,type = 'l',ylab = 'Voltage',xlab = 'datetime')
    plot(Sub_metering_1 ~ DateTimeNew,type = 'l',ylab = 'Energy sub metering',xlab = '')
    lines(Sub_metering_2 ~ DateTimeNew,col='Red')
    lines(Sub_metering_3 ~ DateTimeNew,col='Blue')
    legend("topright",col=c("black","red","blue"),lwd = 2,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(Global_reactive_power ~ DateTimeNew,type = 'l',ylab = 'global_reactive_power',xlab = '')
})
dev.copy(png,file = "plot4.png",height=480,width=480)
dev.off()