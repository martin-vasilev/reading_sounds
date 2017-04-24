
source("functions/settings.R")
library(metafor)
# reading comprehension:
m1<- metagen(TE =g,seTE = sqrt(g_var), sm = "SMD",data=subset(data, is.element(task, RC) & measure!="reading_speed"),
             comb.random = T, level = 0.95, method.tau = "REML")

metabias(m1, method.bias='linreg')
c1<- copas(m1)


library(meta)
res <- rma(g, g_var, data=subset(data, is.element(task, RC) & measure!="reading_speed"), method="REML")

# reading comprehension:
m2<- metagen(TE =g,seTE = sqrt(g_var), sm = "SMD",data=subset(data, is.element(task, RC) & measure=="reading_speed"),
             comb.random = T, level = 0.95, method.tau = "REML")

metabias(m2, method.bias='linreg')
trimfill.meta(m1)

