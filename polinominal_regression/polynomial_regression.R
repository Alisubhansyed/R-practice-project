dataset = read.csv("Position_Salaries.csv")
dataset = dataset[ 2:3]
# install.packages("catools")
# library("caTools")
# set.seed(123)
# 
# split= sample.split(dataset$Salary,SplitRatio = 0.8)
# training_set= subset(dataset, split==TRUE)
# test_set= subset(dataset, split==FALSE)



lin_reg= lm(formula= Salary~., data=dataset)


dataset$Level2=dataset$Level^2
dataset$Level3=dataset$Level^3
poly_reg= lm(formula= Salary~., data=dataset)
summary(poly_reg)
library("ggplot2")

ggplot()+
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             colour="red")+
  geom_line(aes(x= dataset$Level, y=predict(lin_reg,newdata=dataset)),
            colour="blue")+
  ggtitle("Truth or Bluff(linear regression)")+
  xlab("Level")+
  ylab("Salary")





ggplot()+
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             colour="red")+
  geom_line(aes(x= dataset$Level, y=predict(poly_reg,newdata=dataset)),
            colour="blue")+
  ggtitle("Truth or Bluff(Polynomial regression)")+
  xlab("Level")+
  ylab("Salary")


# 1. Create a uniform sequence for the main independent variable
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)

# 2. Generate the polynomial terms based on the main sequence
grid_data = data.frame(
  Level  = x_grid,
  Level2 = x_grid^2,
  Level3 = x_grid^3
)
ggplot()+
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             colour="red")+
  geom_line(aes(x= x_grid, y=predict(poly_reg,newdata=data.frame(Lavel=x_grid,Lavel2=x_grid2, Lavel3=x_grid3 ))),
            colour="blue")+
  ggtitle("Truth or Bluff(Polynomial regression)")+
  xlab("Level")+
  ylab("Salary")




y_predict=predict(lin_reg, newdata = data.frame(Level=6.5))

y_predict_ploynominal=predict(poly_reg, newdata = data.frame(Level=6.5,Level2=6.5^2))

y_predict_ploynominal3=predict(poly_reg, newdata = data.frame(Level=6.5,Level2=6.5^2, Level3=6.5^3))




  
  


