# R Code
# Import Libraries
library(caret)
library(dplyr)
library(pROC)
library(ROCR)

credit1 = read.csv("creditcard.csv")
str(credit1)
summary(credit1)

missing = credit1 %>% summarise_all(funs(sum(is.na(.))/n()))
missing

# Let's remove the ID variable it is not needed
credit=credit1[,-1]

# There are some categories with very few observations. Let's group them together.
credit$EDUCATION[credit$EDUCATION == 0] = 4
credit$EDUCATION[credit$EDUCATION == 5] = 4
credit$EDUCATION[credit$EDUCATION == 6] = 4
credit$MARRIAGE[credit$MARRIAGE == 0] = 3

# Make some numeric variables into factors
credit$default.payment.next.month=as.factor(credit$default.payment.next.month)
credit$SEX=as.factor(credit$SEX) 
credit$EDUCATION=as.factor(credit$EDUCATION)
credit$MARRIAGE=as.factor(credit$MARRIAGE)

# Logistic model
logit.1 = glm(default.payment.next.month~., data=credit, family="binomial")
summary(logit.1)

pred = predict(logit.1, type = "response", credit)
summary(pred)

# ROC and AUC
glm.roc = roc(response = credit$default.payment.next.month, predictor = pred)
plot(glm.roc, legacy.axes = TRUE, print.auc.y = 1.0, print.auc = TRUE)
coords(glm.roc, "best", "threshold")

# Threshold = 0.5
pred_default = factor(ifelse(pred >=0.5, "Yes", "No"))
credit$default.payment.next.month = factor(ifelse(credit$default.payment.next.month==1, "Yes","No"))
confusionMatrix(pred_default, credit$default.payment.next.month, positive = "Yes")

glm.roc2 = prediction(pred, credit$default.payment.next.month)
glm.roc2a = performance(glm.roc2, "tpr", "fpr")

plot(glm.roc2a, colorize=TRUE, print.cutoffs.at=seq(0,1,by=0.1), text.adj=c(-0.2,1.7))

## Cut-off point seems to be better between 0.2 and 0.3 than in 0.5
