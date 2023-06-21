#공분산
data1<-1:5
data2<-2:6
sum((data1-mean(data1))*(data2-mean(data2)))/(length(data1)-1)
cov(1:5,2:6)
cov(1:5,2:6)/sd(data1)/sd(data2)
cor(1:5,2:6) # 값이 1 완전 정상관관계가 있다.

#주성분 분석은 공분산행렬이나 상관계수행렬을 이용한다.

m<-matrix(c(1:10,(1:10)^2),ncol=2)

#공분산을 구하는 3가지방법
# spearman,pearson,kendall => 결과가 가장 작은 것을 사용한다.
cor(m,method="spearman") #비모수적방법(kruskal.test) : 정규분포가 아닐때 rank에 의한 방법
cor(m,method="pearson")  #모수적방법  (t.test)
cor(m,method="kendall")  #

# 문제: 공분산과 상관계수 구하기
a<-c(1:10)
b<-(1:10)^2
cov(a,b)
cor(a,b)

# 상관분석
# cor.test() 사용 
# 귀무가설 : 서로 독립이다.(상관이 없다.)
cor.test(1:5,1:5,method="pearson")

# 문제 iris 데이터에 대하여 전체 변수에 대한 상관계수 구하기
# 상관분석이나 회귀분석은 연속형데이터에서 가능
iris
library(dplyr)
cor(iris[,1:4])

iris%>%select(-(Species))%>%cor()
symnum(cor(iris[,1:4]))

d<-data.frame(x1=rnorm(10),
              x2=rnorm(10),
              x3=rnorm(10))
(M<-cor(d))
#install.packages("corrplot")
library(corrplot)
corrplot(M,method="shade")
product<-read.csv("C:/Users/401-14/Documents/product2.csv", fileEncoding="UTF-8", encoding="CP949",header=T)
head(product)
sd(product$제품_친밀도);sd(product$제품_적절성);sd(product$제품_만족도)
cor(product,method="pearson")
#install.packages("corrgram")
library(corrgram)
corrgram(product)
corrgram(product,upper.panel=panel.conf)

#install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(product,histogram=,pch="+")

# 문제
# airquality 데이터에 대해서 상관계수를 구하기
# 순서:
# 분석 대상 변수만 선택
# na 제거 
# 데이터의 상관정도를 확인
# 상관계수행렬 시각화
airquality
testair<-airquality[1:4]
testair<-na.omit(testair)
airquality_cor<-cor(testair)
col<-colorRampPalette(c("darkblue","white","darkorange"))(20)
heatmap(x=airquality_cor,col=col,symm=T)
chart.Correlation(testair,histogram=T,pch=19)

cor.test(testair$Wind,testair$Temp,method="spearman",exact=F)
#p-value = 2.426e-08 귀무가설기각
# 바람과 온도는 상관관계가 있다.

corrgram(airquality_cor,order=T,lower.panel=panel.shade,
         upper.panel=panel.pie,text.panel=panel.txt,
         main="공기질상관계수")

# 상관계수행렬과 고유값 분해
a<- c(4.0,4.2,3.9,4.3,4.1)
b<- c(2.0,2.1,2.0,2.1,2.2)
c<- c(0.60,0.59,0.58,0.62,0.63)
(mat<-matrix(c(a,b,c),nrow=5,byrow=F)) # 열로 생성
avr<-colMeans(mat)
(acha<-a-avr[1])
(bcha<-b-avr[2])
(ccha<-c-avr[3])

(aa_var<-sum(acha*acha)/((length(a)-1)))
(ab_var<-sum(acha*bcha)/((length(a)-1)))
(ac_var<-sum(acha*ccha)/((length(a)-1)))
cov(mat)

(aa_cor<-aa_var/sd(a)*sd(a))
(ab_cor<-ab_var/sd(a)*sd(b))
(ac_cor<-ac_var/sd(a)*sd(c))
cor(mat)

# 상관계수행렬을 이용해서 고유값 분해
# 변수의 개수 3 -> 상관계수행렬은 3x3 행렬로 출력

