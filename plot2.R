setwd("C:/Users/carla/OneDrive/Coursera/exploratorydataanalysis/Week4/project2")
unzip("data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
pm25 <- readRDS("summarySCC_PM25.rds")

MarylandData<- subset(pm25, fips=="24510")
tapply(MarylandData$Emissions,MarylandData$year,sum)
names(tapply(MarylandData$Emissions,MarylandData$year,sum))
xnames<-names(tapply(MarylandData$Emissions,MarylandData$year,sum))

plot(tapply(MarylandData$Emissions,MarylandData$year,sum), xaxt="n", type="b", col=4, pch=19, 
        ylab="PM2.5 (tons)", xlab="Year", main = "Total Emissions PM2.5 in Baltimore, 1999-2008")
        axis(1, at=1:length(xnames), labels=xnames)
        
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()