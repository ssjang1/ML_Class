# 잔차제곱합 == PRESS잔차
# PRESS/ 잔차의 표준편차 => 표준화잔차
# PRESS/ 잔차의 표준오차 => student 잔차
# 회귀분석과 전제조건
 # 정규성 : 가설검정으로 구성
 # (귀무가설은 기울기가 0이다.), 대립가설은 기울기가 0이 아니다.
 # 선형성 : 일반화( 비선형 -> 과적합)
 # 독립성 : 자기상관성, 다중공선성이 없어야한다.
 # 등분산성 : 잔차가 어느 지점에서나 분산이 일치해야 한다.
 # =>잔차가 커지면 예측이 불확실하게 된다.
# 모델을 평가
 # 분산은 카이제곱분포를 따른다. ( 회귀제곱합이나 잔차제곱합은 분산과 의미가 같다.)
 # 모델이 유용한가 : F통계량 ( 평균비 -> F분포를 따른다.)
 # 모델이 설명력이 있는가, R^2
 # 계수가 유의미한가, 계수의 t통계량 ( 표준오차로 나눈 것 )
 # 잘 fitting하고 있는가 : 잔차 그래프

# 다항회귀
y<-c(1,2,3,8,5,3,10,7)
x1<-c(2,4,5,6,8,10,11,13)
x2<-c(1,2,2,4,4,4,6,6)

opar=par(mfrow=c(1,1))
plot(x1,y)
plot(x2,y)
plot(x1,x2)
plot(x1+x2,y)
#lm : linear model
summary(lm(y~x1))
summary(lm(y~x2))
summary(lm(y~x1+x2))
# 기울기가 의미하는 것: 종속변수에 대한 영향력
yhat = -1.1566*x1+3.7267*x2-0.1041


a<-sum((yhat-mean(y))^2) # 회귀제곱합 
b<-sum(PRESS) # 잔차제곱합

a/(a+b) # 결정계수 R^2 #0.9532009 

PRESS<- (y-yhat)^2 # 잔차제곱 

# 잔차의 표준편차 : sd(PRESS)
PRESS/sd(PRESS) #표준화잔차



str(women)
fit=lm(weight~height,data=women)
summary(fit)
(women.fitted_weight=-87.52+3.45*women$height)
residuals<-women$weight - women.fitted_weight
min(residuals)
max(residuals)
quantile(residuals,0.75)
quantile(residuals,0.25)

# IQR 구하기
quantile(residuals,0.75)-quantile(residuals,0.25)

plot(weight ~ height, data=women)
abline(fit,col="blue")
# 회귀분석의 정당성 부여하는 것 ( 상관계수 )
cor(women$weight,women$height) # 0.9954948

# 모델이 통계적으로 유의미한가
# F 통계량 : F-statistic:  1433 on 1 and 13 DF,  p-value: 1.091e-14

# 계수의 유의미
# t-value 37.85 p-value: 1.09e-14 유의미하다

# 모형의 설명력
# R^2 ( 결정계수 ) = 0.9903 우수하다.

# 데이터에 적용된 선형회귀는 적절한가
cor(women$weight,women$height) # 0.9954948 # 상관계수 확인

cars
res_lm=lm(dist~speed,data=cars)
summary(fit)

# 모델이 통계적으로 유의미한가? (F통계량)
# F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12 # 유의미하다

# 계수가 유의미한가? (t value)
# t-value: 9.464 p-value : 1.49e-12 #유의미하다.

# 모델의 설명력 (결정계수)
# 결정계수 R^2 , Adjusted R-squared:  0.6438 보통이상

# 데이터에 적용된 선형회귀는 적절한가
cor(cars$speed,cars$dist) #0.8068949 적절하다.

yhat <- -17.5791+3.9324*cars$speed
plot(cars$speed,cars$dist)
abline(res_lm)

