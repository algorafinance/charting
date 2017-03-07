# charting repository - created by Kyle Loomis on 2017-03-05


==================================================================
====================== Basic syntax of R =========================

=== Package Control ===
Install packages: install.packages("~library_name~")
Install packages from github - required only once
  1. library(devtools)
  2. install_github("twitter/AnomalyDetection")   # Requires repository name
Alternatively: 
  1. library(githubinstall)
  2. githubinstall("AnomalyDetection")
Import library - required before every used of the package
library(~libary_name~)
Syntax description: ?~function/library_name~

=== syntax explanation ===
Assigning a variable: x <- 6
Combine values into vector/list: x <- c(values)
Statistical functions: mean(x), sd(x), sum(x)
Compare values: >, <, ==, >=, <=, !=
Indexing: x[1] for 1st value, x[2] for 2nd value
Matrix: matrix(c(values), byrow = TRUE, nrow = 3)
  1. rownames(my_matrix) <- row_names_vector
  2. colnames(my_matrix) <- col_names_vector
Summing: rowSums(my_matrix), colSums(my_matrix)
Combining matrices: 
  1. Bind new column: big_matrix <- cbind(matrix1, matrix2, vector1 ...)
  2. Bind new row: big_matrix <- rbind(matrix1, matrix2, vector1 ...)

==================================================================
Charting examples on quantmod: http://www.quantmod.com/examples/charting/
Imports quantmod library to retrieve stock data from Yahoo! Finance

=== Example of usage ===
library(quantmod)
Fetches data for the following symbols:
getSymbols(c('NVDA','AMD'))

chartSeries(NVDA)
Creates candlestick stock chart
candleChart(NVDA, type = 'candles', name = 'Algora Finance - NVDA', TA = 'addVo()', theme = chartTheme('white'), up.col = 'green', dn.col = 'red', subset = '2017--01::2017-03-03', major.ticks = '1 hour', show.grid = TRUE)

Alternatively: candleChart(AMD, ...,  TA = 'addVo();addBBands()', ...)
reChart() used to modify original chart
addBBands(n = 5, sd = 2, ma = "SMA", draw = 'bands', on = -1)
addMACD()
addSMA()
