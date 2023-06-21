data(iris)
head(iris)
str(iris)
summary(iris)
dim(iris)
levels(iris$Species)
unique(iris$Species)
score4<-c(3,3,6,7,7,10,10,10,11,13,30)
(n<-length(x))
min(score4)
max(score4)
range(score4)
diff(range(score4))
mean(score4)
median(score4)
sum(score4)
sort(score4)
order(score4)
summary(score4)
var(score4) 
# var를 수식으로 구해보기
sum((score4-mean(score4))^2)/(length(score4)-1)
sd(score4)
# sd 수식으로 구하기
sqrt(sum((score4-mean(score4))^2)/(length(score4)-1))

range(score4)
quantile(score4)
quantile(score4,probs=c(1:100)/100)
(Iqr<-quantile(score4)[4]-quantile(score4)[2])
IQR(score4)

# 정규본포의 경우
# 1차 원점에 대한 적률
# 2차 중심적률 : 분산 
# 3차 중심적률 : 왜도 : 좌우대칭
# 4차 중심적률 : 첨도 : 뾰족한정도

#install.packages("moments")
library(moments)
set.seed(1234)
n.sample<-rnorm(n=10000,mean=55,sd=4.5)
skewness(n.sample)
kurtosis(n.sample)

#install.packages("UsingR")
library(UsingR)
data(cfb)
head(cfb)
summary(cfb$INCOME)
hist(cfb$INCOME,breaks=500,freq=T)

cfb<-transform(cfb,INCOME_log=log(INCOME+1))
hist(cfb$INCOME_log,breaks=500,freq=T)

cfb<-transform(cfb,INCOME_sqrt=sqrt(INCOME+1))
hist(cfb$INCOME_sqrt,breaks=500,freq=T)
par(mfrow=c(1,3))
qqnorm(cfb$INCOME,main="INCOME")
qqline(cfb$INCOME)

qqnorm(cfb$INCOME_log,main="INCOME_log")
qqline(cfb$INCOME_log)

qqnorm(cfb$INCOME_sqrt,main="INCOME_sqrt")
qqline(cfb$INCOME_sqrt)
par(mfrow=c(1,1))

skewness(cfb$INCOME)
kurtosis(cfb$INCOME)
skewness(cfb$INCOME_log)
kurtosis(cfb$INCOME_log)
skewness(cfb$INCOME_sqrt)
kurtosis(cfb$INCOME_sqrt)

#대표치 : 평균,분산,표준편차,표준오차(표본개수고려),변동계수(평균크기고려)
data(trees)
dim(trees)
head(trees)
summary(trees)

sd(trees$Height);sd(trees$Girth);sd(trees$Volume)
sd(trees$Volume)/mean(trees$Volume) #변동계수
sd(trees$Girth)/mean(trees$Girth)
sd(trees$Height)/mean(trees$Height)

#신뢰구간

x=c(0:11)
(sem<-sd(x)/sqrt(length(x)))
c(mean(x)-2*sem,mean(x)+2*sem)
c(mean(x)-3*sem,mean(x)+3*sem)
# z분포: 표준정규분포
# t분포: 표본 30이하
# f분포: 3개이상집단
# 카이제곱분포: 범주형데이터

# 표준오차 
sqrt(sum((x-mean(x))^2)/(length(x)-1)) / sqrt(length(x)) # 표준오차
sd(x)/sqrt(length(x))

# 문제

sese<-sd(iris$Sepal.Length)/sqrt(length(iris$Sepal.Length)) # 표준오차
c(mean(iris$Sepal.Length)-2*sese,mean(iris$Sepal.Length)+2*sese)

n<-length(iris$Sepal.Length)
degrees_of_freedom<-n-1

# 정규분포(rnorm,dnorm 확률,qnorm 분위수,pnorm 누적확률)
# t분포 : 표본에 대해서 t 분포
# 확률에 대해서 분위수 ( 확률을 입력하면 분위수)
# 자유도에 따라서 분포도가 달라짐 ( 정규분포는 ->표준정규분포)
mean_value<-mean(iris$Sepal.Length)
std<-sd(iris$Sepal.Length)
st_error<-std/sqrt(n)
alpha=0.05
(t_score=qt(p=alpha/2,df=degrees_of_freedom,lower.tail=F))
margin_error<-t_score*st_error
lower_bound<-mean_value - margin_error
upper_bound<-mean_value + margin_error
print(c(lower_bound,mean_value,upper_bound))

# 모수 분석(정규분포인경우) 비모수 분석(정규분포가 아닌경우)
# 선형회귀 -> tree분석 -> 머신러닝 

rnorm(2,64.5,2.5) # rnorm(갯수,평균,표준편차)

(x<-rnorm(1000,0,1))
(x<-sort(x))
(d<-dnorm(x,0,1))

plot(x,d,main="표준정규분포표")
curve(dnorm(x),-3,3)
plot(density(rnorm(10000,0,1)))

pnorm(1)
pnorm(2)
pnorm(3)
pnorm(1.96)
pnorm(2.58)

pnorm(-3)
dnorm(0,0,1) # -> 분위를 알려주고 확률을 얻음 x 주면 y얻음음

# 문제1) 평균이 100이고 표준편차가 10인 정규분포에서 50이 나올 확률은?
dnorm(50,100,10)
z<-(50-100)/10
dnorm(z,0,1)
# 문제2) 평균이 90이고 표준편차가 12인 정규분포에서 98이 나올 확률은?

