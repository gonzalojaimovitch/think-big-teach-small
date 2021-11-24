    setwd("COMPLETE")

    data <- read.csv(file = "COMPLETE",sep=";")

    data$Batch <- factor(data$Batch, levels = c('WS','AS I','AS II'))

    #+++++++++++++++++++++++++
    # Function to calculate the mean and the standard deviation
    # for each group
    #+++++++++++++++++++++++++
    # data : a data frame
    # varname : the name of a column containing the variable
    #to be summariezed
    # groupnames : vector of column names to be used as
    # grouping variables
    data_summary <- function(data, varname, groupnames){
        require(plyr)
        summary_func <- function(x, col){
            c(mean = mean(x[[col]], na.rm=TRUE),
              sd = sd(x[[col]], na.rm=TRUE))
        }
        data_sum<-ddply(data, groupnames, .fun=summary_func,
                        varname)
        data_sum <- rename(data_sum, c("mean" = varname))
        return(data_sum)
    }

    df2 <- data_summary(data, varname="Accuracy",
                        groupnames=c("Concept", "Batch"))

    library(ggplot2)
    # Default bar plot
    p<- ggplot(df2, aes(x=Concept, y=Accuracy, fill=Batch)) +
        geom_bar(stat="identity", color="black",
                 position=position_dodge()) +
        geom_errorbar(aes(ymin=Accuracy-sd, ymax=Accuracy+sd), width=.2,
                      position=position_dodge(.9))+
        scale_y_continuous(limits=c(0,1))
    print(p)

    ggsave(filename = "test.png", plot = p ,path = "COMPLETE", height = 70, width = 120, units = "mm")
