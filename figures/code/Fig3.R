library(tidyverse)
library(reshape2)
library(ggpubr)
library(ggthemes)

setwd("~/Desktop/COVID-Marcia/Brazil-E0/graphs/may28")
Fig3A <- read.csv("figure3-a.csv") 

figure3A <- ggplot(Fig3A, aes(x=male, y=female)) + 
  theme_bw()+
  geom_abline(slope=1,color = "grey") +
  geom_point(aes(color=REGION), size=5)+
  geom_text(aes(label=as.character(STATE), fontface="bold"),hjust=-0.3, vjust=0, size=4) +
  scale_y_continuous(breaks=seq(-10,90,10), limits = c(-10,90)) + scale_x_continuous(breaks=seq(-10,90,10), limits = c(-10,90)) +
  labs(colour="", x="Male", y="Female")+
  scale_color_manual(values=c("#000000", "#339900", "#990000","#FF9999","#003399","#3399CC")) +
  theme(axis.title.y=element_text(angle=90, face= "bold", colour= "black", size=13), 
        axis.title.x=element_text(angle=0, face= "bold", colour= "black", size=13),
        axis.text.x = element_text(size=12, face= "bold", colour= "black" ), 
        axis.text.y = element_text(size=12, face= "bold", colour= "black" ),
        legend.position = "none")

ggsave("fig3A.tiff", figure3A, width = 9, height=9, dpi=300)

Fig3B <- read.csv("figure3-b.csv")

figure3B <- ggplot(Fig3B, aes(x=male, y=female)) + 
  theme_bw()+
  geom_abline(slope=1,color = "grey") +
  geom_point(aes(color=REGION), size=5)+
  geom_text(aes(label=as.character(STATE), fontface="bold"),hjust=-0.3, vjust=0, size=4) +
  scale_y_continuous(breaks=seq(-10,130,10), limits = c(-10,130)) + scale_x_continuous(breaks=seq(-10,130,10), limits = c(-10,130)) +
  labs(colour="", x="Male", y="Female")+
  scale_color_manual(values=c("#000000", "#339900", "#990000","#FF9999","#003399","#3399CC")) +
  theme(axis.title.y=element_text(angle=90, face= "bold", colour= "black", size=13), 
        axis.title.x=element_text(angle=0, face= "bold", colour= "black", size=13),
        axis.text.x = element_text(size=12, face= "bold", colour= "black" ), 
        axis.text.y = element_text(size=12, face= "bold", colour= "black" ),
        legend.position = "none")


ggsave("fig3B.tiff", figure3B, width = 9, height=9, dpi=300)