names(res_lm)
res_lm$coefficients
(cof=coef(res_lm)) # 계수
(dist_pred=cof["(Intercept)"]+cof["speed"]*cars$speed)
plot(cars$speed,cars$dist,xlab="속도",ylab="정지거리",xlim=c(0,30),ylim=c(0,125))
abline(coef(res_lm),col=2)
res_lm$fitted.values # 모델에서 사용한 데이터에 대해서 예측값
cars$dist-res_lm$fitted.values # 잔차
fitted(res_lm)[1:4]
res_lm$residuals
residuals(res_lm)[1:4]
RSS<- sum((fitted(res_lm)-cars$dist)^2) # 잔차제곱합
var(residuals(res_lm))
sd(residuals(res_lm))
(standard_res<-RSS/sd(residuals(res_lm)))#표준화잔차
(student_res<-standard_res/sqrt(length(cars$dist))) #표준오차로 나눠주면 student 잔차
# 정규성,독립성,등분산성,선형성 -> 잔차를 통해 확인
plot(res_lm)
# Fitted values : 예측치 ( speed -> dist) 와 Residuals와의 관계
# Normal Q-Q
# Scale-Location : 분포의 일정한 정도를 확인
# Residuals(잔차) vs Leverage : 값의 차이가 있음
# Leverage 는 종속변수가 이상치인 경우
# 이상치: 하나의 변수에서 찾았는데, 두 개의 변수를 대상으로 하니 
# 이상치가 종속변수,독립변수에서 나올 수 있음
# Leverage는 종속변수에서 이상치 나올 때

par(mfrow=c(2,2))
plot(res_lm)

par(mfrow=c(1,1))

#install.packages("lmtest")
library(lmtest)
bptest(cars$speed~cars$dist) # 등분산성 테스트
# bptest의 귀무가설: 등분산이다.

# 자기상관성
dwtest(res_lm)
# 2 : 자기상관성이 없다.
# 0~2 : 0이면 높은 양의 자기 상관관계
# 4에 가까우면 음의 자기 상관관계

predict(res_lm,newdata=data.frame(speed=10)) # 21.74499 (점추정)
predict(res_lm,newdata=data.frame(speed=10),interval="confidence") # 구간추정
# 문제 4.0,25.0,.21일때 제동거리 예측
predict(res_lm,newdata=data.frame(speed=4),interval="confidence")
predict(res_lm,newdata=data.frame(speed=25),interval="confidence")
predict(res_lm,newdata=data.frame(speed=.21),interval="confidence")


#문제 MASS패키지에 Boston 데이터에 대하여 회귀모델을 구축해보시오

#(내가한것)

library(MASS)
data("Boston")
str(Boston)
# medv가 종속변수, 독립변수가 13개

fit <- lm(Boston$medv ~ ., data = Boston)
cof<-coef(fit)
par(mfrow=c(4,4))
plot(medv ~.,data=Boston)
summary(fit)
# 모델이 유의미한가? 유의미미 F-statistic: 108.1 on 13 and 492 DF,  p-value: < 2.2e-16 
# 모델의 설명성 : 결정계수 :Adjusted R-squared:  0.7338
# 계수의 유의미 : 
# indus  t-value: 0.334  p-value: 0.738288
#   age  t-value: 0.052  p-value: 0.958229 
# indus, age의 계수는 무의미하다. 
# 종속변수와 독립변수 사이의 선형성
cor(Boston$medv,Boston[,-14]) # chas의 상관계수가 0.1752602로 상관계수의 절대값이 가장 작다.
# 그 다음 dis 0.2499287, black 0.3334608, crim -0.3883046
head(Boston)
testd<-Boston[,c(-3,-7)]
fit2<-lm(medv~., data=testd)
summary(fit2)
# 계수의 p-value가 0.05보다 큰 것이 없다. 
# Adjusted R-squared:  0.7348
# F-statistic: 128.2 on 11 and 494 DF,  p-value: < 2.2e-16
cor(Boston$medv,Boston[,c(-3,-7,-14)]) # chas의 상관계수 : 0.1752602

