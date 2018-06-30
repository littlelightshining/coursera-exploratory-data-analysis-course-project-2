library(ggplot2)
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
LosAngeles_motor<- subset(NEI_motor, fips=="06037")

Balt_LosAng_motor <- merge(Baltimore_motor,LosAngeles_motor, all.x = TRUE, all.y = TRUE)

Balt_LosAng_motor_Aggr <- aggregate(Balt_LosAng_motor$Emissions, by=list(Balt_LosAng_motor$fips, Balt_LosAng_motor$year), FUN=sum)
colnames(Balt_LosAng_motor_Aggr) <- c("City", "year", "emissions")


qplot(year, emissions, data = Balt_LosAng_motor_Aggr, color = City, geom = c("point", "line")) +
        ggtitle("Total Emissions PM2.5 - Baltimore(24510) and LA(06037), 1999-2008") + 
        ylab("Total Emissions (tons)") + 
        xlab("Year")

dev.copy(png, file="plot6.png", height=480, width=480)
dev.off()