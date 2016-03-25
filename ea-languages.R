## ----setup, cache=FALSE,echo=FALSE---------------------------------------
library("ggplot2")
library(RColorBrewer)
library("dplyr")

# Load files
measures.bf <- read.csv('measures-bitflip.csv')
measures.xo <- read.csv('measures-xover.csv')
measures.mo <- read.csv('measures-maxones.csv')
# measures.bf <- measures.bf %>% group_by(length) %>% mutate(NORM = normalit(time))

## ----results-bf, cache=FALSE,echo=FALSE----------------------------------

colourCount = length(unique(measures.bf$languagerepresentation))
getPalette = colorRampPalette(brewer.pal(9, "Set1"))
ggplot(measures.bf,aes(x=length,y=time,colour=factor(languagerepresentation)))+ geom_line() + geom_point() +  ggtitle("Bitflip")+scale_y_log10()+scale_x_log10()+scale_color_manual(name='Language',values=getPalette(colourCount))+ theme(legend.title = element_text(colour="blue", size=7, face="bold"))+ theme(legend.text = element_text(colour="blue", size=5))+ guides(col = guide_legend(keyheight=0.5,keywidth=0.5))
ggsave("bitflip.png",height=3,width=5.33)

## ----results-xo, cache=FALSE,echo=FALSE----------------------------------
colourCount = length(unique(measures.xo$languagerepresentation))
ggplot(measures.xo,aes(x=length,y=time,colour=factor(languagerepresentation)))+ geom_line() + geom_point() +  ggtitle("Crossover")+scale_y_log10()+scale_x_log10()+scale_color_manual(name='Language',values=getPalette(colourCount))+ theme(legend.title = element_text(colour="blue", size=7, face="bold"))+ theme(legend.text = element_text(colour="blue", size=5))+ guides(col = guide_legend(keyheight=0.5,keywidth=0.5))
ggsave("xover.png",height=3,width=5.33)


## ----results-mo, cache=FALSE,echo=FALSE----------------------------------
colourCount = length(unique(measures.mo$languagerepresentation))
ggplot(measures.mo,aes(x=length,y=time,colour=factor(languagerepresentation)))+ geom_line() + geom_point() +  ggtitle("Onemax")+scale_y_log10()+scale_x_log10()+scale_color_manual(name='Language',values=getPalette(colourCount))+ theme(legend.title = element_text(colour="blue", size=7, face="bold"))+ theme(legend.text = element_text(colour="blue", size=5))+ guides(col = guide_legend(keyheight=0.5,keywidth=0.5))
ggsave("maxones.png",height=3,width=5.33)


