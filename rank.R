library("ggplot2")
library("ggthemes")

# Load files
ranks <- read.csv('ranks.csv')

rank.plot <- ggplot( ranks, aes(x=reorder(LanguageData,AvgRank), y=16-AvgRank))+ geom_bar(stat='identity',fill='orange',color='darkblue')+ theme_wsj() + theme(axis.text.x = element_text(angle = 90, hjust = 1))+labs(title='Average rank',x='Language+Data Structure',y='16-average rank')

