# This function will perfome the following actions
  # Download the zip file provided for the project and save it on the current working directory
  # Unzip the file to the current working directory and delete the zip file downloaded previously
  # Create an extra file in the current working directory containing only the records for the 02/01/2007 and 02/02/2007
  # Read the file created on the previous step into a data frame and add an additional field named Date_Time formatting 
    # the Date and Time columns into a POSIXLT Object
  # Finally return the dataset created on the previous step

getLines<-function(){
  # Load the stringr package
  require(stringr)
  # Download the zip file
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
                paste(getwd(),'household_power_consumption.zip',sep = '/'),quiet = T)
  # Unzip the file downloaded
  unzip('household_power_consumption.zip')
  file<-'household_power_consumption.txt'
  # Remove the zip file from the current working directory
  file.remove('household_power_consumption.zip')
  # Open a connection to the text file for reading
  con <- file(file, 'r')
  # Out file where the records from 02/01/2007 and 02/02/2007 are going to be writen
  outfile <- file(paste('subset',file,sep='_'), 'w')
  # Read the first line in the file for naming the fields or columns in the data frame unig the stringr package
  names<-str_split(readLines(file,1),';')[[1]]
  # Read the text file in chuncks of 1000 lines and write the lines to the outfile if Date of the line is either 2/1/2007 or 2/2/2007
  while (length(lines <- readLines(con, n=1000)) > 0){
    for (i in 1:length(lines)){
      if(grepl('^(1/2/2007|2/2/2007)',lines[i])){
        write(lines[i],outfile,append = TRUE)
      }
    }
  }
  # Close the connections to the files
  close(con)
  close(outfile)
  # Read in to data frame the out file containing the records of the desire dates
  data<-read.table('subset_household_power_consumption.txt',sep =';',header=FALSE,stringsAsFactors = FALSE,na.strings = '?',
                   colClasses = c(rep('character',2),rep('numeric',7)))
  # Assign the names of the fields to the data frame
  names(data)<-names
  # Format the date and time columns into a new column in the data frame
  data$Date_Time<-strptime(paste(data$Date,data$Time),'%d/%m/%Y %H:%M:%S')
  # Return the data frame
  return(data)
}