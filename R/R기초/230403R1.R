library(proxy)
#install.packages("kernlab")
library(kernlab)
(x<-matrix(1:16,nrow=4)) # 4x4
sqrt(sum((x[1,]-x[4,])^2)) # 요소끼리 연산
sqrt(sum((x[,1]-x[,4])^2))

# distance
(dist<-dist(x,method="euclidean")) # 두 개의 벡터간의 문제 
# nxn -> (n-1) x (n-1) 행렬
(dist<-dist(x,method="minkowski",p=3))
dist(x,method="binary") # 이진수로 표현한다음에 다른 비트수
dist(x,method="manhattan") 
dist(x,method="mahalobis")
# dist(x, method = "mahalanobis") # 평균에서 표준편차의 몇배수 거리에 있는가

# 탐색적 군집분석, 확인적 군집분석

# 탐색적 군집분석
# 군집수의 개수를 결정하기 위해 아래 방법
idx=sample(1:dim(iris)[1],40)
irisSample=iris[idx,]
species<-irisSample$Species
irisSample$Species=NULL
hc=hclust(dist(irisSample),method="ave") # hclust 함수로 계층적 군집화
# hirerachical 

plot(hc,hang=-1,labels=iris$Species[idx])
rect.hclust(hc,k=2)
(groups=cutree(hc,k=3))
table(groups,species)

# 거리값: 두 개 간의 거리 -> 군집간에는 여러개의 데이터가 있는데
# 무엇을 기준으로 할 것이냐
# single linkage   : 두 군집의 가장 가까운 두점 사이의 거리
# complete linkage : 두 군집의 가장 먼 두점 사이의 거리
# Average linkage  : 각 거리의 평균값으로
#       ward       : 군집내 편차들의 제곱합을 고려해서 거리를 잼

clusters<-hclust(dist(iris[,3:4]),method="average")
plot(clusters)
library(ggplot2)
clusterCut<-cutree(clusters,3) # 범주화 할 때 cut 사용
# cutree는 범주화 한 것 처럼 군집번호 return
clusterCut
table(clusterCut,iris$Species)
ggplot(iris,aes(Petal.Length,Petal.Width,color=Species))+
  geom_point(alpha=0.4,size=3.5)+geom_point(col=clusterCut)+
  scale_color_manual(values=c('black','red','green'))

# kmeans -> 중심값
# 확인적 군집분석
# 중심값과 k값
# 랜덤하게 중심값 게산, k값결정 -> 각 중심과 데이터의 거리값 계산
# 그룹을 지정 -> 중심값 재계산 -> 각 중심과 거리값을 계산
# wss가 작아질 때 까지( 그룹내 응집도 최대화, 그룹간 분리도 최대화)

set.seed(100)
iris_back<-iris
iris_back$Species<-NULL # 비지도학습
# 거리를 기준으로 할 때는 반드시 정규화
iris.scaled<-scale(iris_back[,-5]) # scale을 하지 않는다면 변수의 사이즈 크기가 거리값에 영향
(kmeans.result<-kmeans(iris.scaled,3,trace=T))
table(iris$Species,kmeans.result$cluster)
# 산점도에 컬러
# 4개의 변수중에 2개의 변수만 고려해서 시각화화
plot(iris.scaled[,c("Sepal.Length","Sepal.Width")],xlim=c(-2,2),ylim=c(-2,2),col=kmeans.result$cluster)
points(kmeans.result$centers[,c("Sepal.Length","Sepal.Width")],col=1:3,pch=10,cex=10)

iris_back$Species<-iris$Species
iris_back$Species<-as.factor(iris_back$Species)
iris_back$pred<-kmeans.result$cluster
# sum(iris_back$Species == iris_back$pred)

names(kmeans.result)
kmeans.result$cluster
kmeans.result$centers

kmeans.result$withinss # 각 그룹별 그룹내 거리의 합
kmeans.result$betweenss # 그룹간 거리의 합
kmeans.result$tot.withinss; sum(kmeans.result$withinss) # 모든 그룹내 거리 합
kmeans.result$totss; sum(kmeans.result$tot.withinss,kmeans.result$betweenss) # 군집내거리+군집간거리 합
kmeans.result$iter # 2 번 반복
kmeans.result$size

km.res<-kmeans(iris.scaled,3,nstart=10)
library(factoextra)
# 4가지 요소를 고려한 시각화
fviz_cluster(km.res,iris[,-5],ellipse.type="norm")

# 클러스터 개수 구하기
library(caret) # 자동화 패키지
set.seed(123)
inTrain<-createDataPartition(y=iris$Species,p=0.7,list=F)
training<-iris[inTrain,]
testing<-iris[-inTrain,]
training.data<-scale(training[-5])
summary(training.data)
iris.kmeans<-kmeans(training.data[,-5],centers=3,iter.max=10000)
training$cluster<-as.factor(iris.kmeans$cluster)
qplot(Petal.Width,Petal.Length,colour=cluster,data=training)
table(training$Species,training$cluster)

