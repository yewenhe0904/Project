library(shiny)
library(caret)
library(randomForest)
library(e1071)
data(iris)
modelfit<-train(Species~.,methods='gbm',data=iris)

shinyServer(
     function(input,output){
             output$result<-renderPrint({
             input_v<-iris[1,]
             input_v[,1]<-input$sepal_l
             input_v[,2]<-input$sepal_w
             input_v[,3]<-input$petal_l
             input_v[,4]<-input$petal_w
             input_v[,5]<-''
             toupper(as.character(predict(modelfit,input_v)))})
     }   
)