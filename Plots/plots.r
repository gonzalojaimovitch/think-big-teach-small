#Necessary packages. Note that some fonts need to be downloaded and installed in the OS
library(ggplot2)
library(extrafont)
library(tidyverse)
library(wesanderson)
library(reshape2)
loadfonts()


#Insert the preferred directory to store the generated plots

directory <- "COMPLETE"


lgtbVRAINPalette <- c("#55CDFC","#F7A8B8","#FF0018","#FF8C00","#008026","#004DFF","#750787","#FFED00","#0F8698")

cubeHelixPalette <- c("#297534","#B4B1EE","#ED7164","#141227")



#Data frames for the human explanations analysis

df4 <- data.frame(complexities=c("VL-C","L-C","H-C","VH-C","VL-C","L-C","H-C","VH-C","VL-C","L-C","H-C","VH-C","VL-C","L-C","H-C","VH-C"),percentages=c(48.333,28.333,1.666,0,0,5,3.333,5,23.333,40,30,51.666,28.333,26.666,65,43.333),types=c("Correct","Correct","Correct","Correct","Incomplete","Incomplete","Incomplete","Incomplete","Incorrect","Incorrect","Incorrect","Incorrect","No answer","No answer","No answer","No answer"),prog_size=c(1.5,3.5,5.5,7.5,1.5,3.5,5.5,7.5,1.5,3.5,5.5,7.5,1.5,3.5,5.5,7.5))


df5 <- data.frame(complexities=c("VL-C","L-C","H-C","VH-C","VL-C","L-C","H-C","VH-C","VL-C","L-C","H-C","VH-C","VL-C","L-C","H-C","VH-C"),sizes=c(48.45,82.56,88,0,0,28.67,41.5,39,95.71,96,124.33,87.19,63.83,86.30,114.71,82.94),types=c("Correct","Correct","Correct","Correct","Incomplete","Incomplete","Incomplete","Incomplete","Incorrect","Incorrect","Incorrect","Incorrect","Total","Total","Total","Total"),prog_size=c(1.5,3.5,5.5,7.5,1.5,3.5,5.5,7.5,1.5,3.5,5.5,7.5,1.5,3.5,5.5,7.5))


df4$complexities <- factor(df4$complexities, levels = c("VL-C","L-C","H-C","VH-C"))

df5$complexities <- factor(df5$complexities, levels = c("VL-C","L-C","H-C","VH-C"))


plot1 <- ggplot(df4,aes(x=complexities,y=percentages,fill=factor(types)))+
geom_bar(stat="identity",position="stack",width = 0.4)+labs(fill = "")+
ylab("Explanations (%)")+ylim(0,100)+scale_fill_manual("", values = cubeHelixPalette)+theme(axis.title.x=element_blank(),text = element_text(size=12, family="LM Roman 10"),panel.background = element_blank(),panel.grid.major.x = element_blank(),panel.grid.minor.x = element_blank(),panel.grid.major.y = element_line(colour = "black", size = 0.1),panel.grid.minor.y = element_blank(),panel.border = element_rect(colour = "black", fill=NA),legend.position="bottom",legend.key.size = unit(4, "mm"),legend.text  = element_text(size = 9),legend.key = element_blank())

ggsave(filename = "humanperc_col.png", plot = plot1 ,path = directory, height = 70, width = 120, units = "mm")

