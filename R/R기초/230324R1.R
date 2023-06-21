#graphic
data(cars)
str(cars)
head(cars)

plot(cars$speed,type="l")
plot(cars$dist,type="l")
plot(cars,type="l")
plot(cars,type="p")
plot(cars,type="b")
plot(cars,type="b",pch=20)
plot(cars,type="b",pch=22)
plot(cars,type="b",pch="+")
plot(cars,type="b",pch=2,cex=2)
plot(cars,type="l",pch="+",cex=2,col="red",lty="dotdash")
plot(cars,main="그래픽",sub="옵션확인을 위해서",col="red",xlab="speed",ylab="distance", ylim=c(0,40),
       xlim=c(1,10),type="l",asp=1)

#문제 라인타입의 종류에 대하여 확인해보시오
#"blank" : 선 없음
#"solid" : 실선
#"dashed" : 파선
#"dotted" : 점선
#"dotdash" : 점-대시 선
#"longdash" : 긴 파선
#"twodash" : 두개의 대시로 이루어진 선

#plotting character : 0~25
#cex: character expansion

plot(cars, cex=0.5)
identify(cars$speed, cars$dist)
plot(cars, cex=0.5)
text(cars$speed, cars$dist, pos=1)

# 앞면하고 뒷면이 있는 코인에 대하여 5회 던졌을때 앞면면이 나온 회수
coin<-c(2,2,0,1,1,1,2,3,1,2,2,3,3,4,1,3,2,3,3,1,2,2,1,2,2)
(frequency<-table(coin)) # 도수 분포표
(relative<-frequency/length(coin)) # 상대 도수 분포표
(cumulative<-cumsum(relative)) # 누적 상대 도수 분포표

#par:margins,fonts,colors 지정
opar<- par(mfrow=c(1,4)) # 전의 상태값을 리턴
plot(frequency, xlab="값", ylab="도수", type="b", col="red", main="도수",
     sub="순수도수", frame.plot=F,panel.first=T)
plot(1:5,frequency,xlab="값",ylab="도수",type="b",col="red",frame.plot=F)
plot(round(relative,2),type="b",pch=23,col="red")
plot(round(cumulative,2),type="b",col="red",axes=F)
par(opar) # 상태복원
opar<-par(mfrow=c(1,1))
plot(round(cumulative,2),type="b",col="red",axes=F)

plot(c(1:10),xlab=expression(xLab ~ x^2 ~m^-2 ~mu ~sqrt(2) ~ pi),ylab=expression(yLab ~ y^2 ~ m^-2),
     main="Plot 1")

max.temp<-c(22,27,26,24,23,26,28)
names(max.temp)<-c("Sun","Mon","Tue","Wen","Thu","Fri","Sat")
par(mfrow=c(1,2))
barplot(max.temp,main="Barplot")
pie(max.temp,main="Piechart",radius=1)
par(mfrow=c(1,1))

str(faithful)
with(faithful,{
  plot(density(eruptions,bw=0.15))
  rug(eruptions)
  rug(jitter(eruptions,amount=0.01),side=3,col="light blue")
})

library(MASS)
Boston$tax
plot(density(Boston$tax,bw=5))
rug(Boston$tax+rnorm(length(Boston$tax),sd=5),col=2,lwd=3.5)

(x=(0:100)*pi/10)
plot(x,sin(x)+exp(x/10),
     main="cos.sin출력",
     ylab="",
     type="l",
     col="blue")

amp.1<-2
amp.2<-2
amp.3<-5
amp.4<-5

wav.1<-1
wav.2<-2
wav.3<-3
wav.4<-7

signal.1<-amp.1*sin(wav.1*x)
signal.2<-amp.2*sin(wav.2*x)
signal.3<-amp.3*sin(wav.3*x)
signal.4<-amp.4*sin(wav.4*x)