#(선생님이 한 것)
# 정규화 : 독립변수가 종속변수에 미치는 영향을 균등하게 하기 위해서
# 정규화를 하지 않으면 가중치를 부여한 효과가 있다.
# 독립변수의 척도가 크면 중요한 변수가 된다.

class(scale(Boston))
boston_df<-as.data.frame(scale(Boston))
head(boston_df,3)
nrow(Boston)
dim(Boston) # 506 x 14
# 분석을 할 때는 모델을 만드는 것과 테스트를 하는 데이터를 나눔
# 모든 데이터에 대해서 분석하면 과적합이 벌어질 수 있다.
# 학습데이터 / 테스트 데이터 분리
set.seed(123)
idx<-sample(1:nrow(boston_df),300)
trainDF<-boston_df[idx,]
testDF<-boston_df[-idx,]
dim(testDF)

# dist는 범주형데이터여서 제외시켰음
formula<-medv ~ crim+zn+indus+nox+rm+age+dis+rad+tax+ptratio+black+lstat
lm_model <- lm(formula=formula,data=trainDF)
lm_model
lm_model$fitted.values[1:5] # 예측값
lm_model$residuals[1:5] # 잔차
summary(lm_model)

# 예측
pred <-predict(lm_model,testDF) # 예측치
# 회귀의 평가 : 연속형 데이터 (비율, 구간)
# 상관계수를 이용해서 평가한다.
# 테스트 데이터 평가가 # epsilon 상수 
cor(pred,testDF$medv) #0.8425242

# 학습데이터 평가 0.8643488
pred2<-predict(lm_model,trainDF)
cor(pred2,trainDF$medv) # 학습데이터의 모델이 과적합되었다.

# 모델은 일반화 (어떤 데이터에도 강건하게 예측)

dwtest(lm_model) # Durbin-Watson 통계량
# 귀무가설: 자기상관없이 없다.
# p-value = 0.3214 귀무가설을 기각할 수 없으므로 자기상관성이 없다.

# 다중공선성 검사
library(car)
sqrt(vif(lm_model))>2 
cor(trainDF[c("nox","tax","dis","rad")])
# tax:rad , nox:dis

boston_cor<-cor(trainDF)
library(corrplot)
corrplot(boston_cor,method="square")
# tax와 nox 제거 
formula <-medv ~ crim+zn+indus+rm+age+dis+rad+ptratio+black+lstat
lm_model<-lm(formula=formula,data=trainDF)
pred<-predict(lm_model,testDF) # scale을 해줘서 
cor(pred,testDF$medv)
# scale된 예측값을 원래의 값으로 복원하는 법 
pred*sd(Boston$medv)+mean(Boston$medv)

# 회귀분석하기
wine<-read.csv("c:/Users/401-14/Documents/whitewines.csv")
wines<-as.data.frame(scale(wine))
head(wines)
dim(wine)
random<-sample(1:nrow(wines),3500)
training<-wines[random,]
testing<-wines[-random,]
lm_model<-lm(quality~., data=training)
lm_model$fitted.values
summary(lm_model)
pred<-predict(lm_model,testing)
cor(pred,testing$quality) #0.5282926

dwtest(lm_model) # 자기상관성
sqrt(vif(lm_model))>2 # 다중공선성 
#  residual.sugar, alcohol
cor(training[c("residual.sugar","alcohol")])

pred*sd(wine$quality)+mean(wine$quality)

#### 로지스틱 선형회귀를 해야되는 것 같아서 gpt에 물어봐서 해봄
library(nnet)

# 데이터 준비
idx <- 1:3700
training_wine <- wine[idx,]
testing_wine <- wine[-idx,]

# 범주형 변수를 더미 변수로 변환
training_wine <- model.matrix(~ ., data = training_wine)
testing_wine <- model.matrix(~ ., data = testing_wine)

# 데이터 프레임으로 변환
training_wine_df <- as.data.frame(training_wine)
testing_wine_df <- as.data.frame(testing_wine)