plot1 <- ggplot(df5,aes(x=complexities,y=sizes,fill=factor(types)))+
geom_bar(stat="identity",position="dodge")+labs(fill = "")+
ylab("Explanation Lengths
(Avg Char)")+scale_fill_manual("", values = cubeHelixPalette)+theme(axis.title.x=element_blank(),text = element_text(size=12, family="LM Roman 10"),panel.background = element_blank(),panel.grid.major.x = element_blank(),panel.grid.minor.x = element_blank(),panel.grid.major.y = element_line(colour = "black", size = 0.1),panel.grid.minor.y = element_blank(),panel.border = element_rect(colour = "black", fill=NA),legend.position="bottom",legend.key.size = unit(4, "mm"),legend.text  = element_text(size = 9),legend.key = element_blank())

ggsave(filename = "humansize_col.png", plot = plot1 ,path = directory, height = 70, width = 120, units = "mm")




#Dataframes for performance analysis

df7 <- data.frame(phases=c("WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II","WS", "AS I", "AS II"),accuracies=c(38.16666,67.916666,85.1666667,13,43.8888,54.111111,7.777775,12.77775,23.3333333,19.444444,28.61,36.9444,80,80,100,10,30,46.6666,0,33.3333,33.33333,33.33333,50,50,45,57.5,55,10,10,46.6666,0,33.3333,33.3333,33.33333,50,50,18.625,54.625,54.8125,6.8333,17,47.5,18.333,24.5833,30.83333,22.7083,27.5,41.66666,0,100,100,0,0,0,0,0,0,0,0,0,55,77.5,100,0,36.6,36.6,0,0,16.6,50,50,50,57.87,75.74,98.33,0,36.6,36.6,0,0,11.1,50,50,50),complexities=c("VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C","VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C","VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C","VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C","VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C","VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C","VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C"), learners=c("Humans","Humans","Humans","Humans","Humans","Humans","Humans","Humans","Humans","Humans","Humans","Humans","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-2-ens","GPT-2-ens","GPT-2-ens","GPT-2-ens","GPT-2-ens","GPT-2-ens","GPT-2-ens","GPT-2-ens","GPT-2-ens","GPT-2-ens","GPT-2-ens","GPT-2-ens","GPT-2-exp","GPT-2-exp","GPT-2-exp","GPT-2-exp","GPT-2-exp","GPT-2-exp","GPT-2-exp","GPT-2-exp","GPT-2-exp","GPT-2-exp","GPT-2-exp","GPT-2-exp","MH","MH","MH","MH","MH","MH","MH","MH","MH","MH","MH","MH","Louise-ens","Louise-ens","Louise-ens","Louise-ens","Louise-ens","Louise-ens","Louise-ens","Louise-ens","Louise-ens","Louise-ens","Louise-ens","Louise-ens","Louise-exp","Louise-exp","Louise-exp","Louise-exp","Louise-exp","Louise-exp","Louise-exp","Louise-exp","Louise-exp","Louise-exp","Louise-exp","Louise-exp"))

df7$phases <- factor(df7$phases, levels = c('WS','AS I','AS II'))
df7$complexities <- factor(df7$complexities, levels = c('VL-C','L-C','H-C','VH-C'))
df7$learners <- factor(df7$learners, levels = c('Humans','GPT-3D-T0','GPT-2-ens','GPT-2-exp','MH','Louise-ens','Louise-exp'))

df7a <- aggregate(df7, by = list(df7$learners, df7$complexities), FUN =mean)

plot1 <- ggplot(df7a,aes(x=Group.2,y=accuracies,group=Group.1,linetype=Group.1,color=Group.1))+
    geom_line()+geom_point()+scale_color_manual("", values=lgtbVRAINPalette)+scale_linetype_manual("",values = c(1,2,3,4,5,6,7,8))+ylab("Average Accuracies (%)")+ylim(0,100)+theme(legend.text = element_text(size = 6),legend.position=c(0.716, 0.8),axis.title.x=element_blank(),text = element_text(size=12, family="LM Roman 10"),panel.background = element_blank(),panel.grid.major.x = element_line(colour = "grey", size = 0.1),panel.grid.minor.x = element_blank(),panel.grid.major.y = element_line(colour = "grey", size = 0.1),panel.grid.minor.y = element_line(colour = "grey", size = 0.05),panel.border = element_rect(colour = "grey", fill=NA), legend.key.width = unit(12,"mm"), legend.key = element_blank(), legend.title = element_blank())+guides(colour = guide_legend(ncol=2))

ggsave(filename = "complexitiesavg_col_ES.png", plot = plot1 ,path = directory, height = 70, width = 120, units = "mm")

df7b <- aggregate(df7, by = list(df7$learners, df7$phases), FUN =mean)

plot1 <- ggplot(df7b,aes(x=Group.2,y=accuracies,group=Group.1,linetype=Group.1,color=factor(Group.1)))+
    geom_line()+geom_point()+scale_color_manual("", values=lgtbVRAINPalette)+scale_linetype_manual("",values = c(1,2,3,4,5,6,7,8))+ylab("Average Accuracies (%)")+ylim(0,80)+theme(legend.text = element_text(size = 6),legend.position=c(0.497, 0.865),axis.title.x=element_blank(),text = element_text(size=12, family="LM Roman 10"),panel.background = element_blank(),panel.grid.major.x = element_line(colour = "grey", size = 0.1),panel.grid.minor.x = element_blank(),panel.grid.major.y = element_line(colour = "grey", size = 0.1),panel.grid.minor.y = element_line(colour = "grey", size = 0.05),panel.border = element_rect(colour = "grey", fill=NA), legend.key.width = unit(11,"mm"), legend.key = element_blank(), legend.title = element_blank())+guides(colour = guide_legend(ncol=4))

ggsave(filename = "average_col_ES.png", plot = plot1 ,path = directory, height = 70, width = 120, units = "mm")


#Similarity Analysis
df8 <- data.frame(Humans = c(0.06666666666666667,0,0,0,0,0.8,0.6,0.4,0.5666666666666667,0.6333333333333333,0.9333333333333333,0.9,0.8,0.9,0.9,0.7666666666666667,0.7,0.7666666666666667,0.7666666666666667,0.9333333333333333,0.7333333333333333,0.6666666666666666,0.7,0.8666666666666667,0.8,0.7666666666666667,0.8333333333333334,0,0.1,0.2,0,0.13333333333333333,0.8,0.03333333333333333,0.03333333333333333,0.9,0.23333333333333334,0.2,0.2,0.06666666666666667,0.1,0.6333333333333333,0.5666666666666667,0.5666666666666667,0.5333333333333333,0.5333333333333333,0.8,0.7666666666666667,0.7666666666666667,0.7666666666666667,0.7,0.23333333333333334,0.13333333333333333,0.1,0.2,0.13333333333333333,0.43333333333333335,0.36666666666666664,0.43333333333333335,0.6,0,0,0,0.2,0.5333333333333333,0.43333333333333335,0.5333333333333333,0.6,0.5333333333333333,0.6666666666666666,0.7666666666666667,0.7333333333333333,0,0,0,0.03333333333333333,0,0.03333333333333333), `GPT-3D-T0` = c(1,0,1,0,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,1,1,0,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0), `GPT-2-ens` = c(0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,0,1,1,1,1,0,1,0,0,1,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,1,1,0,0,0,0,0,0,1,1,0,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0), `GPT-2-exp` = c(0.125,0.1,0.275,0.125,0.3,0.325,0.8,0.3,0.9,0.2,0.7,0.375,0.575,0.4,0.65,0.05,0.075,0.3,0.325,0.775,0.7,0.325,0.55,0.3,0.45,0.725,0.75,0.025,0.075,0.025,0.125,0.225,0.1,0.25,0.375,0.8,0.025,0.1,0.275,0.05,0.025,0.15,0.175,0.4,0.125,0.1,0.525,0.7,0.9,0.175,0.075,0.1,0.3,0.25,0.05,0.55,0.5,0.3,0.65,0.6,0.15,0.125,0.1,0.075,0.625,0.55,0.45,0.525,0.6,0.825,0.7,0.75,0.075,0,0.025,0.025,0.125,0.025), MH = c(0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),`Louise-ens` = c(1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,0,0,1,1,1,1,0,1,1,1,1,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0),`Louise-exp` = c(0.7647058823529411,0.058823529411764705,0.5294117647058824,0.058823529411764705,0.7647058823529411,0.9,0.5,0.4,0.5,0.9,1,1,0.8333333333333334,1,1,0.5,0.5,0.8888888888888888,1,1,1,0.5,1,1,1,1,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0.6666666666666666,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0),check.names=FALSE)

sd8 <- head(df8,120)
cormat <- round(cor(sd8),2)
get_upper_tri <- function(cormat){
    cormat[lower.tri(cormat)]<- NA
    return(cormat)
}

#upper_tri <- get_upper_tri(cormat)
# Melt the correlation matrix
#melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- melt(cormat, na.rm = TRUE)

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(Var2, Var1, fill = value))+
    geom_tile(color = "white")+
    scale_fill_gradient2(low = "red", high = "#03A9F4", mid = "white",
                         midpoint = 0, limit = c(-1,1), space = "Lab",
                         name="") +
    theme_minimal()+ # minimal theme
    theme(axis.text.x = element_text(angle = 45, vjust = 1,
                                     size = 14, hjust = 1))+
    coord_fixed()

