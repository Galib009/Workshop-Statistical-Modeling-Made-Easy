
#install.packages("survival")
#install.packages("survminer")
#install.packages("haven")

# Load required packages
library(survival)
library(survminer)
library(dplyr)
library(haven)

# Import the dataset and have a look at it

uis <- read_dta("https://stats.idre.ucla.edu/stat/data/uis.dta")


View(uis)
# Change data labels
uis$treat <- factor(uis$treat, 
                    levels = c("0", "1"), 
                    labels = c("Short program", "Long program"))
uis$site <- factor(uis$site, 
                   levels = c("0", "1"), 
                   labels = c("Site-A", "Site-B"))
uis$herco <- factor(uis$herco, 
                    levels = c("1", "2", "3"), 
                    labels = c("Both", "Heroin or cocaine", "None"))

View(uis)


# Fit survival data using the Kaplan-Meier method
surv_object <- Surv(time = uis$time, event = uis$censor)
surv_object

View(surv_object)

# Examine prdictive value of treatment status
fit1 <- survfit(surv_object ~ treat, data = uis)
summary(fit1)

ggsurvplot(fit1, data = uis, pval = TRUE)


# Examine prdictive value of two different site status
fit2 <- survfit(surv_object ~ site, data = uis)
ggsurvplot(fit2, data = uis, pval = TRUE)

# Examine prdictive value of heroin or cocaine status
fit3 <- survfit(surv_object ~ herco, data = uis)
ggsurvplot(fit3, data = uis, pval = TRUE)


# Fit a Cox proportional hazards model
fit.coxph <- coxph(surv_object ~ age + ndrugtx + treat + site, 
                   data = uis)
ggforest(fit.coxph,fontsize = .8, data = uis)



# Cox Proportional Hazards Models

fit <- coxph(Surv(time, censor) ~ age + ndrugtx + treat + site, data = uis)
summary(fit)

# Test the proportional hazards assumption using the Schoenfeld residuals
check_PH <- cox.zph(fit, transform = "km")
check_PH