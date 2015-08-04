## This will get plot2 in the coursework


#first download the file and unzip it 
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

# get active power (ap), and make a new table
ap<- test3[,3]
newtab <-data.frame(dt,ap)

# Now plot figure
png("plot2.png")
par(pch=".")
with(newtab,plot(dt,garb,ylab="Global Active Power (kiloWatts)",xlab=""))

# Do lineplot with separatew command
lines(dt,garb)
dev.off()