(eigenresult<-eigen(cor(mat))) # 고유값 분해
eigenresult$values # 고유치 # 정렬되어있다. 큰 값이 주 성분이다.
eigenresult$vectors # 고유벡터

# 상관계수 행렬을 고유값 분해를 했더니 고유치와 고유벡터를 얻었다.
# 고유벡터를 열별로 내적해보기
eigenresult$vectors[,1] %*% eigenresult$vectors[,2]
eigenresult$vectors[,3] %*% eigenresult$vectors[,2]
eigenresult$vectors[,1] %*% eigenresult$vectors[,3]

eigenresult$vectors[1,] %*% eigenresult$vectors[2,]

# 데이터로부터 정직교하는 축을 만들어 냈음 
# 이 데이터를 정직교하는 축 위에 재표현할 수 있음 
# 정직교하는 축에 데이터를 재표현하면 noise를 제거한 상태\
# 주성분을 선택하면 noise가 있는 변수가 제거된다.
# 데이터압축(차원축소)을 하는 효과가 있다.
# 이미지 640*640 이미지하나당 409600 변수
# 100개만 주성분으로 취하면 원래 이미지로 복원이 가능하다.
# 새롭게 생성된 축은 모든 변수가 참여를 해서 만들어진 축
# 이때 시각화를 위해 선택되는 축은 3개의변수를 대표하는 축이다.
# 그래서 변수만 선택해서 시각화 하는 것과는 차이가 있다.

# weather 데이터를 이용해서 상관계수행렬을 구하고 고유값 분해를 실시한 다음
# 그 결과가 단위행렬이 되는지를 확인해보시오

weather<-read.csv("C:/Users/401-14/Documents/weather.csv", fileEncoding="UTF-8", encoding="CP949",header=T)
wtest<-weather[c(2,3,4,5,7,9,10,11,12,13)]
wtest<-na.omit(wtest)
corwtest<-cor(wtest)
eigenwtest<-eigen(corwtest)
colSums(eigenwtest$vectors^2)
chart.Correlation(wtest,histogram=,pch="+")
# MinTemp MaxTemp Rainfall Sunshine WindGustSpeed WindSpeed Humidity Pressure Cloud Temp

sum(is.na(weather))
sapply(weather,function(x) sum(is.na(x)))
weather<-na.omit(weather)
summary(weather)
weather$key=1:nrow(weather)
outdata=select_if(weather,is.numeric)
str(outdata)
res_dir<-cor(outdata) # 정방행렬/대칭행렬
res_eig<-eigen(res_dir)
res_eig$values # 고유치의 크기는 해당하는 축 방향으로의 분산의 크기
# 통계분석에서는 분산이 크면 중요한 변수다. (주성분분석)
dim(res_eig$vectors)
length(res_eig$values)
heatmap(res_eig$vectors)
res_eig$vectors %*% t(res_eig$vectors) => 단위행렬
# 행렬 %*% 역행렬 = 단위행렬
# 정방행렬이면서 대칭행렬인 행렬은 전치행렬이 역행렬이다.

res_eig$vectors[,1] %*% res_eig$vectors[,2]
res_eig$vectors[,3] %*% res_eig$vectors[,4] # 고유벡터는 정직교한다.

#주성분분석
str(USArrests)
pairs(USArrests,panel=panel.smooth,main="USArrests data")
prcomp(USArrests,scale=T)
# 주성분선정할때 변수의 크기가 주성분을 결정하면 안되기때문에 scale


# 주성분분석 함수: 상관계수행렬 + 고유값분해
# 주성분 분석을 하게 되면 정직교하는 축이 결정되는데 이 축은
# 각 변수들이 이 축에 미치는 영향을 고려해서 만들어진 축이다.
# 그래서 의미를 알 수 없어서 pc1이라고 이름을 줬다.
# 변수의 참여 정도에 따라서 전문가가 의미있는 이름으로 다시 이름 지어야함

plot(prcomp(USArrests))
fit<-prcomp(USArrests,scale=T) # princomp 보다 낫다다
plot(fit,type="lines")
names(fit)
fit$center