par(mfrow=c(1,4))
plot(x,signal.1,type="l",ylim=c(-5,5));abline(h=0,v=0,lty=3)
plot(x,signal.2,type="l",ylim=c(-5,5));abline(h=0,lty=3)
plot(x,signal.3,type="l",ylim=c(-5,5));abline(h=0,lty=3)
plot(x,signal.4,type="l",ylim=c(-5,5));abline(h=0,lty=3)
par(mfrow=c(1,1))

par(mfrow=c(1,1))
str(cars)
plot(cars$dist,type="o",cex=0.5,xlab="speed",ylab="dist")
tapply(cars$dist,cars$speed,mean)
plot(tapply(cars$dist,cars$speed,mean),type="o",cex=0.5,xlab="speed",ylab="dist")
par(mfrow=c(1,1))

#통계학 : 추정과 검정
#평균-1.96*표준오차 ~ 평균+1.96*표준오차 -> 신뢰구간
#선형회귀 linear regression 점추정과 구간추정 -> 신뢰구간
#lm : linear model
# 표준오차 : 표준편차를 sqrt(표본의 개수)
(m<-lm(dist ~ speed, data=cars)) # lm을 하면 기울기와 절편이 return
plot(cars)
abline(m) # 직선을 작도할 때
(p<-predict(m,interval="confidence")) #신뢰구간을 가지고 예측
head(p)
x<-c(cars$speed,tail(cars$speed,1),rev(cars$speed),cars$speed[1])
y<-c(p[,"lwr"],tail(p[,"upr"],1),rev(p[,"upr"]),p[,"lwr"][1])
polygon(x,y,col=rgb(.7,.7,.7,.5))

# 비 선형회귀
opar<-par(mfrow=c(1,1))
plot(cars)
lines(lowess(cars))

str(women)
# 위 데이터에 선형회귀하고 회귀선출력
opar<-par(mfrow=c(1,1))
# hw<-lm(height ~ weight,data=women)
# abline(hw)
# plot(women$height,type="o",cex=0.5,xlab="weight",ylab="height")
# tapply(women$height,women$weight)

### 
res=lm(height ~ weight,data=women)
plot(women$weight,women$height)
abline(res)

#
str(trees)
Height2<-trees$Height^2
trees2<-cbind(trees,Height2)
attach(trees2)
(test2<-lm(Girth ~ Height+Height2))
plot(Girth-Height)
fitted(test2)
lines(sort(Height),fitted(test2)[order(Height)],col="red",type="l")
detach(trees2)

par(mfrow=c(1,1))
honeymoon<-c(12,14,8,9)
names(honeymoon)<-c("하와이","동남아","유럽","기타")
pie(honeymoon,col=rainbow(4))

per<-round(100*honeymoon/sum(honeymoon),1)
lab<-paste(names(honeymoon),"\n",per,"%")#
pie(honeymoon,labels=lab,col=rainbow(4))
text(-0.5,0.2,"35%",col="black")
text(0.3,0.3,"30%",col="black")
text(-0.1,-0.5,"20%",col="black")
text(0.5,-0.3,"15%",col="black")

x<-rnorm(1000,mean=100,sd=1)
qqnorm(x)
qqline(x,lty=2)

x<-runif(1000) # 균등분포
qqnorm(x)
qqline(x,lty=2)

# lattice 패키지 (범주형을 고려해서 만든 패키지)
library(lattice)
str(airquality)
xyplot(Ozone ~ Wind,data=airquality)
xyplot(Ozone ~ Wind | Month,data=airquality)

xyplot(Ozone ~ Wind | Month,data=airquality,layout=c(3,2))
convert <-transform(airquality,Month=factor(Month))
xyplot(Ozone ~ Wind | Month,data=convert,layout=c(5,1))

