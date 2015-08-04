# This is the R code required to reproduce plot1.png

# First get the data and unzip it
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="data.zip")
unzip("data.zip")

# ONly want data from 2007 Feb1 and 2007 Feb 2. The table records values for every minute, starting from 2006 December 16 
# at 17:24. 

# Hence skip fisrt N rows (N = 60*24*47 - 1044, because data starts 47 days before, but 1044 minutes in)
# also, only need 2x24*60 = 2880 rows

tab <-read.table("household_power_consumption.txt", sep=';',na.strings = "?",header = FALSE,skip = 66636, nrows=2880)

# No header, so use V3 to get 3rd column

# make test pn gplot
png(file="plot1.png")
with(tab,hist(V3,col="red",xlab="Global Active Power (kiloWatts)",main="Global Acticve Power"))
dev.off()


