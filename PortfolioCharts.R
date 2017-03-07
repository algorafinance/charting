# PortfolioCharts.R, Kyle Loomis, 2017-03-06

# ==================================================================
# Charting examples on quantmod: http://www.quantmod.com/examples/charting/
# Imports quantmod library to retrieve stock data from Yahoo! Finance
library(quantmod)
require(quantmod)

# Universal date - 3-month timeframe
timeframe <- '2016-12-06::2017-03-06'

# stocks in current portfolio
portfolioStocks <- c('NVDA','SOXL','PANW','NVDA','NOW','MU','MA','GBX','ECOM','CENT','AMAT')

# converts portfolioStocks to strings
symbolList <- c(as.character(portfolioStocks))

# Initialize a list to store the fetched prices
dataList <- list()

#Loop through symbols, fetch prices, and store in dataList
dataList <-lapply(symbolList, function(x) {getSymbols(x,auto.assign=FALSE)} )
names(dataList) <- symbolList

# Fetches and stores data from Yahoo! Finance
# Pauses data retrieval to avoid Yahoo Finance shutting system down
getSymbols(portfolioStocks)

# Iterates through symbolList and creates, names, and organizes charts
# use getwd() and setwd() to get and set working directory
for (i in symbolList) {
  pdf(file = paste0("/Users/kloomis/Desktop/Code/charting/RCharts/",i," - ",timeframe,".pdf"))
  candleChart(dataList[[i]], type = 'candles', name = paste0('Algora Finance - ',i), TA = 'addVo();addWMA();addBBands();addRSI();addMACD();addEMA();', theme = chartTheme('white'), up.col = 'green', dn.col = 'red', subset = timeframe, major.ticks = '1 hour', show.grid = TRUE)
  dev.off()
}

# Use instead of loop for more specific research
timeframe <- '2016-06-06::2017-03-06'
candleChart(ECOM, type = 'candles', name = 'Algora Finance - ECOM', TA = 'addVo();addWMA();addBBands();addRSI();addMACD();addEMA();', theme = chartTheme('white'), up.col = 'green', dn.col = 'red', subset = timeframe, major.ticks = '1 hour', show.grid = TRUE)
