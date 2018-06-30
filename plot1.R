setwd("C:/Users/carla/OneDrive/Coursera/exploratorydataanalysis/Week4/project2")
unzip("data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
pm25 <- readRDS("summarySCC_PM25.rds")
tapply(pm25$Emissions,pm25$year,sum)
names(tapply(pm25$Emissions,pm25$year,sum))
xnames<-names(tapply(pm25$Emissions,pm25$year,sum))

plot(log(tapply(pm25$Emissions,pm25$year,sum)), xaxt="n", type="b", col=4, pch=19, 
        ylab="LogPM2.5 (tons)", xlab="Year", main = "Total Emissions PM2.5 from 1999 to 2008")
        axis(1, at=1:length(xnames), labels=xnames)
        
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()