plot1 <- ggheatmap +
    geom_text(aes(Var2, Var1, label = value), color = "black", size = 5,family = "LM Roman 10") +
    theme(
        text = element_text(size=18, family="LM Roman 10"),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.ticks = element_blank(),
        legend.justification = c(1, 0),
        legend.position = c(1.2, 0.25),
        legend.direction = "vertical")+
    guides(fill = guide_colorbar(barwidth = 1, barheight = 7,
                                 title.position = "top", title.hjust = 0.5))

ggsave(filename = "corrmatr_ES.png", plot = plot1 ,path = directory,height = 120, width = 160, units = "mm")

humGPT3 <- sum(abs(sd8$Humans - sd8$`GPT-3D-T0`))/length(sd8$Humans)
humGPT2exp <- sum(abs(sd8$Humans - sd8$`GPT-2-exp`))/length(sd8$Humans)
humGPT2ens <- sum(abs(sd8$Humans - sd8$`GPT-2-ens`))/length(sd8$Humans)
humMH <- sum(abs(sd8$Humans - sd8$MH))/length(sd8$Humans)
humLoEx <- sum(abs(sd8$Humans - sd8$`Louise-exp`))/length(sd8$Humans)
humLoEn <- sum(abs(sd8$Humans - sd8$`Louise-ens`))/length(sd8$Humans)
GPT3GPT2exp <- sum(abs(sd8$`GPT-3D-T0` - sd8$`GPT-2-exp`))/length(sd8$`GPT-3D-T0`)
GPT3GPT2ens <- sum(abs(sd8$`GPT-3D-T0` - sd8$`GPT-2-ens`))/length(sd8$`GPT-3D-T0`)
GPT3MH <- sum(abs(sd8$`GPT-3D-T0` - sd8$MH))/length(sd8$`GPT-3D-T0`)
GPT3LoEx <- sum(abs(sd8$`GPT-3D-T0` - sd8$`Louise-exp`))/length(sd8$`GPT-3D-T0`)
GPT3LoEn <- sum(abs(sd8$`GPT-3D-T0` - sd8$`Louise-ens`))/length(sd8$`GPT-3D-T0`)
GPT2expGPT2ens <- sum(abs(sd8$`GPT-2-exp` - sd8$`GPT-2-ens`))/length(sd8$`GPT-2-exp`)
GPT2expMH <- sum(abs(sd8$`GPT-2-exp` - sd8$MH))/length(sd8$`GPT-2-exp`)
GPT2expLoEx <- sum(abs(sd8$`GPT-2-exp` - sd8$`Louise-exp`))/length(sd8$`GPT-2-exp`)
GPT2expLoEn <- sum(abs(sd8$`GPT-2-exp` - sd8$`Louise-ens`))/length(sd8$`GPT-2-exp`)
GPT2ensMH <- sum(abs(sd8$`GPT-2-ens` - sd8$MH))/length(sd8$`GPT-2-ens`)
GPT2ensLoEn <- sum(abs(sd8$`GPT-2-ens` - sd8$`Louise-ens`))/length(sd8$`GPT-2-ens`)
GPT2ensLoEx <- sum(abs(sd8$`GPT-2-ens` - sd8$`Louise-exp`))/length(sd8$`GPT-2-ens`)
MHLoEx <- sum(abs(sd8$MH - sd8$`Louise-exp`))/length(sd8$MH)
MHLoEn <- sum(abs(sd8$MH - sd8$`Louise-ens`))/length(sd8$MH)
LoEnLoEx <- sum(abs(sd8$`Louise-ens` - sd8$`Louise-exp`))/length(sd8$`Louise-ens`)

