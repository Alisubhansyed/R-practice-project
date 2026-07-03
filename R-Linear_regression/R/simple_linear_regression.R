dataset= read.csv("Salary_Data.csv")

install.packages("caTools")
library("caTools")

set.seed(123)
split= sample.split(dataset$Salary, SplitRatio= 0.66)
train_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

regressor= lm(Salary~YearsExperience, data=train_set)


y_predict = predict(regressor, test_set)



install.packages("ggplot2")
library("ggplot2")

ggplot()+
  geom_point(aes(x=train_set$YearsExperience, y= train_set$Salary), 
             colour="red")+
  geom_line(aes(x=train_set$YearsExperience, y= predict(regressor,newdata= train_set)), 
           colour="blue")+
  ggtitle("Salary vs yeears in experience (training data)")+
  xlab("yeasrs")+ylab("salary")






ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), 
             colour = "red") +
  geom_line(aes(x = train_set$YearsExperience, y = predict(regressor, newdata = train_set)), 
            colour = "blue") +
  ggtitle("Salary vs Years of Experience (Testing Data)") + 
  ylab("Salary") +
  xlab("Years of Experience")












