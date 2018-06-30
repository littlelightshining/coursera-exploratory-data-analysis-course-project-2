library(dplyr)
setwd("C:/Users/carla/OneDrive/Coursera/exploratorydataanalysis/Week4/project2")
unzip("data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_coal <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
SCC_coal <- SCC[SCC_coal, ]
SCC_codes <- as.character(SCC_coal$SCC)

NEI$SCC <- as.character(NEI$SCC)
NEI_coal <- NEI[NEI$SCC %in% SCC_codes, ]

Coal_year<- tapply(NEI_coal$Emissions,NEI_coal$year, sum)
xnames<-names(tapply(pm25$Emissions,pm25$year,sum))

plot(tapply(NEI_coal$Emissions,NEI_coal$year, sum), xaxt="n", type="b", col=4, pch=19, 
     ylab="PM2.5 (tons)", xlab="Year", main = "Total Coal Emissions PM2.5 in USA, 1999-2008")
     axis(1, at=1:length(xnames), labels=xnames)

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()