melted_err <- melted_cormat
melted_err$value <- round(c(0, humGPT3,humGPT2ens,humGPT2exp,humMH,humLoEn,humLoEx, humGPT3,0, GPT3GPT2ens,GPT3GPT2exp, GPT3MH, GPT3LoEn,GPT3LoEx,humGPT2ens, GPT3GPT2ens, 0, GPT2expGPT2ens,GPT2ensMH, GPT2ensLoEn, GPT2ensLoEx,humGPT2exp, GPT3GPT2exp, GPT2expGPT2ens, 0,GPT2expMH, GPT2ensLoEn, GPT2ensLoEx, humMH, GPT3MH, GPT2ensMH, GPT2expMH, 0,  MHLoEn, MHLoEx,humLoEn,GPT3LoEn,GPT2ensLoEn,GPT2expLoEn,MHLoEn,0,LoEnLoEx,humLoEx,GPT3LoEx,GPT2ensLoEx,GPT2expLoEx,MHLoEx,LoEnLoEx,0),2)

# Create a ggheatmap
ggheatmap <- ggplot(melted_err, aes(Var2, Var1, fill = value))+
    geom_tile(color = "white")+
    scale_fill_gradient2(low = "#03A9F4", high = "red", mid = "white",
                         midpoint = 0.5, limit = c(0,1), space = "Lab",
                         name="") +
    theme_minimal()+ # minimal theme
    theme(axis.text.x = element_text(angle = 45, vjust = 1,
                                     size = 14, hjust = 1))+
    coord_fixed()

