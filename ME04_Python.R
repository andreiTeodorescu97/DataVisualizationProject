setwd("F:/Master/Cursuri/An II/Semestrul II/Data Visualization/Proiect Data Visualization")
transfersData <- read.csv(file = 'top250-00-19.csv')
library(ggplot2)
head(transfersData)
hist(transfersData$Age)
hist(transfersData$Market_value)
hist(transfersData$Transfer_fee)

#Age seems to be pretty normally distributed but market_value and transfer_fee 
#seem very skeweed to the right with very little players traded at very high prices. 
#This is ok becuase we only have "few" star players who are traded for exorbitant prices

install.packages('reticulate')
use_python("C:/Users/DCypherMedia/AppData/Local/Programs/Python/Python39", required = TRUE)
library(reticulate)
repl_python()
reticulate::py_config()

plt <- import('matplotlib.pyplot')
sns <- import('seaborn')
pd <- import('pandas')
np <- import('numpy')
plt$style$use('ggplot')

df = pd$read_csv("top250-00-19.csv")

N <- 50L
x <- np$random$rand(N)

py$df

sns$countplot(x='Position',data=df)
plt$xticks(rotation=90)
plt$show()

#Center Foward(CF) traded the most followed 
#by Center Back and multiple midfielder positions. The Center positions are traded the most!
sns$pointplot(x='index',y='Season',data=pd$DataFrame(df$Season$value_counts()),reset_index(),sort_values('index'))
plt$xticks(rotation=90)
plt$xlabel('Season')
plt$ylabel('Number of Trade')
plt$show()

#Which league spent the most money buying players for every season? & 
#Which league sold the most players in terms of average transfer fees?

# Order by mean transfer fee from highest to lowest
league_from = df$group_by(League_from)["Transfer_fee"]$sum()
top5sell_league = league_from$sort_values(ascending=False)$head(5)
top5sell_league = top5sell_league/1000000
top5sell_league.head()

sns.pointplot(x='index',y='Season',data=pd$DataFrame(df$Season$value_counts()),reset_index(),sort_values('index'))
plt$xticks(rotation=90)
plt$xlabel('Season')
plt$ylabel('Number of Trade')
plt$show()


league_from <- df$groupby('League_from')['Transfer_fee']$sum()
top5sell_league <- head(league_from$sort_values(ascending=False))
top5sell_league <- top5sell_league/1000000
top5sell_league$head()



































































































































