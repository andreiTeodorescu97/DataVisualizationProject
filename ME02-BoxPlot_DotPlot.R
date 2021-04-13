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

#Converting Transfer_fee and Market_value into numerical
trans_data$Transfer_fee <- as.double(gsub(",", "", trans_data$Transfer_fee))
trans_data$Market_value <- as.double(gsub(",", "", trans_data$Market_value))

#Converting Transfer_fee and Market_value values to Millions
trans_data[c("Transfer_fee", "Market_value")] <- trans_data[c("Transfer_fee", "Market_value")]/1e6

## BoxPlot for transfer fee
ggplot(trans_data,aes(y=Transfer_fee))+
  geom_boxplot()+
  ggtitle("BoxPlot a Transfer_fee-ului jucatorilor")+
  ylab("Transfer_fee")

##Calculating binwidth
print(max(trans_data$Transfer_fee))
print(min(trans_data$Transfer_fee))

trasFee_range <- max(trans_data$Transfer_fee) - min(trans_data$Transfer_fee)
trasFee_range <- trasFee_range / 30
trasFee_range

#relationship between the Position and Transfer_fee variables in our dataset
ggplot(data = trans_data) +
  geom_boxplot(mapping = aes(x = Position, y = Transfer_fee))

#the same data, but using using dotplot
ggplot(data = trans_data) +
  geom_dotplot(mapping = aes(x = Transfer_fee, y = Position), binaxis = "y", 
               dotsize = 1, binwidth = 0.1) +
  xlim(c(20, 230))


#relationship between the League_to and Age variables in our dataset
ggplot(data = trans_data) +
  geom_boxplot(mapping = aes(x = League_to, y = Age)) +
  ylim(c(15, 38)) + theme(axis.text.x=element_text(angle = -90, hjust = 0))


