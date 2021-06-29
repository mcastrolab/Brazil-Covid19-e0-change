library(tidyverse)
library(reshape2)
library(ggpubr)
library(ggthemes)

setwd("~/Desktop/COVID-Marcia/Brazil-E0/graphs/may28")

figure4a_data <- read.csv("figure4-c.csv") 
figure4a_data$scenario <- as.factor(figure4a_data$scenario)
figure4a_data$STATE <- factor(figure4a_data$STATE,
                            levels = c("RO", "AC", "AM", "RR", "PA", "AP", "TO", "MA", "PI", "CE",
                                       "RN", "PB", "PE", "AL", "SE", "BA", "MG", "ES", "RJ", "SP", 
                                       "PR", "SC", "RS", "MS", "MT", "GO", "DF"))

figure4a <- 
  ggplot(figure4a_data[order(figure4a_data$scenario, decreasing = TRUE),], aes(x=STATE, y=decline, fill=scenario)) +
  theme_hc() + 
  geom_bar( stat="identity", position=position_dodge(), width=0.7) +
  geom_hline(yintercept =1.78, size=0.8) + #total
  geom_hline(yintercept = 1.86, linetype="dashed", size=0.8) + #male
  geom_hline(yintercept = 1.64, linetype="dotted", size=0.8) + #female
  scale_y_continuous(limits = c(0, 5), breaks=seq(0,5, 0.5)) +
  scale_fill_manual(values=c("#CCCC99","#0066CC", "#CC0000")) +
  labs(x="", y="Decline")+
  theme(title=element_text(angle=0, face= "bold", colour= "black", size=10),
        axis.title.y=element_text(angle=90, face= "bold", colour= "black", size=16), 
        axis.title.x=element_text(angle=0, face= "bold", colour= "black", size=13),
        axis.text.x = element_text(size=11, face= "bold", colour= "black" ), 
        axis.text.y = element_text(size=12, face= "bold", colour= "black" ), 
        legend.text = element_text(size=10, face= "bold", colour= "black" ),
        legend.position = "none") 
ggsave("fig4A.tiff", width = 10, height=7, dpi=300)


figure4b_data <- read.csv("figure4-d.csv")
figure4b_data$scenario <- as.factor(figure4b_data$scenario)
figure4b_data$STATE <- factor(figure4b_data$STATE,
                              levels = c("RO", "AC", "AM", "RR", "PA", "AP", "TO", "MA", "PI", "CE",
                                         "RN", "PB", "PE", "AL", "SE", "BA", "MG", "ES", "RJ", "SP", 
                                         "PR", "SC", "RS", "MS", "MT", "GO", "DF"))

figure4b <- 
ggplot(figure4b_data[order(figure4b_data$scenario, decreasing = TRUE),], aes(x=STATE, y=decline, fill=scenario)) +
  theme_hc() + 
  geom_bar( stat="identity", position=position_dodge(), width=0.7) +
  geom_hline(yintercept =1.05, size=0.8) + #total
  geom_hline(yintercept = 1.14, linetype="dashed", size=0.8) + #male
  geom_hline(yintercept = 0.92, linetype="dotted", size=0.8) + #female
  scale_y_continuous(limits = c(0, 3), breaks=seq(0,3, 0.5)) +
  scale_fill_manual(values=c("#CCCC99","#0066CC", "#CC0000")) +
  labs(x="", y="Decline")+
  theme(title=element_text(angle=0, face= "bold", colour= "black", size=10),
        axis.title.y=element_text(angle=90, face= "bold", colour= "black", size=16), 
        axis.title.x=element_text(angle=0, face= "bold", colour= "black", size=13),
        axis.text.x = element_text(size=11, face= "bold", colour= "black" ), 
        axis.text.y = element_text(size=12, face= "bold", colour= "black" ), 
        legend.text = element_text(size=10, face= "bold", colour= "black" ),
        legend.position = "none") 

ggsave("fig4B.tiff", width = 10, height=7, dpi=300)
