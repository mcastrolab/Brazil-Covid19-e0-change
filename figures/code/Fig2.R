library(tidyverse)
library(reshape2)
library(ggpubr)
library(ggthemes)

setwd("~/Desktop/COVID-Marcia/Brazil-E0/graphs/may28")

figure2a_data <- read.csv("figure2-a.csv")
figure2a_data$scenario[figure2a_data$scenario==1] <- "e0"
figure2a_data$scenario[figure2a_data$scenario==2] <- "e65"

figure2a_data$scenario <- as.factor(figure2a_data$scenario)
figure2a_data$STATE <- factor(figure2a_data$STATE,
                            levels = c("RO", "AC", "AM", "RR", "PA", "AP", "TO", "MA", "PI", "CE",
                                       "RN", "PB", "PE", "AL", "SE", "BA", "MG", "ES", "RJ", "SP", 
                                       "PR", "SC", "RS", "MS", "MT", "GO", "DF"))
figure2a <- 
  ggplot(figure2a_data[order(figure2a_data$scenario, decreasing = TRUE),], aes(x=STATE, y=decline, fill=scenario)) +
  theme_hc() + 
  geom_bar( stat="identity", position=position_dodge(), width=0.6) +
  geom_hline(yintercept = 0.62, size=0.8) +
  geom_hline(yintercept = 0.51, linetype="dashed", size=0.8) +
  scale_y_continuous(breaks=seq(-0.5,2.5, 0.5), limits=c(-0.6,2.5)) +
  scale_fill_manual(values=c("#990000", "#FF9999")) +
  labs(colour="", x="", y="Female - male gap")+
  theme(title=element_text(angle=0, face= "bold", colour= "black", size=12),
        axis.title.y=element_text(angle=90, face= "bold", colour= "black", size=12), 
        axis.title.x=element_text(angle=0, face= "bold", colour= "black", size=13),
        axis.text.x = element_text(size=11, face= "bold", colour= "black" ), 
        axis.text.y = element_text(size=11, face= "bold", colour= "black" ), 
        legend.text = element_text(size=10, face= "bold", colour= "black" ),
        legend.title = element_blank(),
        legend.position = "none")

ggsave("fig2A.tiff", width = 10, height=7, dpi=300)

figure2b_data <- read.csv("figure2-b1.csv")
figure2b_data$scenario <- as.factor(figure2b_data$scenario)
figure2b_data$STATE <- factor(figure2b_data$STATE,
                              levels = c("Total", "Male", "Female"))

figure2b <- 
ggplot(figure2b_data[order(figure2b_data$scenario, decreasing = TRUE),], aes(x=STATE, y=decline, fill=scenario)) +
  theme_hc() + 
  geom_bar( stat="identity", position=position_dodge(), width=0.3) +
  scale_y_continuous(breaks=seq(0,6, 1), limits=c(0,6)) +
  scale_fill_manual(values=c("#6699CC", "#003366")) +  labs(x="e0", y="Regional gap")+
  theme(title=element_text(angle=0, face= "bold", colour= "black", size=12),
        axis.title.y=element_text(angle=90, face= "bold", colour= "black", size=12), 
        axis.title.x=element_text(angle=0, face= "bold", colour= "black", size=13),
        axis.text.x = element_text(size=11, face= "bold", colour= "black" ), 
        axis.text.y = element_text(size=11, face= "bold", colour= "black" ), 
        legend.title = element_blank(),
        legend.position = "none") 

figure2c_data <- read.csv("figure2-b2.csv")
figure2c_data$scenario <- as.factor(figure2c_data$scenario)
figure2c_data$STATE <- factor(figure2c_data$STATE,
                              levels = c("Total", "Male", "Female"))

figure2c <- 
  ggplot(figure2c_data[order(figure2c_data$scenario, decreasing = TRUE),], aes(x=STATE, y=decline, fill=scenario)) +
  theme_hc() + 
  geom_bar( stat="identity", position=position_dodge(), width=0.3) +
  scale_y_continuous(breaks=seq(0,6, 1), limits=c(0,6)) +
  scale_fill_manual(values=c("#6699CC", "#003366")) +  labs(x="e65", y="")+
  theme(title=element_text(angle=0, face= "bold", colour= "black", size=12),
        axis.title.y=element_text(angle=90, face= "bold", colour= "black", size=12), 
        axis.title.x=element_text(angle=0, face= "bold", colour= "black", size=13),
        axis.text.x = element_text(size=11, face= "bold", colour= "black" ), 
        axis.text.y = element_text(size=11, face= "bold", colour= "black" ), 
        legend.title = element_blank(),
        legend.position = "none") 

fig2 <- ggarrange(figure2b, figure2c)
ggsave("fig2B.tiff", fig2, width = 10, height=7, dpi=300)