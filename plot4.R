# make code needed for plot 4

## r code required for plot 3

# first download and extract data
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="data.zip")
#unzip("data.zip")


# get data only for 1/2/2007 and 2/2/2007 by skipping rows from start 
dat <- read.table("household_power_consumption.txt", sep=';',na.strings = "?",header = FALSE,skip = 66637, nrows=2880)


#Get time by combining data from first two columns

day <- dat[,1]
time <- dat[,2]
combined <- paste(day,time)

# Convert to time 
dt <-strptime(combined, format = "%d/%m/%Y %H:%M:%S")

#get Global Active Power (column 3)
ap<- dat[,3]

# get gloobal reactive power (column 4)
rp <- dat[,4]

# get voltage (column 5)
voltage <- dat[,5]

#get sub metering values and make table (columns 7, 8, 9)

subm1 <- dat[,7]
subm2 <- dat[,8]
subm3 <- dat[,9]


# make a table
tab <- data.frame(dt, ap, rp, voltage, subm1, subm2, subm3)

#make png
png("plot4.png")
par(mfcol=c(2,2))

with(tab,{
  # global active power
  par(pch=".")
  plot(dt,ap,ylab="Global Active Power (kiloWatts)",xlab="")
    lines(dt,ap)
  
    
     #submetering 
  par(pch="|")
  plot(dt,subm1,xlab="",ylab="Energy sub metering")
  lines(dt,subm1)
  points(dt,subm2,col="red")
  lines(dt,subm2,col="red")
  points(dt,subm3,col="blue")
  lines(dt,subm3,col="blue")
  legend("topright", lty=1, col=c("black", "blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #voltage
  
  par(pch=".")
   plot(dt,voltage,xlab = "datetime", ylab = "Voltage") 
  lines(dt,voltage)
  
  #reactive power
  
  plot(dt, rp, xlab="datetime", ylab= "Global_reactive_power")
  lines(dt,rp)
  
  }
     
     )


dev.off()