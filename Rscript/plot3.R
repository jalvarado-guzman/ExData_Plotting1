# To load the function to read the data contained in the file
source('Rscript/Load_Data.R')
# Read the data, create a plot and save the plot to the figure directory
data<-getLines()
png('figure/plot3.png',480,480,'px')
  plot(data$Date_Time,data$Sub_metering_1,type = 'n',ylab='Energy sub metering',xlab='')
  lines(data$Date_Time,data$Sub_metering_1)
  lines(data$Date_Time,data$Sub_metering_2,col='red')
  lines(data$Date_Time,data$Sub_metering_3,col='blue')
  legend('topright',legend = c('Sub metering 1','Sub metering 2','Sub metering 3'),col=c('black','red','blue'),lty=1)
dev.off()