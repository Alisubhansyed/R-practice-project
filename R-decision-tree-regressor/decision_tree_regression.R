dataset= read.csv('Position_Salaries.csv')
dataset= dataset[2:3]
install.packages('rpart')
library(rpart)
install.packages('rpart.plot')
library("rpart.plot")
install.packages('ggplot2')
library(ggplot2)

X = dataset[1]
y = dataset[2]

regressor = rpart(Salary~., data= dataset, control= rpart.control(minsplit = 1))
y_predict= predict(regressor, newdata = data.frame(Level=6.5))

# Plot the decision tree
rpart.plot(regressor, type = 1, digits = 2, fallen.leaves = TRUE)
x_grid= seq(min(dataset$Level), max(dataset$Level), 0.1)

ggplot()+
  geom_point(aes(dataset$Level, dataset$Salary), colour="red")+
  geom_line(aes(x=x_grid, y=predict(regressor, newdata = data.frame(Level=x_grid))), colour="blue")+
  ggtitle("Regressor by Decision tree")+
  xlab("Level")+
  ylab("Salary")
  