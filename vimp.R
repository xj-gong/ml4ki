library(survival)
library(randomForestSRC)
library(survminer)


# =====  RSF and VIMP  ========
load("./hypertension_data.RData")

rfc.model <- rfsrc(Surv(time, status) ~ ., splitrule='logrank', data = dat4rf, ntree = 200, nsplit=10)
vimps <- vimp(rfc.model);

# --- Figure 2a:  Plot variable importance by VIMP ----
vimps.tmp <- vimps
vimps <- vimps.tmp$importance
tmp1<-sort(vimps, decreasing=T)

# Top 
nvar1 <- 25
df1 <- data.frame(vars=names(tmp1)[1:nvar1], vimp=tmp1[1:nvar1], stringsAsFactors = F)
p1<-ggplot(data=df1, aes(x=reorder(vars, vimp), y=vimp))  +
  geom_bar(stat="identity", fill=colorRampPalette(c('gray70','gray20'))(nvar1), width=0.6) 
p1 + coord_flip() +labs(x='',y='Variable importance') +theme(axis.ticks=element_blank())


# --- Figure 2b:  Hypertension probability: stratified by VEGFR2, JAK inhibition----
varr= dat4rf$VEGFR2
dat4rf$cuts <- cut(varr, c(min(varr)-.01,median(varr),max(varr)))

fit <- survfit(Surv(time, status) ~ cuts ,data = dat4rf)

ggsurvplot(fit, 
           legend = c(0.7,0.2), 
           legend.title = "",
           legend.labs = c("lower inhibition","higher inhibition"),
           palette = c("#E7B800", "#2E9FDF"), 
           conf.int = TRUE, 
           pval = FALSE, 
           pval.method = FALSE,
           pval.size=4,
           title ="VEGFR2",
           font.x =  10,
           font.y = 10,
           xlab='Time after treatment (day)',
           ylab="Probability of no hypertension",
           xlim=c(0,500),
           ylim=c(0.25,1)
)


