if (!require("devtools")) {
  install.packages("devtools")
}

devtools::install_github("b0rxa/scmamp")

library(scmamp)
library(ggplot2)
library(grid)

data.auc <- data.frame(
  #c=c("CM1","KC1","KC3","MC2","MW1","PC1","PC2","PC3","PC4"),
  ORI = c(0.488,0.535,0.516,0.531,0.512,0.640,0.537,0.718,0.752),
  ROS = c(0.821,0.764,0.820,0.762,0.954,0.853,0.956,0.762,0.875),
  RWO = c(0.926,0.915,0.581,0.742,0.933,0.951,0.994,0.946,0.946),
  stringsAsFactors = FALSE
)

plotDensities (data=data.auc, size=1.1)
qqplot <- qqplotGaussian (data.auc[,"ORI"], size=5 , col="orchid")
qqplot + theme_classic()

friedmanTest(data.auc)
test <- nemenyiTest (data.auc, alpha=0.05)
test
test$diff.matrix
abs(test$diff.matrix) > test$statistic
plotCD (data.auc, alpha=0.05, cex=1.25)