summary(prcomp(USArrests,scale=T))
# elbow 보통 누적 85%까지가 주성분 
# 변수가 작으면 bias가 커지는 과소적합
# 변수가 많으면 bias는 작아지지만 variance가 커지는 과대적합
# 차원축소 방법 : PCA,FA

US.prin<-princomp(USArrests,cor=T)
screeplot(US.prin,npcs=4,type="line")
#install.packages("FactoMineR")
#install.packages("factoextra")
library(FactoMineR)
library(factoextra)

data(iris)
res.pca<-prcomp(iris[,-5],scale=T)
get_eig(res.pca)
fviz_eig(res.pca,addlabels=T,ylim=c(0,85))

str(mtcars)
fit<-princomp(mtcars,cor=T)
summary(fit)
loadings(fit)
plot(fit,type="lines")
fit$scores
fit$scores[,1:3]
fit$scores[,1:4]
fit
biplot(fit)

# 문제 : 다음 데이터를 가지고 주성분을 분석하여 데이터가 주성분에 미치는 영향을 확인해보시오
# scree plot 주성분 확인하기 ( 주성분을 몇개로 할 것인가)
# loadings를 이용하여 주성분에 기여하는 정도확인하기(새로운 축으로 만들어진 주성분축에 각 변수가 기여한 점)
# biplot을 이용하여 주성분에 기여하는 정도를 그래프로 확인하기(주성분의 성분을 확인 - 새로운 이름으로 결정)
(x<-1:10)
(y<-x+runif(10,min=-0.5,max=0.5))
(z<- x+y+runif(10,min=-10,max=10))
all<-data.frame(x,y,z)
all.prin<-princomp(all,cor=T)
screeplot(all.prin,npcs=3,type="line")
loadings(all.prin)
biplot(all.prin)


data<-data.frame(x,y,z)
(pr<-prcomp(data,scale=T))
summary(pr)
pr$sdev
names(pr)
pr$rotation # 고유값 분해했을 때의 고유벡터 # 회전행렬
pr$x
#pc1 , pc2, pc3 즉 고유벡터의 축으로 표현된 데이터
# x 값은 원래의 데이터가 변환이 되었다( 변환된 기준은 새로운 축)
biplot(pr)

# 주성분 선택, 다중공선성(독립변수가 상호연관성을 주면)

#FA(factor analysis)

v1 <- c(1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,4,5,6)
v2 <- c(1,2,1,1,1,1,2,1,2,1,3,4,3,3,3,4,6,5)
v3 <- c(3,3,3,3,3,1,1,1,1,1,1,1,1,1,1,5,4,6)
v4 <- c(3,3,4,3,3,1,1,2,1,1,1,1,2,1,1,5,6,4)
v5 <- c(1,1,1,1,1,3,3,3,3,3,1,1,1,1,1,6,4,5)
v6 <- c(1,1,1,2,1,3,3,3,4,3,1,1,1,2,1,6,5,4)

(med.data<-cbind(v1,v2,v3,v4,v5,v6))
head(med.data)
summary(med.data)
cor(med.data)
cor(med.data)
#install.packages("psych")
#install.packages("GPArotation")
library(psych)
library(GPArotation)
med.factor<-principal(med.data,rotate="none")
names(med.factor)
med.factor$values
op<-par(mfrow=c(1,1))
plot(med.factor$values,type="b")
stats.fact<-factanal(med.data,factors=3,rotation="oblimin",scores="Bartlett")
stats.fact
cor(med.data)

#factanal varimax알고리즘 
# 요인분석 : 축이 결정
# 회전 (rotation) -> 그 축으로 투영해야함
names(stats.fact)
stats.fact$scores # 재표현된 데이터 (3개의 축으로로)
stats.fact$loadings # 설명(요인에기여한 변수들의 역할)
stats.fact$factors # 새로운 축개수
stats.fact$criteria # 최적화의 결과
stats.fact$correlation # 원 데이터에 대한 상관계수
stats.fact$rotmat #변환을 위한 직교축 ( 회전행렬)
stats.fact$converged # True
stats.fact$dof # 0
stats.fact$method # mle 선형회귀
stats.fact$call # 호출된 함수내용
stats.fact$n.obs
