# Decision Trees(의사결정트리)
# binary tree
# rule base로 작동
# 외삽데이터는 예측불가 / 회귀분석 (기울기, 절편: 회귀선)
# 과적합문제 (root -> terminal nodes 까지 가장 깊은 곳까지를 depth)
# 데이터 변수의 입력순서를 변경하면 결과가 바뀌는 현상
# 단점을 변수의 입력순서를 변경하면 결과가 바뀌는 현상
# 단점을 극복하기 위해서 RandomForest (데이터는 랜덤하게 선택하고 모델의 숲을 만들어서 다수결의)

# 100개 중에 50개는 동전의 앞면 50개는 동전의 뒷면
-(50/100) * log2(50/100) #0.5

library(rpart)
library(datasets)

data(iris)
result <- sample(1:nrow(iris),nrow(iris)*0.7)
train<- iris[result,]
test<- iris[-result,]
dim(train)
dim(test)

# 분류문제
formula<-Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width
model<-rpart(formula=formula,data=train) #불순도를 이용해서 정보이득이 있으면 분할
model
pred<-predict(model,test) # 범주별로 확률 -> labeling
pred
cpred<-ifelse(pred[,1]>=0.5,"setosa",ifelse(pred[,2]>=0.5,"versicolor","virginica"))

cpred
(tb=table(cpred,test$Species))
# 정분류율, 오분류율
sum(diag(tb))/nrow(test)
plot(model)
text(model,use.n=T,cex=0.6)
post(model,use.n=T,file="")
#install.packages("rpart.plot")
#install.packages("rattle")
library(rpart.plot)
library(rattle)
prp(model)
rpart.plot(model)
fancyRpartPlot(model)
# 통계학에서는 분산이 큰 변수가 중요한 변수다

# ctree : 범주형데이터를 제외하고 선형분석실행, 입력변수의 레벨이 31개로 제한,
# 스스로 가지치기를 해 가지치기가 불필요
# C5.0: 불순도 척도가 Entropy , 범주형데이터에 대하여 범주수만큼 분리가 발생
# rpart: 지니 인덱스 사용 
#install.packages("party")
library(party)
result<-sample(1:nrow(iris),nrow(iris)*0.7)

table(result)
train<-iris[result,]
test<-iris[-result,]
head(train)
formula<-Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width
iris_ctree <- ctree(formula,data=train)
plot(iris_ctree,type="simple")
plot(iris_ctree)
names(train)
result<-subset(train,Petal.Length>1.9&Petal.Width>1.7)
dim(result)
table(result$Species)
pred<-predict(iris_ctree,test)
pred
tr<-table(pred,test$Species)
paste(round(sum(diag(tr))/nrow(test)*100),'%')



wdbc<-read.csv("c:/Users/401-14/Documents/wdbc_data.csv",stringsAsFactors = F)
str(wdbc) #569*32

## 내가한것
# diagnosis 진단
unique(wdbc$diagnosis) # B 양성 M 악성 (30개의 필드의 조합)
# DT를 이용해서 모델을 구성해보시오 (rpart)
# 데이터 train:7,test:3
result<-sample(1:nrow(wdbc),0.7*nrow(wdbc))
train_wdbc<-wdbc[result,-1]
test_wdbc<-wdbc[-result,-1]
formula<- diagnosis ~ .
model<-rpart(formula=formula,data=train_wdbc)
pred_wdbc<-predict(model,test_wdbc)
nrow(test_wdbc)
nrow(pred_wdbc)
cpred<-ifelse(pred_wdbc[,1]>=0.5,"B","M")
length(cpred)
(tb=table(cpred,test_wdbc$diagnosis))
sum(diag(tb))/nrow(test_wdbc) 

## 선생님이한것
wdbc<-read.csv("c:/Users/401-14/Documents/wdbc_data.csv",stringsAsFactors = F)
wdbc<-wdbc[-1]
wdbc$diagnosis<-factor(wdbc$diagnosis,levels=c("B","M"))
#DT:데이터에 대해서 강건(범주형,연속형)# 분산이 크면 중요한 변수, 영향력을 동일
normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}
wdbc_x<-as.data.frame(lapply(wdbc[2:31],normalize))
summary(wdbc_x)
wdbc_df<-data.frame(wdbc$diagnosis,wdbc_x)
dim(wdbc_df)
idx=sample(nrow(wdbc_df),0.7*nrow(wdbc_df))
wdbc_train=wdbc[idx,]
wdbc_test=wdbc_df[-idx,]
dim(wdbc_train)
dim(wdbc_test)
names(wdbc_test)
names(wdbc_train)
model2<-rpart(diagnosis ~., data=wdbc_train)
pred2<-predict(model2,wdbc_test,type="class")
prp(model2)
rpart.plot(model2)
fancyRpartPlot(model2)
# 평가
tr<-table(pred2,wdbc_test$wdbc.diagnosis)
paste("정분류율",round(sum(diag(tr))/nrow(wdbc_test)*100),"%")
paste("오분류율",round(sum(tr[1,2],tr[2,1])/nrow(wdbc_test)*100),"%")
paste("정밀도",round(tr[1,1]/sum(tr[1,1]+tr[1,2])*100))      
paste("민감도",round(tr[1,1]/sum(tr[,1])*100))     
paste("특이도",round(tr[2,2]/sum(tr[,2])*100))  

# 자동화 패키지인 caret 패키지를 적용 ( mordern 모델 학습 )

#install.packages("dplyr")
#install.packages("caret")
#install.packages("recipes", type = 'binary') 
library(caret)

set.seed(300)
m<-train(wdbc.diagnosis~.,data=wdbc_train,method="C5.0") # Entropy를 이용한 tree 분석
p<-predict(m,wdbc_test)
tr<-table(p,wdbc_test$wdbc.diagnosis)
paste("정분류율",round(sum(diag(tr))/nrow(wdbc_test)*100),"%")
paste("오분류율",round(sum(tr[1,2],tr[2,1])/nrow(wdbc_test)*100),"%")
paste("정밀도",round(tr[1,1]/sum(tr[1,1]+tr[1,2])*100))      
paste("민감도",round(tr[1,1]/sum(tr[,1])*100))     
paste("특이도",round(tr[2,2]/sum(tr[,2])*100)) 
head(predict(m,wdbc,type="raw"))
head(predict(m,wdbc,type="prob"))
# cross validation 교차검증
ctrl <-trainControl(method="cv",number=10,selectionFunction="oneSE")

#parameter 조합 생성 
expand.grid(height=seq(60,80,5),weight=seq(100,300,50), # 경우의 수 생성
            sex=c("Male","Female")) 

grid<-expand.grid(.model="tree",
                  .trials=c(1,5,10,15,20,25,30,35),
                  .winnow="FALSE")
m<-train(diagnosis ~., data=wdbc_train,method="C5.0",
         metric="Kappa",
         trControl=ctrl,
         tuneGrid=grid)
m
p<-predict(m,wdbc_test)
table(p,wdbc_test$wdbc.diagnosis)
m$bestTune