#install.packages("NbClust")
library(NbClust)
# 그룹수를 조절하면서 kmeans -> 판단근거는 거리값의 합
nc<-NbClust(training.data,min.nc=2,max.nc=15,method="kmeans")
par(mfrow=c(1,1))
barplot(table(nc$Best.n[1,]),
        xlab="클러스터수",ylab="기준",
        main="클러스터 수 확인")

dim(training.data)
wssplot<-function(data,nc=15,seed=1234){
  wss<-(nrow(data)-1)*sum(apply(data,2,var)) # 분산
  for(i in 2:nc){ # 클러스터 개수
    set.seed(seed)
    wss[i]<-sum(kmeans(data,centers=i)$withinss) # 그룹내 거리합
  }
  plot(1:nc,wss,type="b",xlab="클러스터수",ylab="SS")
}
wssplot
wssplot(training.data)

# 내가 해본 것
body<-read.csv("c:/Users/401-14/Documents/bodycheck.csv")
names(body)
body[,-1]
inTrain<-sample(1:nrow(body),0.7*nrow(body))
training<-body[inTrain,]
testing<-body[-inTrain,]
training.body<-scale(training[,-1])
nc<-NbClust(training.body,min.nc=2,max.nc=7,method="kmeans")
barplot(table(nc$Best.n[1,]),
        xlab="클러스터수",ylab="기준",
        main="클러스터 수 확인")

body.kmeans<-kmeans(training.body[,-1],centers=2,iter.max=10000)
training$cluster<-as.factor(body.kmeans$cluster)


# 수업 때 한 것
# 중학교 1학년 신체검사 결과를 군집분석 해보시오
# 군집분석 -> scaling
body<-read.csv("c:/Users/401-14/Documents/bodycheck.csv")
names(body)
body[,-1]
str(body)
unique(body$안경유무) # 범주형 =>숫자
df<-body[,-1]
df <- na.omit(df)
# 열이름변경
colnames(df)<-c("handpw","height","weight","glass")
df<-scale(df)
class(df)
df<-as.data.frame(df)
k2<-kmeans(df,centers=2,nstart=25)
library(factoextra)
fviz_cluster(k2,data=df)
df$cluster<-as.factor(k2$cluster)
plot(df$handpw,df$weight,col=df$cluster)
points(k2$centers[,c("handpw","weight")],col=c(1,2),pch=8,cex=5)
k2$centers

# diamonds 데이터에 대해 price,carat,depth,table 변수 데이터만을 대상으로
# 탐색적 및 확인적 군집분석을 실시하시오
# 전체 53940데이터중 1000개만을 샘플링해서 작업하시오
# 1) 탐색적 군집분석을 실시하고 군집 수 결정하기
# 2) 가격에 영향을 미치는 요인에 대해서 설명해보시오
# 3) carat과 price의 관계를 군집으로 구분해서 시각화하시오
dia<-diamonds[c(1,5,6,7)]
tno<-sample(1:nrow(diamonds),1000)
traindia<-dia[tno,]
testdia<-dia[-tno,]
straindia<-scale(traindia)
nc<-NbClust(straindia,min.nc=2,max.nc=15,method="kmeans")
par(mfrow=c(1,1))
barplot(table(nc$Best.n[1,]),
        xlab="클러스터수",ylab="기준",
        main="클러스터 수 확인") 

# 2개가 베스트
dia.kmeans<-kmeans(straindia,centers=2,iter.max=10000)
straindia$cluster<-as.factor(dia.kmeans$cluster)
class(straindia)
straindia<-as.data.frame(straindia)
plot(straindia$carat,straindia$price,col=straindia$cluster)

?diamonds
# diamonds 의 cut이 5가지 범위여서 5개 분집군석
dia.kmeans<-kmeans(straindia,centers=5,iter.max=10000)
straindia$cluster<-as.factor(dia.kmeans$cluster)
straindia<-as.data.frame(straindia)
plot(straindia$carat,straindia$price,col=straindia$cluster)

ggplot(straindia, aes(x = carat, y = price, color = factor(cluster))) +
  geom_point() +
  labs(title = "Carat vs Price by Clusters")
## 내가한 잘못된거 
# => fviz_cluster에서 데이터에 군집값인 cluster 값을 넣어놓았던게 문제였음
straindia<-na.omit(straindia)
straindia<-as.data.frame(straindia)
k2<-kmeans(straindia,centers=5,nstart=1000)
library(factoextra)
fviz_cluster(k2,data=straindia[-5])
nrow(straindia)
nrow(dia_data)
# Error in colMeans(x, na.rm = TRUE) : 'x' must be numeric 에러메시지


## 동준이형꺼
str(diamonds)
head(diamonds)
dia_data<- diamonds[c(1,5,6,7)]
dia_data<- na.omit(dia_data)
dia_data<- scale(dia_data)                      
dia_df<- as.data.frame(dia_data)
km<-kmeans(dia_df, centers=5, nstart = 1000)
library(factoextra)
fviz_cluster(km, data=dia_data)

