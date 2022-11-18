library(ggplot2)
library(reshape2)
library(stringr)

#NA_AD_table <- read.table("n1-ella-v1.csv", header=T, sep=',', check.names = F, allowEscapes=T)
NA_AD_table <- read.table("n1ELLA-v1.csv",header=T,sep=",",allowEscapes=T, check.names = F)
NA_AD_table$strain <- factor(NA_AD_table$strain, levels=NA_AD_table$strain)
NA_list <- melt(NA_AD_table, id="strain")
p <- ggplot(NA_list, aes(x=variable, fill=strain, y=value)) +
    # scale_fill_manual(values=palette()[1:6])+
    # scale_colour_manual(values=palette()[1:6])+
    # geom_bar(aes(colour=strain, fill=strain), stat="identity", position = position_dodge(width=0.55), width=0.5)+
    scale_shape_manual(values = c(20:25, 9))+
    geom_point(aes(color=strain, shape=strain), position=position_dodge(width=0.65),
               size=6, na.rm = TRUE)+
    # geom_line(aes(group=strain, color=strain), position=position_dodge(width=0.3),
    #           linetype=2)+
    labs(x=NULL, y="Antigenic Distance") +
    theme(legend.position="top", legend.title=element_blank(),
          text=element_text(size=15), axis.text.x=element_text(size=13))+
    geom_vline(xintercept = c(0.5,1.5,2.5,3.5,4.5,5.5,6.5)) +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 10))
p

ggsave("AD-pairwise-dist.png",plot=p,width=10.4, height = 7.36)

#png(filename = "AD-pairwise-dist.png", 
 #   res = 300,
  #  height = 9*300,
   # width = 7.5*300)
