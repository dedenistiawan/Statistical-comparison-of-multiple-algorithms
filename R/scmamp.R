#Install library scmamp
if (!require("devtools")) {
  install.packages("devtools")
}
devtools::install_github("b0rxa/scmamp")

library(scmamp)
data(data_blum_2015)
data(data_gh_2008)

library(ggplot2)
plotDensities (data=data.gh.2008, size=1.1)
qqplot <- qqplotGaussian (data.gh.2008[,"k-NN(k=1)"], size=5 , col="orchid")
qqplot + theme_classic()

#Testing for differences
friedmanTest(data.gh.2008)
imanDavenportTest(data.gh.2008)
friedmanAlignedRanksTest(data.gh.2008)
quadeTest(data.gh.2008)

#Pairwise differences
#Nemenyi post hoc test
test <- nemenyiTest (data.gh.2008, alpha=0.05)
test
test$diff.matrix
abs(test$diff.matrix) > test$statistic
plotCD (data.gh.2008, alpha=0.05, cex=1.25)
plotCD (data.gh.2008, alpha=0.01, cex=1.25)

friedmanPost(data=data.gh.2008, control=NULL)
quadePost(data=data.gh.2008, control=NULL)
pv.matrix <- friedmanAlignedRanksPost(data=data.gh.2008, control=NULL)
pv.matrix
adjustShaffer(pv.matrix)
pv.adj <- adjustBergmannHommel(pv.matrix)
pv.adj

#Graphical representations
plt <- plotPvalues(pvalue.matrix=pv.adj,
                   alg.order=order(r.means, decreasing=FALSE))
library(reshape2)
plt +
  labs(title="Corrected p-values using Bergmann and Hommel procedure") + 
  scale_fill_gradientn("Corrected p-values" , colours = c("skyblue4" , "orange"))

