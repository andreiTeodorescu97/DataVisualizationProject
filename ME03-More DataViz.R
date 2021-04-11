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

#checking for outliners
trans_data %>% filter(Transfer_fee > 250)

# looking for null values -> we found a lot of nulls into Market_value column, so we decided to remove the column from DS
colSums(is.na(trans_data))

# removing market_value column because of nulls
trans_data$Market_value <- NULL

# checking again for null values -> this time we found 0 null values
colSums(is.na(trans_data))

## top 3 seasons by total transfer_fee: 2017-2018, 2016-2017, 2018-2019
ggplot(trans_data,aes(x=Season,y=Transfer_fee)) +
  geom_bar(stat = "identity",width = 0.7,fill="skyblue")+
  coord_flip()+
  ggtitle("Valoare totala transferuri pentru fiecare sezon in parte")+
  xlab("Sezon")+
  ylab("Valoare transferuri")

## Transfers count in 2017-2018 season, via Position
trans_data %>% filter(Season == "2017-2018") %>% 
  ggplot(aes(x=Position))+
  geom_bar(fill = "Green")+
  ggtitle("Numarul total jucatori vanduti in sezonul 2017-2018 per pozitie")+
  xlab("Pozitie")+
  ylab("Numar")+
  coord_flip()

#checking for outliners
trans_data %>% filter(Age < 15)
trans_data %>% filter(Age > 40)

print(max(trans_data$Age))
print(min(trans_data$Age))

#found 1 player with age = 0 and we have to remove it from DS
trans_data <- trans_data[trans_data$Age!= 0,]

##Calculating binwidth
age_range <- max(trans_data$Age) - min(trans_data$Age)
age_range <- age_range / 20
age_range

# Histogram Distribution for Players Age
ggplot(trans_data,aes(x=Age))+
  geom_histogram(fill="navyblue",col="black", binwidth = 1)+
  ggtitle("Histogram Distribution pentru vastele jucatorilor")+
  xlab("Varsta") + 
  xlim(c(15, 35))


