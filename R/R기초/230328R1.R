# 카이제곱 분포와 자유도
s<-seq(1,10,.1)
par(mfrow=c(2:3))
plot(dchisq(x,6),type="l")
plot(dchisq(x,5),type="l")
plot(dchisq(x,4),type="l")
plot(dchisq(x,3),type="l")
plot(dchisq(x,2),type="l")
plot(dchisq(x,1),type="l")

# factor를 기준으로한 도수분포표
x=c(1,2,3,4,5,6)
y=c(7,8,9,10,11,12)
z=10:15
(ta=table(x))
(tb=table(x,y)) # 인접행렬(contingency table),그래프로 표현하는 방법
(tc=table(x,y,z))
class(tc) # 테이블은 데이터프레임이 아니다

(d<-data.frame(x=c("1","2","2","1"),y=c("A","B","A","B"),num=c(3,5,8,7)))
class(d)
str(d)
(xt=xtabs(num~x+y,data=d))
class(xt)

margin.table(xt,1)#행방햑
margin.table(xt,2)#열방향
margin.table(xt)  #합계

prop.table(xt,1)  #행방향
prop.table(xt,2)  #열방향
prop.table(xt)    # 비율

Titanic
class(Titanic)
# Class , sex , Age, Survived
margin.table(Titanic,1) #합계: 선실별 전체 인원수

margin.table(Titanic,2)
margin.table(Titanic,3)
margin.table(Titanic,4)

margin.table(Titanic)

par(mfrow=c(2,2))
barplot(margin.table(Titanic,1))
barplot(margin.table(Titanic,2))
barplot(margin.table(Titanic,3))
barplot(margin.table(Titanic,4))

#Freq: frequency
(titanic.data=xtabs(Freq~Survived+Sex,data=Titanic))

#계층적 인덱스를 이용해서 표현
ftable(Titanic,row.vars=1:3)
ftable(Titanic,row.vars=1:2,col.vars="Survived")

ftable(Titanic,row.vars=c(1,3))

# class sex age survived

#성별별로 생존여부를 확인하시오
ftable(Titanic,row.vars="Sex",col.vars="Survived")
xtabs(Freq~Sex+Survived,data=Titanic)

#객실과 나이별로 데이터를 확인하시오
ftable(Titanic,row.vars="Age",col.vars="Class")
xtabs(Freq~Age+Class,data=Titanic)

#install.packages("gmodels")
# table+chisq(카이제곱분석)
library(gmodels)
CrossTable(mtcars$vs,mtcars$am)

19/32*18 # 10.6875
13/32*18 # 7.3125

(12-10.6875)^2/10.6875
(6-7.3125)^2/7.3125
0.161+0.236+0.207+0.303
# 행데이터를 열데이터에 대한 비율로 기댓값 구하기
# 카이제곱 : (관측값-기댓값)^2/기댓값

library(MASS)
CrossTable(infert$education,infert$induced,expected=T)
fisher.test(infert$education,infert$induced,alternative="two.sided")
#  카이제곱 approximation은 정확하지 않을수도 있습니다 => fisher.test를 해줘야한다.

data<-read.csv("C:/Users/401-14/Documents/cleanDescriptive_1.csv", fileEncoding="UTF-8", encoding="CP949",header=T)
data

# 부모학력수준 (level2) 와 자녀대학진학여부(pass)에 관련이 있는지 검정하시오


CrossTable(data$level2,data$pass)

x<-data$level2
y<-data$pass
result<-data.frame(Level=x,pass=y)
sapply(result,function(x) sum(is.na(x)))
result<-na.omit(result)
sapply(result,function(x) sum(is.na(x)))
CrossTable(x=result$Level,y=result$pass,expected=T)
chisq.test(x=result$Level,y=result$pass)
# 가설설정
# 귀무가설:상호 관련성이 없다.
# 대립가설:상호 관련성이 있다.
# p-value =0.2507 
# 유의수준: 0.05 
# p-value>0.05 그러므로 귀무가설을 기각할 수 없다.
# 부모학력수준과 자녀대학진학여부는 관련이 없다.

# 카이제곱 분석: 적합성, 독립성, 동질성 검정

