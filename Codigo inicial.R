#Carga de data
library(readxl)
data <- read_excel("Ubicacion del archvi.xlsx")  
View(data)

##############################
# Relaciones entre variables #
##############################

cor.test()

#Matriz de Dispersión, Histograma y Correlación de la Data
library(psych) 
pairs.panels(data, pch=21,main="Matriz de Dispersión, Histograma y Correlación")   #Con esto podemo determinar si las variables
                                                                                   #tiene correlacion entre ellas.
#########################
# Red neuronal profunda #
#########################

library(deepnet)

for (i in 1:k) {
  x_train_cv<-data[folds[[i]],1:97]
  y_train_cv<-data[folds[[i]],98]
  
  set.seed(rand_seed)
  fit_cv<-nn.train(x=x_train_cv,
                   y=y_train_cv,
                   hidden = c(3,2),
                   activationfun = "tanh",
                   momentum = 0.15,
                   learningrate = 0.85,
                   numepochs = 200,
                   batchsize =100,
                   output="linear")
  
  pred_cv<-nn.predict(fit_cv,x_train_cv)
  cv_error[i]=cor(pred_cv,y_train_cv)^2
}