plot1 <- ggheatmap +
    geom_text(aes(Var2, Var1, label = value), color = "black", size = 5,family = "LM Roman 10") +
    theme(
        text = element_text(size=18, family="LM Roman 10"),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.ticks = element_blank(),
        legend.justification = c(1, 0),
        legend.position = c(1.2, 0.25),
        legend.direction = "vertical")+
    guides(fill = guide_colorbar(barwidth = 1, barheight = 7,
                                 title.position = "top", title.hjust = 0.5))

ggsave(filename = "simerr_ES.png", plot = plot1 ,path = directory,height = 120, width = 160, units = "mm")


df9 <- data.frame(phases=c("WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II","WS","AS I","AS II"), complexities=c("VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C","VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C","VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C","VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C","VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C","VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C","VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C","VL-C","VL-C","VL-C","L-C","L-C","L-C","H-C","H-C","H-C","VH-C","VH-C","VH-C"),accuracies=c(55,57.5,55,20,40,56.666,0,0,0,33.333,33.333,50,12.5,75,75,10,46.666,46.666,0,33.333,33.333,33.333,50,50,12.5,90,87.5,30,30,46.6665,0,16.666,33.333,33.333,50,50,80,80,100,10,30,46.666,0,33.333,33.333,33.333,50,50,55,45,65,10,20,56.666,0,0,16.666,16.666,50,50,12.5,87.5,77.5,0,30,46.666,0,33.333,50,33.333,50,50,35,80,100,10,30,20,0,0,33.333,16.666,50,50,67.5,55,90,16.666,10,46.666,16.666,33.333,33.333,50,50,50),learners=c("GPT-3A-T0","GPT-3A-T0","GPT-3A-T0","GPT-3A-T0","GPT-3A-T0","GPT-3A-T0","GPT-3A-T0","GPT-3A-T0","GPT-3A-T0","GPT-3A-T0","GPT-3A-T0","GPT-3A-T0","GPT-3B-T0","GPT-3B-T0","GPT-3B-T0","GPT-3B-T0","GPT-3B-T0","GPT-3B-T0","GPT-3B-T0","GPT-3B-T0","GPT-3B-T0","GPT-3B-T0","GPT-3B-T0","GPT-3B-T0","GPT-3C-T0","GPT-3C-T0","GPT-3C-T0","GPT-3C-T0","GPT-3C-T0","GPT-3C-T0","GPT-3C-T0","GPT-3C-T0","GPT-3C-T0","GPT-3C-T0","GPT-3C-T0","GPT-3C-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3D-T0","GPT-3A-T1","GPT-3A-T1","GPT-3A-T1","GPT-3A-T1","GPT-3A-T1","GPT-3A-T1","GPT-3A-T1","GPT-3A-T1","GPT-3A-T1","GPT-3A-T1","GPT-3A-T1","GPT-3A-T1","GPT-3B-T1","GPT-3B-T1","GPT-3B-T1","GPT-3B-T1","GPT-3B-T1","GPT-3B-T1","GPT-3B-T1","GPT-3B-T1","GPT-3B-T1","GPT-3B-T1","GPT-3B-T1","GPT-3B-T1","GPT-3C-T1","GPT-3C-T1","GPT-3C-T1","GPT-3C-T1","GPT-3C-T1","GPT-3C-T1","GPT-3C-T1","GPT-3C-T1","GPT-3C-T1","GPT-3C-T1","GPT-3C-T1","GPT-3C-T1","GPT-3D-T1","GPT-3D-T1","GPT-3D-T1","GPT-3D-T1","GPT-3D-T1","GPT-3D-T1","GPT-3D-T1","GPT-3D-T1","GPT-3D-T1","GPT-3D-T1","GPT-3D-T1","GPT-3D-T1"))

