
dataset = read.csv("Social_Network_Ads.csv")
X=dataset[, 1:2]
y= dataset[3]
install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
traing_set = subset(dataset, split==TRUE)
testing_set = subset(dataset, split==FALSE)
traing_set[,1:2]= scale(traing_set[, 1:2])
testing_set[,1:2]= scale(testing_set[, 1:2])
install.packages("class")

library(class)





y_predict =knn(train=traing_set[, -3],  test=testing_set[,-3], cl=traing_set[, 3], k=5 )





cm = table(Predicted = y_predict,Actual =  testing_set[,3] )


