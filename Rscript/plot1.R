# To load the function to read the data contained in the file
source('Rscript/Load_Data.R')
# Read the data, create a plot and save the plot to the figure directory
data<-getLines()
png('figure/plot1.png',480,480,'px')
  hist(data$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatt)',ylab='Frequency')
dev.off()