df9$phases <- factor(df9$phases, levels = c('WS','AS I','AS II'))

df9$complexities <- factor(df9$complexities, levels = c('VL-C','L-C','H-C','VH-C'))


df9a <- aggregate(df9, by = list(df9$learners, df9$phases), FUN =mean)


plot1 <- ggplot(df9a,aes(x=Group.2,y=accuracies,group=Group.1,shape=Group.1,color=factor(Group.1)))+
geom_line()+geom_point()+scale_color_manual("", values=lgtbVRAINPalette)+scale_shape_manual("",values = 1:8)+ylab("Average Accuracies (%)")+ylim(0,60)+theme(legend.text = element_text(size = 9),legend.position=c(0.66, 0.2),axis.title.x=element_blank(),text = element_text(size=12, family="LM Roman 10"),panel.background = element_blank(),panel.grid.major.x = element_line(colour = "grey", size = 0.1),panel.grid.minor.x = element_blank(),panel.grid.major.y = element_line(colour = "grey", size = 0.1),panel.grid.minor.y = element_line(colour = "grey", size = 0.05),panel.border = element_rect(colour = "grey", fill=NA), legend.key.width = unit(2,"mm"), legend.key = element_blank(), legend.title = element_blank())+guides(colour = guide_legend(ncol=3))

ggsave(filename = "gpt3com_col_ES.png", plot = plot1 ,path = directory, height = 70, width = 120, units = "mm")


df9b <- aggregate(df9, by = list(df9$learners, df9$complexities), FUN =mean)

plot1 <- ggplot(df9b,aes(x=Group.2,y=accuracies,group=Group.1,shape=Group.1,color=factor(Group.1)))+
geom_line()+geom_point()+scale_color_manual("", values=lgtbVRAINPalette)+scale_shape_manual("",values = 1:8)+ylab("Average Accuracies (%)")+ylim(0,100)+theme(legend.text = element_text(size = 9),legend.position=c(0.655, 0.8),axis.title.x=element_blank(),text = element_text(size=12, family="LM Roman 10"),panel.background = element_blank(),panel.grid.major.x = element_line(colour = "grey", size = 0.1),panel.grid.minor.x = element_blank(),panel.grid.major.y = element_line(colour = "grey", size = 0.1),panel.grid.minor.y = element_line(colour = "grey", size = 0.05),panel.border = element_rect(colour = "grey", fill=NA), legend.key.width = unit(2,"mm"), legend.key = element_blank(), legend.title = element_blank())+guides(colour = guide_legend(ncol=3))

ggsave(filename = "gpt3complexities_col_ES.png", plot = plot1 ,path = directory, height = 70, width = 120, units = "mm")



lgtbVRAINPalette <- c("#55CDFC","#FF0018","#008026","#750787")


sdf <- subset(df9a,Group.1 == "GPT-3A-T0" | Group.1 == "GPT-3B-T0" | Group.1 == "GPT-3C-T0" | Group.1 == "GPT-3D-T0")

plot1 <- ggplot(sdf,aes(x=Group.2,y=accuracies,group=Group.1,color=factor(Group.1)))+
geom_line()+geom_point()+scale_color_manual("", values=lgtbVRAINPalette)+ylab("Average Accuracies (%)")+ylim(0,60)+theme(legend.text = element_text(size = 9),legend.position=c(0.66, 0.2),axis.title.x=element_blank(),text = element_text(size=12, family="LM Roman 10"),panel.background = element_blank(),panel.grid.major.x = element_line(colour = "grey", size = 0.1),panel.grid.minor.x = element_blank(),panel.grid.major.y = element_line(colour = "grey", size = 0.1),panel.grid.minor.y = element_line(colour = "grey", size = 0.05),panel.border = element_rect(colour = "grey", fill=NA), legend.key.width = unit(2,"mm"), legend.key = element_blank(), legend.title = element_blank())+guides(colour = guide_legend(ncol=3))

