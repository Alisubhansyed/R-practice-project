dataset = read.csv('50_Startups.csv')


library("caTools")

dataset$State = factor(dataset$State,levels = c("New York", "California", "Florida"), labels=c(1,2,3) )
set.seed(123)

split =sample.split(dataset, SplitRatio = 0.8 )
train_set = subset(dataset, split==TRUE)
test_set  = subset(dataset, split==FALSE)

regressor = lm(formula=(Profit~.),data = train_set)
y_pre=predict(regressor, newdata = test_set)

regressor_opt = lm(formula=(Profit~R.D.Spend),data = train_set)
y_pre_opt=predict(regressor_opt, newdata = test_set)


regressor = lm(formula=(Profit~R.D.Spend+Administration+Marketing.Spend+State),data = dataset)
summary(regressor)



regressor = lm(formula=(Profit~R.D.Spend+Marketing.Spend),data = dataset)
summary(regressor)


regressor = lm(formula=(Profit~R.D.Spend),data = dataset)
summary(regressor)