# qplot , ggplot 
library(ggplot2)
str(mpg)
qplot(displ,hwy,data=mpg)
qplot(displ,hwy,data=mpg,color=drv)
qplot(hwy,data=mpg,fill=drv,binwidth=2)
#범주형 출력
qplot(hwy,data=mpg,fill=drv,facets=.~drv,binwidth=2)
# 중량별 연비->carb종류별로로
qplot(mtcars$wt,mtcars$mpg,data=mtcars,color=factor(carb),shape=factor(cyl))
qplot(wt,mpg,data=mtcars,color=factor(cyl),geom=c("point","smooth"))
qplot(mpg,wt,data=mtcars,color=factor(cyl),geom="point")+geom_line()

# ggplot : layer
# Data, Function(요약)
# Coodinates(축을 지정: aes)
# Mapping(color,size,shape,transparency,fill)
# Geometries(geom_point : 출력 모양)
# Scales
# Facets(범주별로 출력)
# Themes 전체적인 배경이나 글꼴 
p<-ggplot(mtcars,aes(wt,mpg))
p+geom_point()
p+geom_point(aes(colour=factor(cyl)))
p+geom_point(aes(shape=factor(cyl)))
p+geom_point(aes(size=qsec))
ggplot(mtcars,aes(wt,mpg))+geom_point(colour="red",size=3) # "stack"
# y축이 지정되지 않음 :자동으로 카운트리는 통계처리를 진행

ggplot(data=mtcars)+geom_bar(mapping=aes(x=cyl,fill=as.factor(am)),position="dodge")
ggplot(mpg,aes(x=hwy,fill=drv))+geom_dotplot(binwidth=2)
ggplot(mpg,aes(x=hwy))+geom_histogram(binwidth=2) # 연속된 수치에 대해서 구간별로 카운트
ggplot(mpg,aes(x=hwy))+geom_density()
ggplot(mpg,aes(x=hwy))+geom_density()+coord_flip() # 보간법에는 다양한 kernel( 선형 비선형)

#문제 
# iris 데이터에 대하여 x=Sepal.Length, y=Sepal.Width geom_point 기하형태 출력
# 조건 : point size 는 3 
# 위 그래프에서 Species를 구분하도록 모양을 달리해서 출력
# Species 범주형으로 3개 그래프 출력
str(iris)
qplot(Sepal.Length,Sepal.Width,data=iris)

res<-ggplot(iris,aes(Sepal.Length,Sepal.Width,shape=Species))
res<-res+geom_point(size=3)
res+facet_wrap(~Species,ncol=3)
rm(mtcars)
mpg

####
# 도수분포표,상대도수분포표,누적도수 분포표를 만든다음 dataframe에 하나의 데이터로 묶고
# ggplot을 이용해서 시각화 해보시오
coin<-c(2,2,0,1,1,1,2,3,1,2,2,3,3,4,1,3,2,3,3,1,2,2,1,2,2)

# (frequency<-table(coin)) # 도수 분포표
# (relative<-frequency/length(coin)) # 상대 도수 분포표
# (cumulative<-cumsum(relative)) # 누적 상대 도수 분포표
# 
# distribute <-data.frame(count = 0:4, frequency = frequency, relative = relative, cumulative = cumulative)
# rm(distribute)
# 
# distribute<-data.frame(frequency,relative,cumulative)
# distribute<-distribute[,-1]
# distribute<-distribute[,-2]
# distribute$count<-c(0:4)
# opar<-par(mfrow=c(1,4))
# ggplot(distribute,aes(count,Freq))+geom_point()
# ggplot(distribute,aes(count,Freq.1))+geom_point()
# ggplot(distribute,aes(count,cumulative))+geom_point()
# ggplot(distribute$Freq,aes(x=distribute$count))+geom_histogram()


(coin.freq<-table(coin))
(coin.rel=round(coin.freq/length(coin),2))
(coin.cum=cumsum(coin.rel))
(coin.num=sort(unique(coin)))
(coin.freq<-data.frame(coin.num=coin.num,coinfreq=as.vector(coin.freq)))
names(coin.freq)[2]<-paste("val")
coin.freq$type=rep("freq",length(coin.num))
coin.freq

