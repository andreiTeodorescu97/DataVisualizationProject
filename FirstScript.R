transfersData <- read.csv(file = 'top250-00-19.csv')
#install.package(ggplot2)
#library(ggplot2)
print(is.data.frame(transfersData))
print(ncol(transfersData))
print(nrow(transfersData))

# Get the max transfer fee.
biggestTransferFee <- max(transfersData$Transfer_fee)

# Get the person detail having max transfer fee.
playerMaxTransferFee <- subset(transfersData, Transfer_fee == max(Transfer_fee))
print(playerMaxTransferFee)

       
#ggplot(transfersData)
ggplot(transfersData, aes(x=as.factor(Age), fill=as.factor(Age) )) + 
  geom_bar( ) +
  geom_text(aes(label=..count..), stat="count", position=position_stack(0.5)) +
  scale_fill_hue(c = 40) +
  theme(legend.position="none")

ggplot(transfersData, aes(x=as.factor(Position), fill=as.factor(Position) )) + 
  geom_bar(width=0.5) +
  coord_flip() +
  geom_text(aes(label=..count..), stat="count", position=position_stack(0.5)) +
  scale_fill_hue(c = 40) +
  theme(legend.position="none")

ggplot(data = transfersData) + 
  geom_col(mapping = aes(x = Age, y = Transfer_fee)) +
  scale_fill_hue(c = 40) +
  theme(legend.position="none")