# 다항 로지스틱 회귀 모델 학습
model <- multinom(quality ~ ., data = training_wine_df, family = "multinomial")
wine
# 예측 및 평가
predictions <- predict(model, testing_wine_df)

chisq.test(table(predictions, testing_wine_df$quality))
library(gmodels)
CrossTable(predictions,testing_wine_df$quality,expected=T) 
#카이제곱 approximation은 정확하지 않을수도 있습니다
fisher.test(predictions, testing_wine_df$quality, alternative="two.sided", simulate.p.value=TRUE)
#=>p-value = 0.0004998 피셔테스트 검정결과 예측치와 테스트값은 상호 관련성이 있다.


# 선생님 답
unique(wine$quality) # 범주형
idx=1:3700
training_wine=wine[idx,]
testing_wine=wine[-idx,]
dim(training_wine)

# 독립변수에 범주형 데이터가 있으면 (3개이상의 범주형 변수가 있으면 NA)
# factor형으로 변경
lm_model<-lm(quality~.,data=training_wine)
pred2<-predict(lm_model,testing_wine)
pred3<-predict(lm_model,training_wine)

# mtcars 데이터에 대하여 선형회귀모델 생성하기
str(mtcars)
?mtcars
nrow(mtcars)

# 종속변수 : mpg(연비)
random<-sample(1:nrow(mtcars),23)
train_car<-mtcars[random,]
test_car<-mtcars[-random,]
lm_car<-lm(mpg~.,data=train_car[c(-2,-8,-9,-10,-11)])
summary(lm_car)
pred<-predict(lm_car,test_car)
cor(test_car$mpg,pred) # 0.9524875
dwtest(lm_car) # 자기상관성
sqrt(vif(lm_car))>2 # 다중공선성 
str(mtcars)

## 선생님 답
sapply(mtcars,function(x) sum(is.na(x)))
library(psych)
pairs.panels(mtcars)
mydata<-mtcars
mydata$vs<-ifelse(mydata$vs==0,"브이","직선")
mydata$am<-ifelse(mydata$am==0,"자동","수동")
mydata$cyl<-as.factor(mydata$cyl)
mydata$vs<-as.factor(mydata$vs)
mydata$am<-as.factor(mydata$am)
mydata$gear<-as.factor(mydata$gear)
mydata$carb<-as.factor(mydata$carb)
unique(mydata$cyl) # Levels: 4 6 8
unique(mydata$vs)  # Levels: 브이 직선
unique(mydata$am)  # Levels: 수동 자동
unique(mydata$gear)# Levels: 3 4 5
unique(mydata$carb)# Levels: 1 2 3 4 6 8
colnames(mydata)

mt_sc<-as.data.frame(scale(mydata[-c(2,8,9,10,11)]))
mydata<-cbind(mt_sc,mydata[c(2,8,9,10,11)])
head(mydata)

#데이터분할
idx<- sample(1:nrow(mydata),0.7*nrow(mydata))
length(idx)
train_data=mydata[idx,]
test_data=mydata[-idx,]
dim(train_data)
dim(test_data)

# formula 생성
(vari<-colnames(mydata))
(form<-as.formula(paste(vari[1],paste(vari[-1],collapse="+"),sep="~")))
fit<-lm(form,data=mydata)
summary(fit)

coefficients(fit)
residuals(fit)

layout(matrix(c(1,2,3,4),2,2))
plot(fit)
pred<-predict(fit,test_data[-1])
pred2<-predict(fit,train_data[-1])
cor(pred,test_data$mpg) # 0.99081
cor(pred2,train_data$mpg)# 0.9471289 # 과소적합 

step(fit,direction="both") # "backward" 후진선택법, "forward" 전진선택법
# both 단계적 선택법
form<-as.formula("mpg ~ cyl+hp+wt+am")
fit<-lm(form,data=mydata)
pred<-predict(fit,test_data[-1])
pred2<-predict(fit,train_data[-1])
cor(pred,test_data$mpg) 
cor(pred2,train_data$mpg)
