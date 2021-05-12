#setwd("F:/Master/Cursuri/An II/Semestrul II/Data Visualization/Proiect Data Visualization")
setwd("F:/Master/Cursuri/An II/Semestrul II/Data Visualization/Proiect Data Visualization")
transfersData <- read.csv(file = 'top250-00-19.csv')
#install.package(ggplot2)
library(ggplot2)
print(is.data.frame(transfersData))
print(ncol(transfersData))
print(nrow(transfersData))

head(transfersData, 10)

# Get the max transfer fee.
biggestTransferFee <- max(transfersData$Transfer_fee)

# Get the person detail having max transfer fee.
playerMaxTransferFee <- subset(transfersData, Transfer_fee == max(Transfer_fee))
print(playerMaxTransferFee)

       
#ggplot(transfersData)
ggplot(transfersData, aes(x=as.factor(Age), fill=as.factor(Age) )) + 
  geom_bar( ) +
  geom_text(aes(label=..count..), stat="count", position=position_stack(0.5)) +
  labs(title="Age evolution plot", x="Age", y="Player count") + 
  scale_fill_hue(c = 40) +
  theme(legend.position="none")

ggplot(transfersData, aes(x=as.factor(Position), fill=as.factor(Position) )) + 
  geom_bar(width=0.5) +
  coord_flip() +
  geom_text(aes(label=..count..), stat="count", position=position_stack(0.5)) +
  labs(title="Player postion distribution plot", x="Player count", y="Player Position") + 
  scale_fill_hue(c = 40) +
  theme(legend.position="none")

ggplot(data = transfersData) + 
  geom_col(mapping = aes(x = Age, y = Transfer_fee)) +
  labs(title="Transfer Fee Distribution Plot", x="Age", y="Transfer Fee") +
  scale_fill_hue(c = 40) +
  theme(legend.position="none")



