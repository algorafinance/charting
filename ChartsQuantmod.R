# ChartsQuantmod.R, Kyle Loomis, 2017-03-05

# ==================================================================
# Charting examples on quantmod: http://www.quantmod.com/examples/charting/
# Imports quantmod library to retrieve stock data from Yahoo! Finance
library(quantmod)
require(quantmod)

# Universal date
timeframe <- '2017-02-01::2017-03-03'

# creates a list of stocks - future revisions will 
# include importing tickers from .csv file
# Read CSV into R. Check current working directory
# getwd() and setwd() can be used to change directory
stocksCSV <- read.csv(file="Tickers/Aerospace1.csv", header=TRUE, sep=",")

# symbolList <- c('NVDA','AMD','MU','INTC','WDC','AMAT','MRVL')
# symboList includes ticker strings from 1st col from .csv file
# converts stockCSV[,1] to strings
symbolList <- c(as.character(stocksCSV[,1]))

#Initialize a list to store the fetched prices
dataList <- list()
#Loop through symbols, fetch prices, and store in dataList
dataList <-lapply(symbolList, function(x) {getSymbols(x,auto.assign=FALSE)} )
names(dataList) <- symbolList

# Fetches and stores data from Yahoo! Finance
# Pauses data retrieval to avoid Yahoo Finance shutting system down
getSymbols('NVDA')
# Sys.sleep(10)

# Iterates through symbolList and creates, names, and organizes charts
for (i in symbolList) {
  pdf(file = paste0("/Users/kloomis/Desktop/Code/charting/RCharts/",i," - ",timeframe,".pdf"))
  candleChart(dataList[[i]], type = 'candles', name = paste0('Algora Finance - ',i), TA = 'addVo();addWMA();addBBands();addRSI();addMACD();addEMA();', theme = chartTheme('white'), up.col = 'green', dn.col = 'red', subset = timeframe, major.ticks = '1 hour', show.grid = TRUE)
  dev.off()
}

#candleChart(NVDA, type = 'candles', name = 'Algora Finance - NVDA', TA = 'addVo();addWMA();addBBands();addRSI();addMACD();addEMA();', theme = chartTheme('white'), up.col = 'green', dn.col = 'red', subset = timeframe, major.ticks = '1 hour', show.grid = TRUE)