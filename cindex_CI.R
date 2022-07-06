library(randomForestSRC)
library(survcomp)


# ===== Prediction performance of ML model on patient population data (CV 80% training, 20% testing, 500x) ======
load("./hypertension_data.RData")
  

dat4rf <- dat4rf[complete.cases(dat4rf),]

# Initialization
permn = 500
cindx = rep(0,permn) 

for(i in seq(permn)){

    #Randomly shuffle the data
    samp = sample(nrow(dat4rf))
    
    # partition for CV
    testIndexes = samp[1:round(NROW(dat4rf)*0.8)]
    trainDat = dat4rf[testIndexes, ]
    testDat = dat4rf[-testIndexes, ]
    
    
    # RSF
    rfc.model = rfsrc(Surv(time, status) ~ ., splitrule='logrank', data = trainDat, ntree = 200)
    rfc.pred = predict(rfc.model, testDat[,-1:-2])
    cindx[i] = concordance.index(rfc.pred$predicted, surv.time=testDat$time, 
                                  surv.event=testDat$status, method="noether")$c.index
    
  }


# --- Table 1: 3rd row 'Hypertension' ----
dat1 <- dat4rf[dat4rf$status==1,]

print(paste0("Time to AE onset median [days] (range): ", 
             median(dat1$time), "(", min(dat1$time),", ",max(dat1$time),")"))

print(paste0("C-index (90% confidence interval): ", 
             round(median(cindx),3)," (", round(quantile(cindx,.05),3),", ",round(quantile(cindx,.95),3),")"))