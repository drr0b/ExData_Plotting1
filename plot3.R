## r code required for plot 3

# first download and extract data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="data.zip")
unzip("data.zip")


# get data only for 1/2/2007 and 2/2/2007 by skipping rows from start 
dat <- read.table("household_power_consumption.txt", sep=';',na.strings = "?",header = FALSE,skip = 66637, nrows=2880)


#Get time by combining data from first two columns

day <- dat[,1]
time <- dat[,2]
combined <- paste(day,time)

# Convert to time 
dt <-strptime(combined, format = "%d/%m/%Y %H:%M:%S")

#get sub metering values and make table

subm1 <- dat[,7]
subm2 <- dat[,8]
subm3 <- dat[,9]
sub_tab <- data.frame(dt,subm1,subm2,subm3)

#make png
png("plot3.png")
par(pch="|")
with(test3,plot(dt,subm1,xlab="",ylab=""))
lines(dt,subm1)
points(dt,subm2,col="red")
lines(dt,subm2,col="red")
points(dt,subm3,col="blue")
lines(dt,subm3,col="blue")
legend("topright", lty=1, col=c("black", "blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()