dnorm(98,90,12)

dnorm(z1,0,1)
z1<-(98-90)/12

qnorm(0.319448)

plot(seq(-3.2,3.2,length=50),dnorm(seq(-3,3,length=50),0,1),type="l",xlab="",ylab="",ylim=c(0,0.5))
segments(x0=c(-3,3),y0=c(-1,1),x1=c(-3,3),y1=c(1,1))
text(x=0,y=0.45,labels=expression("99.7%가 표준편차의 3배수 안에 3" ~ sigma))
arrows(x0=c(-2,2),y0=c(0.45,0.45),x1=c(-3,3),y1=c(0.45,0.45))

segments(x0=c(-2,2),y0=c(-1,1),x1=c(-2,2),y1=c(0.4,0.4))
text(x=0,y=0.3,labels=expression("95%가 표준편차의 2배수 안에 2" ~ sigma))
arrows(x0=c(-1.5,1.5),y0=c(0.3,0.3),x1=c(-2,2),y1=c(0.3,0.3))

segments(x0=c(-1,1),y0=c(-1,1),x1=c(-1,1),y1=c(0.25,0.25))
text(x=0,y=0.15,labels=expression("68%가 표준편차의 1배수 안에 1" ~ sigma),cex=0.9)

curve(dnorm(x,0,1),-4,4,xlab="z",ylab="f(z)")
z=seq(0,4,0.02)
lines(z,dnorm(z),type="h",col="grey")

#문제)
# 비행기의 평균 비행시간은 120시간이라고 하자. 비행시간이 정규분포이고
# 표준편차가 30시간이라고 가정하고, 9대 표본으로 추출할 때와 36대 표본으로 추출할 때 
# 표본평균과 분산을 비교해보시오
# 표준오차
# 표본이 많앚이면 표준오차가 줄어든다.
dof9<-8
dof36<-35
g9<-rnorm(9,120,30)
g36<-rnorm(36,120,30)
mean(g9)
mean(g36)
var(g9)
var(g36)

stderr<-function(x) sd(x,na.rm=T)/sqrt(length(na.omit(x)))
stderr(g9)
stderr(g36)

# 문제
# x ~ (300,50^2) 인 정규분포에서 P(x>=370) 확률 구하여라 (z점수활용)

1-pnorm(370,300,50)
zcore<-(370-300)/50
1-pnorm(1.4,0,1)

#문제 3
# 브랜드의 백열전구의 수명이 평균 1500시간, 표준편차 75시간 정규분포
# 1)1410시간보다 오래갈 확률
1-pnorm(1410,1500,75)
# 2)1563~1648 일 확률
pnorm(1648,1500,75)-pnorm(1563,1500,75)

curve(dnorm(x,0,1),-4,4,xlab="z",ylab="f(z)")
z=seq(-4,(1410-1500)/75,0.01)
lines(z,dnorm(z),type="h",col="grey")
curve(dnorm(x,0,1),-4,4,xlab="z",ylab="f(z)")
z=seq((1563-1500)/75,(1648-1500)/75,0.01)
lines(z,dnorm(z),type="h",col="grey")

#우리나라에서 사육하고 있는 생후18개월 이상 된 황소 무게는 평균이 500kg이고
#표준편차가 50kg인 정규분포
# 무게가 무거운 순서대로 5%해당하는 황소를 선별하고자한다.
# 몇 kg 이상인 황소를 선발해야하는가?

# pnorm(x,500,50) == 0.95
pnorm(582.2427,500,50)
# 약 582.2427kg 
1.64*50+500
qnorm(0.95,500,50)
curve(dnorm(x, mean = 90, sd = 12), xlim = c(30, 150), ylim = c(0, 0.03), 
      xlab = "x", ylab = "Density", main = "Normal Distribution with mean=90, sd=12")
dnorm(90,90,12)
dnorm(0,0,1)

# z점수를 구하는 함수 ( scale )
(x<-matrix(1:10,ncol=2))
(centered.x<-scale(x,scale=F))
scale(x) # 평균,표준편차(열중심으로 계산):z점수 정규화

set.seed(100)
h_korean<-rnorm(n=1000,mean=170,sd=10)
h_bushman<-rnorm(n=1000,mean=140,sd=8)
height<-data.frame(h_korean,h_bushman)
# rm(h_korean,h_bushman)
par(mfrow=c(1,2))
hist(h_korean,freq=T,main="한국인 키 빈도 히스토그램")
hist(h_korean,freq=F,main="한국인 키 확률밀도함수 그래프")

hist(h_bushman,freq=T,main="부시맨 키 빈도 히스토그램")
hist(h_bushman,freq=F,main="부시맨 키 확률밀도함수 그래프")
height<-transform(height,z2.h_korean=(h_korean-mean(h_korean))/sd(h_korean),
                  z2.h_bushman=(h_bushman-mean(h_bushman))/sd(h_bushman))
height<-transform(height,z.h_korean=scale(h_korean),z.h_bushman=scale(h_bushman))
hist(height$z.h_korean,freq=T,main="한국인 표준")
hist(height$z.h_bushman,freq=T,main="부시맨 표준")


#문제
#키 160이 한국인,부쉬맨에서 어떤 위치인지 비교해보시오
(zk<-(160-mean(h_korean))/sd(h_korean))
pnorm(zk) # 하위 15%
(zb<-(160-mean(h_bushman))/sd(h_bushman))
pnorm(zb) # 상위 0.07%

rnorm(100,0,1)
