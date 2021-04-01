### clear screen

cat("/f")

### Default Options 

options(scipen=999)
options(stringsAsFactors = FALSE)

### Read Data

trans_data = as.data.frame(read.csv("E:/Master FMI/AN2/SEMESTRUL II/Optional/Top 250 Football Transfers - Proj/top250-00-19.csv"))


### Loading Libraries
library(ggplot2)
library(dplyr)  

head(trans_data)

# Get the max transfer fee.
biggestTransferFee <- max(trans_data$Transfer_fee)

#Histogram of Transfer Fees
ggplot(data=trans_data, aes(x=Transfer_fee)) + 
  geom_histogram(
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  labs(title="Histogram for Transfer Fees", x="Fee", y="Count") + 
  xlim(c(0, 130000000)) + 
  ylim(c(0,2100))

#Histogram of Age
ggplot(data=trans_data, aes(x=Age)) + 
  geom_histogram(breaks=seq(16, 40, by=1), 
                 col="red", 
                 aes(fill=..count..)) +
  scale_fill_gradient("Count", low="green", high="red")
