library(ggplot2)
setwd("C:/Users/carla/OneDrive/Coursera/exploratorydataanalysis/Week4/project2")
unzip("data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
pm25 <- readRDS("summarySCC_PM25.rds")

BaltimoreData<- subset(pm25, fips=="24510")
BaltimoreAggregate_year<- aggregate(BaltimoreData$Emissions, by=list(BaltimoreData$type, BaltimoreData$year), FUN=sum)
colnames(BaltimoreAggregate_year) <- c("type", "year", "emissions")
        
qplot(year, emissions, data = BaltimoreAggregate_year, facets = .~type) +
        ggtitle("Total Emissions PM2.5 in Baltimore by Type of Source, 1999-2008") + 
        ylab("Total Emissions of PM2.5 (tons)") + 
        xlab("Year")

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()