(coin.rel=data.frame(coin.num,coin.rel=as.vector(coin.rel)))
names(coin.rel)[2]<-paste("val")
(coin.rel$type=rep("rel",length(coin.num)))
coin.rel

(coin.cum=data.frame(coin.num,coin.cum=as.vector(coin.cum)))
(names(coin.cum)[2]<-paste("val"))
(coin.cum$type=rep("cum",length(coin.num)))
class(coin.cum)
coin.cum

(coin.graph<-rbind(coin.freq,coin.rel,coin.cum))

ggplot(coin.graph,aes(coin.num,val,group=type,col=type))+
  geom_point()+
  geom_line()

ggplot(mtcars, aes(x = wt)) +
  geom_point(aes(y = mpg, color = "mpg")) +
  geom_line(aes(y = qsec * 10, color = "qsec")) +
  scale_y_continuous(
    name = "mpg",
    sec.axis = sec_axis(~ . / 10, name = "qsec * 10"),
    breaks = seq(10, 40, 5),
    limits = c(10, 40)
  ) +
  labs(x = "wt", color = "Variable")


library(tidyverse)
## 다음 문제
dataset<-read.csv("dataset.csv",header=T)
dataset
# 다음 코드를 역 코딩하시오 (주로 범주형 데이터의 값의 변환이고 요약변수를 생성하는 것)
# resident2:'1.서울특별시' '2.인천광역시','3.대전광역시','4.대구광역시','5.시구군'
# job2 : 공무원, 2:회사원,3:개인사업
# age2  청년층 , 중년층 , 장년층
# position2 : 1급,2급,3급,4급,5급
# gender2 : 성별 1:남자,2 여자
# age3 : 청년층, 중년층, 장년층의 level 번호로 저장

# 문제1)데이터 구조를 확인하시오
str(dataset)
##
str(dataset)
dim(dataset)
nrow(dataset)
ncol(dataset)
length(dataset)
summary(dataset) #숫자변수만 확인
names(dataset)
attributes(dataset)
# 문제2)데이터를 조회하는 다양한 방법으로 조회해보시오
##
print(dataset)
view(dataset)
head(dataset)
tail(dataset)
dataset$age
dataset[1,5]
dataset[2]
dataset[c("age","gender")]
# 문제3) 결측치
# 1) 결측치 개수 확인하고 제거
sum(is.na(dataset))
##
sum(is.na(dataset))
sapply(dataset,function(x) sum(is.na(x)))
na.omit(dataset)
nrow(dataset)
dataset%>%
  is.na()
dataset%>%
  na.omit()
# 2) 결측치 값을 0 또는 평균값으로 대체
dataset1<-ifelse(is.na(dataset),0,dataset)
dataset1<-replace(dataset,is.na(dataset),0)
datamean<-apply(dataset1,2,mean)
##
x<-dataset$price
price2<-na.omit(dataset$price)
dataset$price2<-ifelse(!is.na(x),x,0)
dataset$price3<-ifelse(!is.na(x),x,round(mean(x,na.rm=T),2))
# 문제4) 이상치
# 1)변수별 이상치 확인
boxplot(dataset1)
##
#boxplot은 정량적 데이터에만 가능
#data.frame:범주형인지 정량적 데이터인지

# 2)이상치 제거
datasd<-apply(dataset1,2,sd)
dataset1[dataset1 <= datamean + 2*datasd & dataset1 >= datamean - 2*datasd]
dataset2<-ifelse(dataset1 <= datamean + 2*datasd & dataset1 >= datamean - 2*datasd,dataset1,datamean)
dataset3<-dataset1[(dataset1 <= datamean + 2*datasd & dataset1 >= datamean - 2*datasd)]
str(dataset1)
##

