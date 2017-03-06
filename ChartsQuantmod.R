# ChartsQuantmod.R, Kyle Loomis, 2017-03-05

# ==================================================================
# Charting examples on quantmod: http://www.quantmod.com/examples/charting/
# Imports quantmod library to retrieve stock data from Yahoo! Finance
library(quantmod)
library(Quandl)
# creates a list of stocks - future revisions will 
# include importing tickers from .csv file

# Read CSV into R. Check current working directory
# getwd() and setwd() can be used to change directory
AeroCSV <- read.csv(file="Tickers/Aerospace1.csv", header=TRUE, sep=",")

for (x in AeroCSV[1]) {
  print(as.character(AeroCSV[x,1]))
}

csvTickers <- c(as.character(AeroCSV[,1]))

# symbolList <- c('NVDA','AMD','MU','INTC','WDC','AMAT','MRVL')
symbolList <- c(as.character(AeroCSV[,1]))
 
require(quantmod)

#Initialize a list to store the fetched prices
dataList <- list()

#Loop through symbols, fetch prices, and store in myList
dataList <-lapply(symbolList, function(x) {getSymbols(x,auto.assign=FALSE)} )
names(dataList) <- symbolList

# Universal date
timeframe <- '2017-01-01::2017-03-03'

# Fetches and stores data from Yahoo! Finance
getSymbols(symbolList)

for (i in symbolList) {
  pdf(file = paste0("/Users/kloomis/Desktop/Code/charting/RCharts/",i," - ",timeframe,".pdf"))
  candleChart(dataList[[i]], type = 'candles', name = paste0('Algora Finance - ',i), TA = 'addVo();addWMA()', theme = chartTheme('white'), up.col = 'green', dn.col = 'red', subset = timeframe, major.ticks = '1 hour', show.grid = TRUE)
  dev.off()
}




# ChartsQuantmod.R, Kyle Loomis, 2017-03-05

# ==================================================================
# Charting examples on quantmod: http://www.quantmod.com/examples/charting/
# Imports quantmod library to retrieve stock data from Yahoo! Finance
library(quantmod)
library(Quandl)
# creates a list of stocks - future revisions will 
# include importing tickers from .csv file

# Read CSV into R. Check current working directory
# getwd() and setwd() can be used to change directory
AeroCSV <- read.csv(file="Tickers/Finance.csv", header=TRUE, sep=",")

for (x in 1:50) {
  print(as.character(AeroCSV[x,1]))
}

csvTickers <- c(as.character(AeroCSV[,1]))

# symbolList <- c('NVDA','AMD','MU','INTC','WDC','AMAT','MRVL')
symbolList <- c(as.character(AeroCSV[,1]))

require(quantmod)

#Initialize a list to store the fetched prices
dataList <- list()

#Loop through symbols, fetch prices, and store in myList
dataList <-lapply(symbolList, function(x) {getSymbols(x,auto.assign=FALSE)} )
names(dataList) <- symbolList

# Universal date
timeframe <- '2017-01-01::2017-03-03'

# Fetches and stores data from Yahoo! Finance
getSymbols(symbolList)

for (i in symbolList) {
  pdf(file = paste0("/Users/kloomis/Desktop/Code/charting/RCharts/",i," - ",timeframe,".pdf"))
  candleChart(dataList[[i]], type = 'candles', name = paste0('Algora Finance - ',i), TA = 'addVo();addWMA()', theme = chartTheme('white'), up.col = 'green', dn.col = 'red', subset = timeframe, major.ticks = '1 hour', show.grid = TRUE)
  dev.off()
}






# Creates candlestick stock chart
candleChart(NVDA, type = 'candles', name = 'Algora Finance - NVDA', TA = 'addVo()', theme = chartTheme('white'), up.col = 'green', dn.col = 'red', subset = '2017--01::2017-03-03', major.ticks = '1 hour', show.grid = TRUE)
# Alternatively: candleChart(AMD, ...,  TA = 'addVo();addBBands()', ...)
# reChart() used to modify original chart
addBBands(n = 5, sd = 2, ma = "SMA", draw = 'bands', on = -1)
addMACD()
addSMA()




# Creates candlestick stock chart
candleChart(NVDA, type = 'candles', name = 'Algora Finance - NVDA', TA = 'addVo()', theme = chartTheme('white'), up.col = 'green', dn.col = 'red', subset = '2017--01::2017-03-03', major.ticks = '1 hour', show.grid = TRUE)
# Alternatively: candleChart(AMD, ...,  TA = 'addVo();addBBands()', ...)
# reChart() used to modify original chart
addBBands(n = 5, sd = 2, ma = "SMA", draw = 'bands', on = -1)
addMACD()
addSMA()


