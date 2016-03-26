## ----setup, cache=FALSE,echo=FALSE---------------------------------------
library("ggplot2")
library(RColorBrewer)
library("ggthemes")

# Load files
measures.bf <- read.csv('measures-bitflip-norm.csv')
measures.xo <- read.csv('measures-xover-norm.csv')
measures.mo <- read.csv('measures-maxones-norm.csv')

## ----results-bf, cache=FALSE,echo=FALSE----------------------------------

colourCount = length(unique(measures.bf$languagerepresentation))
getPalette = colorRampPalette(brewer.pal(9, "Set1"))
ggplot(measures.bf,aes(x=length,y=normtime,colour=factor(languagerepresentation)))+ geom_line() + geom_point(aes(shape=datastructure)) +  ggtitle("Bitflip")+scale_y_log10()+scale_x_log10()+scale_color_manual(name='Language',values=getPalette(colourCount))+ theme(legend.title = element_text(colour="blue", size=7, face="bold"))+ theme(legend.text = element_text(colour="blue", size=5))+ guides(col = guide_legend(keyheight=0.5,keywidth=0.5))+theme_tufte(ticks=FALSE)
ggsave("bitflip-norm.png",height=3,width=5.33)

## ----results-xo, cache=FALSE,echo=FALSE----------------------------------
colourCount = length(unique(measures.xo$languagerepresentation))
ggplot(measures.xo,aes(x=length,y=normtime,colour=factor(languagerepresentation)))+ geom_line() + geom_point(aes(shape=datastructure)) +  ggtitle("Crossover")+scale_y_log10()+scale_x_log10()+scale_color_manual(name='Language',values=getPalette(colourCount))+ theme(legend.title = element_text(colour="blue", size=7, face="bold"))+ theme(legend.text = element_text(colour="blue", size=5))+ guides(col = guide_legend(keyheight=0.5,keywidth=0.5))+theme_tufte(ticks=FALSE)
ggsave("xover-norm.png",height=3,width=5.33)


## ----results-mo, cache=FALSE,echo=FALSE----------------------------------
colourCount = length(unique(measures.mo$languagerepresentation))
ggplot(measures.mo,aes(x=length,y=normtime,colour=factor(languagerepresentation)))+ geom_line() + geom_point(aes(shape=datastructure)) +  ggtitle("Onemax")+scale_y_log10()+scale_x_log10()+scale_color_manual(name='Language',values=getPalette(colourCount))+ theme(legend.title = element_text(colour="blue", size=7, face="bold"))+ theme(legend.text = element_text(colour="blue", size=5))+ guides(col = guide_legend(keyheight=0.5,keywidth=0.5))+theme_tufte(ticks=FALSE)
ggsave("maxones-norm.png",height=3,width=5.33)


