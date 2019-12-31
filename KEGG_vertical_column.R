library(stringr)
library(ggplot2)
library(Cairo)

rm(list=ls())
setwd("/Users/apple/Desktop/")
GO_BP <- read.table("./cc.csv",header = T,sep=",")

# GO_BP$Term <- sapply(str_split(GO_BP$Term, "~"), "[", "2")

png_path="./GO_BP.png"
CairoPNG(png_path, width = 12, height = 7, units="in", dpi=600)

ggplot(data=GO_BP)+
    geom_bar(aes(x=reorder(Term,Count),y=Count, fill=-log10(PValue)), stat='identity') + 
    coord_flip() +
    scale_fill_gradient(expression(-log["10"](P.value)),low="red", high = "blue") +
    xlab("") +
    ylab("Gene count") +
    scale_y_continuous(expand=c(0, 0))+
    theme(
        axis.text.x=element_text(color="black",size=rel(0.6)),
        axis.text.y=element_text(color="black", size=rel(0.6)),
        axis.title.x = element_text(color="black", size=rel(0.6)),
        legend.text=element_text(color="black",size=rel(0.6)),
        legend.title = element_text(color="black",size=rel(0.6))
        # legend.position=c(0,1),legend.justification=c(-1,0)
        # legend.position="top",
    )
dev.off()
