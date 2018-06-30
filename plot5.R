library(dplyr)
setwd("C:/Users/carla/OneDrive/Coursera/exploratorydataanalysis/Week4/project2")
unzip("data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_motor <- grep("motor", SCC$Short.Name, ignore.case = TRUE)
SCC_motor <- SCC[SCC_motor, ]
SCC_codes <- as.character(SCC_motor$SCC)

NEI$SCC <- as.character(NEI$SCC)
NEI_motor <- NEI[NEI$SCC %in% SCC_codes, ]
Baltimore_motor<- subset(NEI_motor, fips=="24510")

plot(tapply(Baltimore_motor$Emissions,Baltimore_motor$year,sum), xaxt="n", type="b", col=4, pch=19, 
     ylab="PM2.5 (tons)", xlab="Year", main = "Total Emissions of PM2.5 from Motor Vehicle Sources Between 1999 and 2008 in Baltimore City")
axis(1, at=1:length(xnames), labels=xnames)

dev.copy(png, file="plot5.png", height=480, width=480)
dev.off()