# 문제5) gender변수를 정제해보시오
sum(is.na(dataset["gender"]))
dataset1[dataset1["gender"]==1|dataset1["gender"]==2]
ifelse(dataset["gender"]==1|dataset["gender"]==2,dataset["gender"],0)
dataset1["gender"][dataset1["gender"]==1|dataset1["gender"]==2]
datagroup<- ifelse(dataset1["gender"]==1|dataset1["gender"]==2,dataset1["gender"][dataset1["gender"]==1|dataset1["gender"]==2],0)
##
table(dataset$gender)
pie(table(dataset$gender))
#범주형일때는 table로 확인
dataset<-subset(dataset,gender==1|gender==2)
table(dataset$gender)

#확인
dataset%>%
  select(gender)%>%
  filter(gender==1|gender==2)%>%
  table()
#처리
dataset<- dataset%>%
  filter(gender==1|gender==2)
#정량적데이터

boxplot(dataset$price) # 3사분위수+IQR*1.5
dataset2<-subset(dataset,price>=-100&price<=100)
# 문제6) price변수를 확인하고 범위값으로 제한 (2~10)
dataset1["price"]>10
datasetp6<-replace(dataset1["price"],dataset1["price"]>10,10)
datasetp6<-replace(datasetp6["price"],datasetp6["price"]<2,2)
##
dataset2<-subset(dataset,price>=2&price<=10)


# 문제7) age변수를 20~69사이의 값으로 제한하고 시각화
datasetp7<-dataset1["age"][dataset1["age"]>=20&dataset1["age"]<=69]

##
dataset2<-subset(dataset,age>=20&age<=69)

# 문제8)resident2변수를 resident변수의 값에 따라 값을 입력
# 1:서울특별시,2:인천광역시,3:대전광역시,4:대구광역시,5:시군구
##
dataset2$resident2[dataset2$resident==1]<-"1.서울특별시"
dataset2$resident2[dataset2$resident==2]<-"2.인천광역시"
dataset2$resident2[dataset2$resident==3]<-"3.대전광역시"
dataset2$resident2[dataset2$resident==4]<-"4.대구광역시"
dataset2$resident2[dataset2$resident==5]<-"5.시구군"
dataset2[c("resident","resident2")]

# 문제9)job2 변수에 job에 따라서 값을 입력
# 1:공무원,2:회사원,3:개인사업
dataset2$job2[dataset2$job==1]<-'공무원'
dataset2$job2[dataset2$job==2]<-'회사원'
dataset2$job2[dataset2$job==3]<-'개인사업'
head(dataset2)

# 문제10) 연속형변수인 age를 age2에 범주화하시오
# age<=30:청년층,30<age<=55:중년층,age>55:장년층
dataset2$age2[dataset2$age<=30]<-'청년층'
dataset2$age2[dataset2$age>30&dataset2$age<=55]<-'중년층'
dataset2$age2[dataset2$age>55]<-'장년년층'

# 문제11) 긍정점수(survey)를 5점 척도를 역순으로 다시 입력
# 1.매우만족 ... 5.매우 불만족

unique(dataset2$survey)
csurvey<-6-dataset$survey
unique(csurvey)
dataset$survey <-csurvey
# 문제12)거주지역별 성별 분포를 시각화
resident_gender<-table(dataset2$resident2,dataset2$gender)
barplot(resident_gender,beside=T,horiz=T,
        col=rainbow(5),
        legend=row.names(resident_gender),
        main="성별에 따른 거주지역 분포현황")
# 문제13)성별에 따른 거주지역 분포현황 시각화
gender_resident<-table(dataset2$gender,dataset2$resident2)
barplot(gender_resident,beside=T,
        col=rep(c(2,4),5),horiz=T,
        legend=c("남자","여자"),
        main="거주지역별 성별 분포현황")
library(lattice)
# 문제14)직업 유형에 따른 나이 분포현황 시각화
densityplot( ~ age,data=dataset2,groups=job2,
            plot.points=T,auto.key=T)
# 문제15)성별에 따른 직급별 구매비용 시각화
densityplot(~price|factor(position),data=dataset2,
            groups=gender,plot.points=T,auto.key=T)
