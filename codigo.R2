datos = read.csv(file.choose(),sep=";",header=T )
x <- model.matrix(Y.house.price.of.unit.area~., data = datos)[, -1]
head(x)
y <- datos$Y.house.price.of.unit.area

library(glmnet)
grid=10^seq(0.47712,-1, length =30)
ridge.mod=glmnet (x,y,alpha=0, lambda=grid, standardize=FALSE)

dim(coef(ridge.mod)) #dimensiones de la matriz de ridge

ridge.mod$lambda []


cvfit = cv.glmnet(x, y,type.measure="mse")
plot(cvfit)

predict (ridge.mod ,type='coefficients') [1:8,]
print(ridge.mod)

set.seed(1)
train=sample (1: nrow(x), nrow(x)/2)
test=(-train)
y.test=y[test]

ridge.mod=glmnet(x[train ,],y[ train],alpha=0, lambda =grid ,
                 thresh =1e-12)
ridge.pred=predict (ridge.mod , newx=x[test ,])
mean((ridge.pred -y.test)^2)
