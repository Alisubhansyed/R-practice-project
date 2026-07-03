dataset = read.csv("Position_Salaries.csv")
dataset = dataset[ 2:3]

install.packages("e1071")
library("e1071")

regressor=svm(formula=Salary~Level, data=dataset, type="eps-regression" )

ypredict = predict(regressor, newdata = data.frame(Level=6.5))





library("ggplot2")

ggplot()+
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             colour="red")+
  geom_line(aes(x= dataset$Level, y=predict(regressor,newdata=dataset)),
            colour="blue")+
  ggtitle("Truth or Bluff(Svr)")+
  xlab("Level")+
  ylab("Salary")







# 1. Create a uniform sequence for the main independent variable
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)

# 2. Generate the polynomial terms based on the main sequence
grid_data = data.frame(
  Level  = x_grid
)
ggplot()+
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             colour="red")+
  geom_line(aes(x= x_grid, y=predict(regressor,newdata=grid_data)),
            colour="blue")+
  ggtitle("Truth or Bluff(Svr smoother)")+
  xlab("Level")+
  ylab("Salary")