# 수업내용

data(diamonds)
t <- sample(1:nrow(diamonds),1000)
test <- diamonds[t,]
dim(test)
mydia <- test[c("price","carat","depth","table")]
dim(mydia)
#hclust 거리 행렬이 입력
class(dist(mydia))
dim(dist(mydia)) # 기본데이터 타입이 아님
# 그룹과 그룹의 거리 : single,complete,average,ward
# 탐색적 군집분석
result<-hclust(dist(mydia),method="average")
plot(result,hang=-1)
res<-hcut(mydia,k=4,stand=T)
fviz_dend(res,rect=T,cex=0.5,k_colors=c("#00AFBB","#2E9FDF","#E7B800","#FC4E07"))
res<-hcut(mydia,k=4,stand=T)
mydia<-scale(mydia)
str(mydia)
class(mydia)
mydia<-as.data.frame(mydia)
result2<-kmeans(mydia,4) # 군집분석은 행과의 거리
result2$centers # 4개
result2$cluster
unique(result2$cluster)
length(result2$cluster)

# 군집내거리 군집간거리
result2$withinss
result2$tot.withinss # Within Sum of Square
result2$betweenss
result2$totss
mydia$cluster<-result2$cluster
head(mydia)
plot(mydia[,-5])
cor(mydia[,-5],method="pearson")
library(corrgram)
corrgram(mydia[,-5])

plot(mydia$carat,mydia$price,col=mydia$cluster)
points(result2$centers[,c("carat","price")],col=c(3,1,2),pch=8,cex=5)

# 청소년 성향에 대한 설문
# sns계정을 가진 4개의 기본정보와 36개 관심정보
# 범죄성향, 운동성향, 외모지향, 무기력, 브레인
teens<-read.csv("c:/Users/401-14/Documents/snsdata.csv") 
dim(teens) # 30000x40
set.seed(100)
str(teens)
head(teens)
sum(is.na(teens))
colSums(apply(teens,2,is.na))
# gender와 age에 결측치
# 기본정보:  gradyear,gender,age,friends 
table(teens$gender)
summary(teens$age) # 13~20 청소년
teens$age<-ifelse(teens$age>=13 & teens$age<20,teens$age,NA)
summary(teens$age)
# 졸업연도별로 나이의 평균을 내라
avg<-ave(teens$age,teens$gradyear,FUN=function(x) mean(x,na.rm=T))
teens$age<-ifelse(is.na(teens$age),avg,teens$age)
summary(teens$age)

interests<-teens[5:40] # 1~4: 기본정보
summary(interests)
interests_n<-data.frame(lapply(interests,scale))
summary(interests_n)
teen_clusters<-kmeans(interests_n,5)
teen_clusters$size
table(teen_clusters$cluster)
# 주성분분석,요인분석도 명명했어야했는데 여기도 명명해야됨
# 
# 그룹의 명명식 -> 클러스터를 대표하는 값이 중심 값
# 범죄성향4, 운동성향 5 , 외모지향4, 무기력, 브레인

# 기본정보:  gradyear,gender,age,friends 
teen_clusters$centers

teen_cluster<-teen_clusters$cluster
teens$cluster<-teen_clusters$cluster
aggregate(data=teens,age~cluster,mean)
qplot(cluster,age,colour=gender,data=teens)
res<-aggregate(data=teens,gender=="F"~cluster, FUN=function(x) mean(x,na.rm=T))
plot(res,type="b",ltz=2)

aggregate(data=teens,softball+volleyball+hair+dress~gender=="F",mean)

# 문제
# 클러스터 별로 자기가 알고싶은 성향을 확인해서 제출
# 3개이상
aggregate(data=teens,mall+shopping~gender=="F",mean)
aggregate(data=teens,friends~drugs,mean)
aggregate(data=teens,music+dance~friends>150,mean)

# DTW (dynamic time warping)
# 연속형 수치를 비교(신호): 자연,노이즈
#install.packages("dtwclust")
library(dtwclust)
data(uciCT)

str(CharTraj)
class(CharTraj) # 열별로 데이터사이즈가 상이

#선형보간법:사이즈를 일치시키기 위해서 없는 부분은 보간법으로 채워서 계산

series<-reinterpolate(CharTraj,new.length=max(lengths(CharTraj)))
(series<-zscore(series)) # NaN => 0 으로 채워가면서
pc.dtwlb<-tsclust(series,k=20L, # 20번 반복
                  distance="dtw_lb",centroid="pam",
                  seed=3247,trace=T,
                  control=partitional_control(pam.precompute=F),
                  args=tsclust_args(dist=list(window.size=20L)))
plot(pc.dtwlb)


## plot 하는 방법
ggplot(iris,aes(Petal.Length,Petal.Width,color=Species))+
  geom_point(alpha=0.4,size=3.5)+geom_point(col=clusterCut)+
  scale_color_manual(values=c('black','red','green'))

qplot(Petal.Width,Petal.Length,colour=cluster,data=training)