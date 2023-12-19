#Code Written by Dr. Mary Regina Boland
#Creating the forest plot for Figure 4 for Manuscript By Ella Poole and Dr. Mary Regina Boland

#LOAD THE DATA
figure4 = read.csv("https://raw.githubusercontent.com/bolandlab/Fracking_EndocrineDisruption_BirthOutcomes/main/Figure4_data.csv")

#load library ggplot2 
library(ggplot2) 
library(gridExtra) 
library("ggpubr")


#create forest plot 
figure4_set1 = subset(figure4, figure4$Setforplot=="Set1")
figure4_set1$Variable <- factor(figure4_set1$Variable, levels = unique(figure4_set1$Variable),ordered = T)
set1 = ggplot(data=figure4_set1, aes(x=Variable,y=as.numeric(Estimate),ymin=as.numeric(Confidence.Interval..lower.bound...2.5.),ymax=as.numeric(Confidence.Interval..upper.bound...97.5.), label=round(Estimate, digits=2))) + 
  geom_point() + geom_linerange() + 
  ylab("Coefficient Estimate (95% Confidence Interval)") + 
  theme_minimal() + coord_flip() + 
  theme(axis.title.y = element_blank()) + 
  geom_text(aes(y=Inf), hjust=1) + 
  ggtitle("Full Dataset (PTB)")
set1

#set2
figure4_set2 = subset(figure4, figure4$Setforplot=="Set2")
figure4_set2$Variable <- factor(figure4_set2$Variable, levels = unique(figure4_set2$Variable),ordered = T)
set2 = ggplot(data=figure4_set2, aes(x=Variable,y=as.numeric(Estimate),ymin=as.numeric(Confidence.Interval..lower.bound...2.5.),ymax=as.numeric(Confidence.Interval..upper.bound...97.5.), label=round(Estimate, digits=2))) + 
  geom_point() + geom_linerange() + 
  ylab("Coefficient Estimate (95% Confidence Interval)") + 
  theme_minimal() + coord_flip() + 
  theme(axis.title.y = element_blank()) + 
  geom_text(aes(y=Inf), hjust=1) + 
  ggtitle("2014-2018 Wells in Full Dataset (PTB)")
set2

#set3
figure4_set3 = subset(figure4, figure4$Setforplot=="Set3")
figure4_set3$Variable <- factor(figure4_set3$Variable, levels = unique(figure4_set3$Variable),ordered = T)
set3 = ggplot(data=figure4_set3, aes(x=Variable,y=as.numeric(Estimate),ymin=as.numeric(Confidence.Interval..lower.bound...2.5.),ymax=as.numeric(Confidence.Interval..upper.bound...97.5.), label=round(Estimate, digits=2))) + 
  geom_point() + geom_linerange() + 
  ylab("Coefficient Estimate (95% Confidence Interval)") + 
  theme_minimal() + coord_flip() + 
  theme(axis.title.y = element_blank()) + 
  geom_text(aes(y=Inf), hjust=1) + 
  ggtitle("Full Dataset (LBW)")
set3

#set4
figure4_set4 = subset(figure4, figure4$Setforplot=="Set4")
figure4_set4$Variable <- factor(figure4_set4$Variable, levels = unique(figure4_set4$Variable),ordered = T)
set4 = ggplot(data=figure4_set4, aes(x=Variable,y=as.numeric(Estimate),ymin=as.numeric(Confidence.Interval..lower.bound...2.5.),ymax=as.numeric(Confidence.Interval..upper.bound...97.5.), label=round(Estimate, digits=2))) + 
  geom_point() + geom_linerange() + 
  ylab("Coefficient Estimate (95% Confidence Interval)") + 
  theme_minimal() + coord_flip() + 
  theme(axis.title.y = element_blank()) + 
  geom_text(aes(y=Inf), hjust=1) + 
  ggtitle("2014-2018 Wells in Full Dataset (LBW)")

set4

figure4 <- ggarrange(set1,set2,
                     set3, set4,
                     labels = c("A", "B", "C", "D"),
                     ncol = 2, nrow = 2)
figure4


#saving the four plots into one figure file
figure4




