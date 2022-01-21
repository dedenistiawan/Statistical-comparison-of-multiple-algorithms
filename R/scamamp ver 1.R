if (!require("devtools")) {
  install.packages("devtools")
}
devtools::install_github("b0rxa/scmamp")

library(scmamp)
data(data_gh_2008)
head(data.gh.2008)

imanDavenportTest(data.gh.2008)
nm <- nemenyiTest(data.gh.2008)
nm
nm$diff.matrix
plotCD(results.matrix = data.gh.2008, alpha = 0.05)

test.res <- postHocTest(data = data.gh.2008, test = 'friedman', correct = 'bergmann')
test.res
bold <- test.res$corrected.pval < 0.05
bold[is.na(bold)] <- FALSE
writeTabular(table = test.res$corrected.pval, format = 'f', bold = bold,
             hrule = 0, vrule = 0)


