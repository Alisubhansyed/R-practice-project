dataset= read.csv('Position_Salaries.csv')
dataset= dataset[2:3]
X = dataset[1]
y = dataset[2]
install.packages('randomForest')
library(randomForest)

set.seed(123)

regressor = randomForest(x=X,y=dataset$Salary , ntree = 100)
y_predict= predict(regressor, newdata = data.frame(Level=6.5))



install.packages('ggplot2')
library(ggplot2)
x_grid= seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot()+
  geom_point(aes(dataset$Level, dataset$Salary), colour="red")+
  geom_line(aes(x=x_grid, y=predict(regressor, newdata = data.frame(Level=x_grid))), colour="blue")+
  ggtitle("Regressor by Random forest")+
  xlab("Level")+
  ylab("Salary")
