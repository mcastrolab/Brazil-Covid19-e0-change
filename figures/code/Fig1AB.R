library(tidyverse)
library(reshape2)
library(ggpubr)
library(ggthemes)

setwd("~/Desktop/COVID-Marcia/Brazil-E0/graphs/may28")

figure1a_data <- read.csv("figure1-a.csv")
figure1a_data$scenario <- as.factor(figure1a_data$scenario)
figure3a_data$scenario[figure1a_data$scenario==1] <- "Total"
figure3a_data$scenario[figure1a_data$scenario==2] <- "Male"
figure3a_data$scenario[figure1a_data$scenario==3] <- "Female"

figure1a_data$STATE <- factor(figure1a_data$STATE,
                            levels = c("RO", "AC", "AM", "RR", "PA", "AP", "TO", "MA", "PI", "CE",
                                       "RN", "PB", "PE", "AL", "SE", "BA", "MG", "ES", "RJ", "SP", 
                                       "PR", "SC", "RS", "MS", "MT", "GO", "DF"))

figure1a <- 
  ggplot(figure1a_data[order(figure1a_data$scenario, decreasing = TRUE),], aes(x=STATE, y=decline, fill=scenario)) +
  theme_hc() + 
  geom_bar( stat="identity", position=position_dodge(), width=0.7) +
  geom_hline(yintercept =1.31, size=0.8) + #total
  geom_hline(yintercept = 1.57, linetype="dashed", size=0.8) + #male
  geom_hline(yintercept = 0.95, linetype="dotted", size=0.8) + #female
  scale_y_continuous(limits = c(-0.5, 4.0), breaks=seq(-0.5,4, 0.5)) +
  scale_fill_manual(values=c("#CCCC99","#0066CC", "#CC0000")) +
  labs(x="", y="e0,2019 - e0, 2020")+
  theme(title=element_text(angle=0, face= "bold", colour= "black", size=12),
        axis.title.y=element_text(angle=90, face= "bold", colour= "black",size=16), 
        axis.title.x=element_text(angle=0, face= "bold", colour= "black", size=13),
        axis.text.x = element_text(size=11, face= "bold", colour= "black" ), 
        axis.text.y = element_text(size=12, face= "bold", colour= "black" ), 
        legend.title = element_blank(),
        legend.position = "none") 
ggsave("fig1A.tiff", width = 10, height=7, dpi=300)

figure1b_data <- read.csv("figure1-b.csv")
figure1b_data$scenario <- as.factor(figure1b_data$scenario)
figure1b_data$STATE <- factor(figure1b_data$STATE,
                              levels = c("RO", "AC", "AM", "RR", "PA", "AP", "TO", "MA", "PI", "CE",
                                         "RN", "PB", "PE", "AL", "SE", "BA", "MG", "ES", "RJ", "SP", 
                                         "PR", "SC", "RS", "MS", "MT", "GO", "DF"))

figure1b <- 
ggplot(figure1b_data[order(figure1b_data$scenario, decreasing = TRUE),], aes(x=STATE, y=decline, fill=scenario)) +
  theme_hc() + 
  geom_bar( stat="identity", position=position_dodge(), width=0.7) +
  geom_hline(yintercept =0.94, size=0.8) + #total
  geom_hline(yintercept = 1.17, linetype="dashed", size=0.8) + #male
  geom_hline(yintercept = 0.66, linetype="dotted", size=0.8) + #female
  scale_y_continuous(limits = c(-0.5, 4.0), breaks=seq(-1,4, 0.5)) +
  scale_fill_manual(values=c("#CCCC99","#0066CC", "#CC0000")) +
  labs(x="", y="e65,2019 - e65, 2020")+
  theme(title=element_text(angle=0, face= "bold", colour= "black", size=12),
        axis.title.y=element_text(angle=90, face= "bold", colour= "black",size=16), 
        axis.title.x=element_text(angle=0, face= "bold", colour= "black", size=13),
        axis.text.x = element_text(size=11, face= "bold", colour= "black" ), 
        axis.text.y = element_text(size=12, face= "bold", colour= "black" ), 
        legend.title = element_blank(),
        legend.position = "none") 

ggsave("fig1B.tiff", width = 10, height=7, dpi=300)
