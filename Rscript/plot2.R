# To load the function to read the data contained in the file
source('Rscript/Load_Data.R')
# Read the data, create a plot and save the plot to the figure directory
data<-getLines()
png('figure/plot2.png',480,480,'px')
  with(data,plot(Date_Time,Global_active_power,type = 'l',ylab='Global Active Power (kilowatt)',xlab=''))
dev.off()