data<-textConnection(
  "사이다종류 관측도수
  1 14
  2 32
  3 17
  4 9
  5 18")
(x<-read.table(data,header=T))
# 사이다 별로 선호도 차이가 있는가?
# 귀무가설: 선호도 차이가 없다
# 대립가설: 선호도 차이가 있다.
# 유의수준:0.05
sum(x[2])/5 # 기대도수 
sum((x[2]-18)^2/18) # 카이제곱
1-pchisq(16.333,4) # 0.0026033
chisq.test(x$관측도수) # p-value:0.002603 <0.05
# 귀무가설 기각

library(gmodels)
str(survey)
# survey의 성별과 운동량의 상호 관련성을 확인하시오
head(survey)
x<-survey$Sex
y<-survey$Exer
result<-data.frame(성별=x,운동량=y)
result<-na.omit(result)
xtabs(~x+y,data=survey)
table(x,y)
ftable(x,y)
CrossTable(x,y,expected=T)
CrossTable(result$성별,result$운동량,expected=T)
chisq.test(x,y)
1-pchisq(5.7184,2)
nrows(survey)
# p-value: 0.05731 이므로 
# 성별과 운동량은 상호관련성이 없다.

# 박수치는 손과 글씨쓰는 손의 독립성검정
head(survey)
sapply(survey,function(x) sum(is.na(x)))

testw<-survey$W.Hnd
testc<-survey$Clap
result<-data.frame(testw,testc)
result<-na.omit(result)
CrossTable(testw,testc,expected=T)
fisher.test(xtabs(~testw+testc))
# p value : 0.0001413
# 상호연관성 있다.
survey<-na.omit(survey)

## 동질성 검정
# 왼손잡이와 오른손잡이의 비율이 0.3:0.7이다 이때 표본이 이런 경향을 보이는가
chisq.test(table(survey$W.Hnd),p=c(.3,.7))

#다음 데이터에 대하여 카이제곱식으로 계산해서 p-value값을 구하고 브랜드별 선호도 조사 검정
data<-textConnection(
  "브랜드종류 관측도수
  BrandA 18
  BrandB 23
  BrandC 19")

read.table(data,header=T)
#가설설정
# 계산식으로 하시오

res<-(18-20)^2/20+(23-20)^2/20+(19-20)^2/20
# 자유도 2 
1-pchisq(res,2)
# p-value : 0.7046881
# p-value> 0.05 귀무가설 기각할 수 없다.
# 브랜드별 선호도차이는 없다.

# 귀무가설
# 독립성 :두 범주형 변수 간 독립이다
# 동질성 :두 변수 간에 분포가 동일하다
# 적합성 :주어진 분포에 대한 샘플 데이터의 분포와 차이가 없다

data<-read.csv("C:/Users/401-14/Documents/homogenity.csv", fileEncoding="UTF-8", encoding="CP949",header=T)

# method: 교육방법 1,2,3
# survey: 만족도 1(매우만족)~5(매우불만족) 

# 문제 : 데이터를 변환하고 교차표를 생성한 다음 교육방법 별 동질성 검정하고 해석하시오 
CrossTable(data$method,data$survey,expected=T)


data<-subset(data, !is.na(survey), c(method, survey))
nrow(data)
meth_ch <- function(x){
  if(x==1){
    x<-as.character("방법1")
  }else if (x==2){
    x<-as.character("방법2")
  }else if (x==3){
    x<-as.character("방법3")
  }
}

data<-subset(data,!is.na(survey),c(method,survey))

data$method2<-sapply(data$method,meth_ch)
data$method2[data$method==1]<-"방법1"
data$method2[data$method==2]<-"방법2"
data$method2[data$method==3]<-"방법3"

data$survey2=sapply(data$survey,switch,"1"="매우만족","2"="만족","3"="보통",
                    "4"="불만족","5"="매우불만족")
data$method2=sapply(data$method,switch,"1"="방법1","2"="방법2","3"="방법3")

# 교차표
table(data$method2,data$survey2)
xtabs(~method2+survey2,data=data)
ftable(data,row.vars="method2",col.vars="survey")

#동질성 검정
chisq.test(data$method2,data$survey2)
CrossTable(data$method2,data$survey2,expected=T)

# 평균분석(t.test) 두 집단 분석
# 정규분포test(shapiro.test)
# 모수분석(t.test()) / 비모수분석(wilcox.test())
# dependent/independent (연구자:동일표본여부) pairs
# 등분산테스트 ( var.test())  : var.equal=T/F

# anova test
# 분산분석 (군집간분산/군집내분산) 검정통계량
# 자유도에 의해서 영향을 받음
# 정규분포테스트
# 모수분석(aov()) 비모수분석(kruskal.test)
# 등분산 테스트 모수적: bartlett.test, 비모수: fliger.test
# 선형회귀처럼 사후분석 : TukeyHSD()

# 단일표본 평균분석

x<-c(65,78,88,55,48,95,66,57,79,81)
t.test(x,mu=75)
# 귀무가설:두 집단의 평균이 같다.
# 대립가설: 두 집단의 평균이 같지않다.

# 폐암발생률 평균이 20이라는 가설검증
sum(lung<-runif(20,min=19,max=20))
t.test(lung,mu=20,conf.level=.99)

sleep

# 두 집단에 대한 평균검정
attach(sleep)
plot(extra~group,data=sleep)
var.test(extra[group==1],extra[group==2],data=sleep)
# 등분산테스트
# 귀무가설: 두 집단의 분산차가 없다.
# 대립가설: 두 집단의 분산차가 있다.

with(sleep,t.test(extra[group==1],extra[group==2],var.equal=T))
# p-value=0.07919
# 귀무가설을 기각할 수 없고 두 집단 수면차이는 없다.
detach(sleep)

str(ToothGrowth)
ToothGrowth
my_data<-ToothGrowth
res.ftest<-var.test(len~supp,data=my_data)
res.ftest
res.ftest$estimate
res.ftest$p.value

#shapiro.test의 
#귀무가설: 정규분포이다
#대립가설: 정규분포가 아니다.
shapiro.test(rnorm(1000))
set.seed(450)
x<-runif(50,min=2,max=4)
shapiro.test(x)

x<-rnorm(1000,5.0,0.5)
t.test(x,x)
t.test(x,mu=5.2,alter="two.side",conf.level=0.95)
(result<-t.test(x,mu=5.2,alter="greater",conf.level=0.95))
(result<-t.test(x,mu=5.2,alter="less",conf.level=0.95))
# alter에 따라서 양측,단측검정 가능

#문제
#iris의 Sepal.Width와 Sepal.Length의 등분산성테스트를 하시오
iw<-iris$Sepal.Width
il<-iris$Sepal.Length
var.test(iw,il,data=iris)
with(iris,var.test(Sepal.Width,Sepal.Length))

# 새로운 당뇨병 치료제를 개발한 제약사의 예
# 치료에 지대한 영향을 주는 외부요인을 통제하기 위해 10명의 당뇨병 환자를 선별하여 1달 동안
# '위약(placebo)'을 투여한 기간의  혈당 (X1)과 '신약(new medicine)'을 투여한 1달 기간 동안의
#  혈당 수치(x2)를 측정하여 짝을 이루어 혈당 차이를 유의수준 5%에서 비교하시요
# 표본이 동일집단이다.
# 유의미한 차이가 있는가
x1 <- c(51.4, 58.0, 45.5, 55.5, 52.3, 50.9, 52.7, 50.3, 53.8, 53.1)
x2 <- c(50.1, 51.5, 45.9, 53.1, 51.8, 50.3, 52.0, 49.9, 52.5, 53.0)

#정규성테스트
shapiro.test(x1) #정규성
shapiro.test(x2) #비정규성
#등분산테스트
var.test(x1,x2) # p-value = 0.2073 귀무가설을 기각할수 없다. (귀무가설:등분산이다.)

t.test(x1,x2,alternative = c("greater"),
       paired=T,
       var.equal=T,
       conf.level=0.95)
# 검정 통계량 : t = 2.153, df = 9, p-value = 0.02987
# p-value=0.02987
# 평균검정에서 귀무가설:평균이 동일하다
# 귀무가설을 기각하지 못함 -> 약효는 효과가 없다.

?wilcox.test
#Wilcoxon Rank Sum and Signed Rank Tests

wilcox.test(x1,x2,
            alternative=c("greater"),
            paired=T,
            var.equal=T,
            conf.int=F,
            exact=F, #tie가 있어 정확한 p 값을 계산할 수 없다.
            conf.level=0.95)
# V = 52.5, p-value = 0.006201 평균분석의 귀무가설을 기각하고 대립가설을 채택한다.
# 당뇨병치료제는 약효가 있다.

#anova test
data("InsectSprays")
attach(InsectSprays)
str(InsectSprays)
InsectSprays
xtabs(InsectSprays)
aov.out=aov(count~spray,data=InsectSprays)
summary(aov.out) #회귀분석한 결과와 비슷슷
TukeyHSD(aov.out)

# 문제: Car93 데이터를 이용하여 생산국이 USA vs non-USA(Origin) 두 그룹간의
# price 평균의 차이가 있는지를 테스트 95% 신뢰구간 
library(MASS)
hw<-Cars93
str(hw)

hwor<-hw$Origin
hwpr<-hw$Price
hw2<-data.frame(Origin=hwor,Price=hwpr)
hw2$Origin=="USA"

# library(dplyr)
# 
# hw2 %>% 
#   group_by(Origin) %>% 
#   summarise(mean_price = mean(Price))

us_car<-subset(hw2,Origin=="USA")
nonus_car<-subset(hw2,Origin=="non-USA")

shapiro.test(us_car$Price)
shapiro.test(nonus_car$Price)

mean(us_car$Price)
mean(nonus_car$Price)


t.test(us_car$Price,nonus_car$Price,conf.level=0.95)

wilcox.test(us_car$Price,nonus_car$Price,exact=F)
# 평균이 같다 : 신뢰구간에 들어온다.