ggsave(filename = "gpt3T0com_col_ES.png", plot = plot1 ,path = directory, height = 70, width = 120, units = "mm")


sdf <- subset(df9b,Group.1 == "GPT-3A-T0" | Group.1 == "GPT-3B-T0" | Group.1 == "GPT-3C-T0" | Group.1 == "GPT-3D-T0")

plot1 <- ggplot(sdf,aes(x=Group.2,y=accuracies,group=Group.1,color=factor(Group.1)))+
geom_line()+geom_point()+scale_color_manual("", values=lgtbVRAINPalette)+ylab("Average Accuracies (%)")+ylim(0,100)+theme(legend.text = element_text(size = 9),legend.position=c(0.655, 0.8),axis.title.x=element_blank(),text = element_text(size=12, family="LM Roman 10"),panel.background = element_blank(),panel.grid.major.x = element_line(colour = "grey", size = 0.1),panel.grid.minor.x = element_blank(),panel.grid.major.y = element_line(colour = "grey", size = 0.1),panel.grid.minor.y = element_line(colour = "grey", size = 0.05),panel.border = element_rect(colour = "grey", fill=NA), legend.key.width = unit(2,"mm"), legend.key = element_blank(), legend.title = element_blank())+guides(colour = guide_legend(ncol=3))

ggsave(filename = "gpt3T0complexities_col_ES.png", plot = plot1 ,path = directory, height = 70, width = 120, units = "mm")


lgtbVRAINPalette <- c("#F7A8B8","#FF8C00","#004DFF","#FFED00")

sdf <- subset(df9a,Group.1 == "GPT-3A-T1" | Group.1 == "GPT-3B-T1" | Group.1 == "GPT-3C-T1" | Group.1 == "GPT-3D-T1")

plot1 <- ggplot(sdf,aes(x=Group.2,y=accuracies,group=Group.1,color=factor(Group.1)))+
geom_line()+geom_point()+scale_color_manual("", values=lgtbVRAINPalette)+ylab("Average Accuracies (%)")+ylim(0,60)+theme(legend.text = element_text(size = 9),legend.position=c(0.66, 0.2),axis.title.x=element_blank(),text = element_text(size=12, family="LM Roman 10"),panel.background = element_blank(),panel.grid.major.x = element_line(colour = "grey", size = 0.1),panel.grid.minor.x = element_blank(),panel.grid.major.y = element_line(colour = "grey", size = 0.1),panel.grid.minor.y = element_line(colour = "grey", size = 0.05),panel.border = element_rect(colour = "grey", fill=NA), legend.key.width = unit(2,"mm"), legend.key = element_blank(), legend.title = element_blank())+guides(colour = guide_legend(ncol=3))

ggsave(filename = "gpt3T1com_col_ES.png", plot = plot1 ,path = directory, height = 70, width = 120, units = "mm")


sdf <- subset(df9b,Group.1 == "GPT-3A-T1" | Group.1 == "GPT-3B-T1" | Group.1 == "GPT-3C-T1" | Group.1 == "GPT-3D-T1")

plot1 <- ggplot(sdf,aes(x=Group.2,y=accuracies,group=Group.1,color=factor(Group.1)))+
geom_line()+geom_point()+scale_color_manual("", values=lgtbVRAINPalette)+ylab("Average Accuracies (%)")+ylim(0,100)+theme(legend.text = element_text(size = 9),legend.position=c(0.655, 0.8),axis.title.x=element_blank(),text = element_text(size=12, family="LM Roman 10"),panel.background = element_blank(),panel.grid.major.x = element_line(colour = "grey", size = 0.1),panel.grid.minor.x = element_blank(),panel.grid.major.y = element_line(colour = "grey", size = 0.1),panel.grid.minor.y = element_line(colour = "grey", size = 0.05),panel.border = element_rect(colour = "grey", fill=NA), legend.key.width = unit(2,"mm"), legend.key = element_blank(), legend.title = element_blank())+guides(colour = guide_legend(ncol=3))

ggsave(filename = "gpt3T1complexities_col_ES.png", plot = plot1 ,path = directory, height = 70, width = 120, units = "mm")


lgtbVRAINPalette <- c("#55CDFC","#F7A8B8","#FF0018","#FF8C00","#008026","#004DFF","#750787","#FFED00","#0F8698")
