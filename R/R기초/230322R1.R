(x<-1:10)
(x<-rnorm(100)) #random normal 정규분포로부터 랜덤하게 선택
# vector ->matrix,dataframe,array, list
var(x) #기본이 벡터
sd(x)
range(x) #상한선 하한선
diff(range(x))
quantile(x,0.75)-quantile(x,0.25)#사분위를 구하는 함수
IQR(x)
IQR(rnorm(10000))
summary(x)
boxplot(x)
summary(x)
        
vec<-1:10
(vec<-sample(vec)) # 랜덤선택
summary(vec)
table(vec) #도수 분포표

directory<-getwd() # "C:/Users/401-14/Documents"
setwd(directory)
getwd()

x<-c(1.5,2.5,-1.3,2.5)
x
mean(x)
round(mean(x))
ceiling(mean(x))
floor(mean(x))

#install.packages("mlbench")
library(mlbench)
data("BostonHousing",package="mlbench")
original<-BostonHousing
set.seed(100) #컴퓨터의 난수는 의사난수 ->똑같은 결과가 나오게 하기 위해 
#컴퓨터의 모델은 난수에 의해 작동 
# 선형회귀는 수치데이터여야 하고
# 범주형 데이터는 두개이상 사용못함.
str(BostonHousing)
sum(is.na(BostonHousing))
BostonHousing<-na.omit(BostonHousing)

BostonHousing[sample(1:nrow(BostonHousing),40),"rad"]<-NA

BostonHousing[sample(1:nrow(BostonHousing),40),"ptratio"] <-NA
sum(is.na(BostonHousing))
BostonHousing$ptratio
# apply 데이터를 함수에 적용
# apply,lapply(리스트인 경우),sapply(벡터나 행렬),tapply(그룹핑한다음 함수 적용)
# 함수적 프로그래밍(반복문 x - 자동으로 모든 데이터에 대하여 적용)
# sapply는 열별로 적용
# 데이터프레임은 열우선
sapply(BostonHousing,function(x) sum(is.na(x))) # x는 열벡터로 입력
# 종속변수 ~ 독립변수
lm(medv ~ ptratio + rad, data=BostonHousing, na.action=na.omit)

#install.packages("Hmisc")
library(Hmisc)
impute(BostonHousing$ptratio,mean) # na가 있으면 mean으로 
impute(BostonHousing$ptratio,median)
impute(BostonHousing$ptratio,20)
BostonHousing$ptratio[is.na(BostonHousing$ptratio)] <- mean(BostonHousing$ptratio,na.rm=T)

(m1<-matrix(C<-(1:10),nrow=5,ncol=6))
(a_m1<-apply(m1,1,sum)) # 행으로
(a_m2<-apply(m1,2,sum)) # 열방향

(vec<-c(1:10))
typeof(vec)
class(vec)
length(vec)
nrow(vec)
ncol(vec)
dim(vec)
apply(vec,2,sum) # 적어도 2차원
sapply(vec,function(vec) sum(vec))

avg<-function(x){
  (min(x)+max(x))/2
}
cars
dt<-cars
head(cars)
sapply(dt,avg)

iris
head(iris)
dim(iris)

tapply(iris$Sepal.Width,iris$Species,median) # tapply(a,b,c) a를 b그룹별로 c 를 구해라 
tapply(iris$Sepal.Width,iris$Species,sum)
tapply(iris$Sepal.Width,iris$Species,mean)

?mtcars
head(mtcars)
tail(mtcars)
summary(mtcars)
str(mtcars)

(exdata<-mtcars[1:10,1:3])
class(exdata)
apply(exdata,2,mean) 
boxplot(mtcars)

(list.o.nums<-list(runif(100),rnorm(100),rpois(100,lambda=1)))
list.o.nums
lapply(list.o.nums,sd)
sapply(list.o.nums,sd)
apply(list.o.nums,2,sd) # 이빨빠진 2차원은 2차원으로 안 본다.

# 1부터 10의 데이터에 대하여 2제곱 값을 구해서 출력 (apply 사용)
pow<-function(x){
  x*x
}

vector<-c(1:10)
sapply(vector,pow)

sapply(vector,function(x) {x^2})

#iris의 4개의 독립변수에 대해서 평균을 계산하시오
dim(iris)
head(iris)
sapply(iris[1:4],mean)
sapply(iris[,1:4],mean)

#정규분포에서 랜덤하게 데이터를 20개 선택해서 5x4행렬
#행합계 열합계
(test<-rnorm(20))
mat<-matrix(test,nrow=5,ncol=4)
sum(mat)
apply(mat,2,sum)
colSums(mat)
colMeans(mat)

quantile(mat,probs=0.25)
quantile(mat,0.5)
quantile(mat,0.75)
apply(mat,2,quantile,probs=c(0.25,0.5,0.75))
square(2)

(data<-c(1:10,rnorm(10,2),runif(10)))
groups<-gl(3,10)
tapply(data,groups,mean)

#factor
#구간범주화
#install.packages("ggplot2")
library(ggplot2)
library(MASS)
str(Cars93)
hist(Cars93$MPG.highway) 
disc_1<-Cars93[,c("Model","MPG.highway")]
dim(Cars93)
head(disc_1)
range(disc_1["MPG.highway"])

disc_1<-within(disc_1,{
  MPG.highway_cd=character(0) # 변수추가하고 문자타입 초기화 
  MPG.highway_cd[MPG.highway>=20 & MPG.highway <25] ="20~25"
  MPG.highway_cd[MPG.highway>=25 & MPG.highway <30] ="25~30"
  MPG.highway_cd[MPG.highway>=30 & MPG.highway <35] ="30~35"
  MPG.highway_cd[MPG.highway>=35 & MPG.highway <40] ="35~40"
  MPG.highway_cd[MPG.highway>=40 & MPG.highway <45] ="40~45"
  MPG.highway_cd[MPG.highway>=45 & MPG.highway <=50] ="45~50"
  MPG.highway_cd=factor(MPG.highway_cd,
                        level=c("20~25","25~30","30~35","35~40","40~45","45~50"))
})
# 문제 : 범주화된 구간값에 따라 MPG.highway의 합계 평균 표준편차 구하기

tapply(disc_1$MPG.highway,disc_1$MPG.highway_cd,sum)
tapply(disc_1$MPG.highway,disc_1$MPG.highway_cd,mean)
tapply(disc_1$MPG.highway,disc_1$MPG.highway_cd,sd)

ggplot(disc_1,aes(x=MPG.highway_cd,fill=MPG.highway_cd))+geom_dotplot(binwidth=0.1)
ggplot(disc_1,aes(x=MPG.highway_cd,fill=MPG.highway_cd))+geom_bar()
#사분위수 구간범주화
quantile(disc_1$MPG.highway,0.25)
quantile(disc_1$MPG.highway,0.5)
quantile(disc_1$MPG.highway,0.75)

# dummy 변수화
# 원래 변수 (2개) -> 6개의 변수 
# 선형회귀에서는 범주형 변수를 반드시 더미 변수화해야한다.
cust_id<-c("c01","c02","c03","c04","c05","c06","c07")
age<-c(25,45,31,30,49,53,27)
cust_profile <-data.frame(cust_id,age,stringsAsFactors = F)
cust_profile
# 범주수만큼 변수가 증가하고 데이터는 0과 1로 표현됨 
cust_profile<-transform(cust_profile,
                        age_20=ifelse(age>=20&age<30,1,0),
                        age_30=ifelse(age>=30&age<40,1,0),
                        age_40=ifelse(age>=40&age<50,1,0),
                        age_50=ifelse(age>=50&age<60,1,0))
cust_profile

head(iris)
min_max_norm<-function(x){ # 열별
  (x-min(x))/(max(x)-min(x))
}
sapply(iris[1:4],min_max_norm)
iris_norm<-as.data.frame(lapply(iris[1:4],min_max_norm))
head(iris_norm)
iris_norm$Species<-iris$Species
head(iris_norm)

z_normal<-function(x){
  (x-mean(x))/sd(x) # 표준편차 : sqrt(var) # 분산은 평균과의 차의 제곱의 합
}
iris_z_norm<-as.data.frame(lapply(iris[1:4],z_normal))
iris_z_norm

iris_standardize<-as.data.frame(scale(iris[1:4])) #열별로

re=boxplot(iris)
re # 리스트 

#install.packages("dplyr")
library(dplyr)
head(iris)
fivenum(iris[,1],na.rm=TRUE) # minimum,lower,median,upper,maximum
outdata<-iris[1:4]
out<-outdata
for(i in 1:(ncol(outdata)-1)){
  uppercut=fivenum(outdata[,i])[4]+1.5*IQR(outdata[,i])
  lowercut=fivenum(outdata[,i])[2]-1.5*IQR(outdata[,i])
  # ,로 분리된 조건
  out<-filter(out,out[,i]<=uppercut,out[,i]>=lowercut)
}
for(i in 1:(ncol(outdata)-1)){
  uppercut=quantile(outdata[,i],0.75)+1.5*IQR(outdata[,i])
  lowercut=quantile(outdata[,i],0.25)-1.5*IQR(outdata[,i])
  out<-filter(out,out[,i]<=uppercut,out[,i]>=lowercut)
}
str(out)

# 위치 데이터
state_table <-
  data.frame( key=c("SE", "DJ", "DG", "SH", "QD"),
              name=c(" 서울", "대전", "대구", "상해", "칭따오"),
              country=c("한국", "한국", "한국", "중국", "중국"))
state_table

# 년도
month_table <-
  data.frame(key=1:12,
             desc=c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
             quarter=c("Q1","Q1","Q1","Q2","Q2","Q2","Q3","Q3","Q3","Q4","Q4","Q4"))
month_table

# 상품 테이블
prod_table <-
  data.frame(key=c("Printer", "Tablet", "Laptop"),
             price=c(225, 570, 1120))

prod_table
names(prod_table)
row.names(prod_table)
prod_table1<-data.frame(Printer=225,Tablet=570,Laptop=1120)
prod_table1<-t(prod_table1)
gen_sales<-function(no_of_recs){
  loc<-sample(state_table$key,no_of_recs,replace=T,prob=c(2,2,1,1,1))
  time_month<-sample(month_table$key,no_of_recs,replace=T)
  time_year<-sample(c(2012,2013),no_of_recs,replace=T)
  prod<-sample(prod_table$key,no_of_recs,replace=T,prob=c(1,3,2))
  unit<-sample(c(1,2),no_of_recs,replace=T,prob=c(10,3))
  
  amount<-unit*prod_table1[prod,1]
  sales<-data.frame(month=time_month,
                    year=time_year,
                    loc=loc,
                    prod=prod,
                    unit=unit,
                    amount=amount)
  sales<-sales[order(sales$year,sales$month),]
  row.names(sales)<-NULL
  return(sales)
}
sales_fact<-gen_sales(500)
dim(sales_fact)

str(sales_fact)

# product별로 월,연도,location별로 합게를 낼 때 
# 범주형 3개, 월은 범주형 3x12x2x5


## 데이터 웨어하우스 Datawarehouse DW
(revenue_cube<-
    tapply(sales_fact$amount,
           sales_fact[,c("prod","month","year","loc")],
           FUN=function(x){return(sum(x))}))

# 문제 : 제품별 판매액을 계산하시오
totalamount<-
    tapply(sales_fact$amount,
           sales_fact[,"prod"],
           FUN=function(x){return(sum(x))})
# 문제 : 지역별, 제품별 판매액을 계산하시오.
totalamountgroup<-
  tapply(sales_fact$amount,
         sales_fact[,c("loc","prod")],
         FUN=function(x){return(sum(x))})
# 문제 : 2012년도 1월 테블릿에 대한 판매현황을 출력하시오오
sum(sales_fact$amount[sales_fact[1]==1&sales_fact[2]==2012])

revenue_cube["Tablet","1","2012",]
revenue_cube

apply(revenue_cube,c("year","prod"),FUN=function(x){return(sum(x,na.rm=T))})

dim(revenue_cube)
#보는 관점 즉 범주별로 지정하면 나머지 축의 값들은 모두 합계되어서 나타난다.

# 문제: 제품별로 연도별 월별 매출액 확인
tapply(sales_fact$amount,sales_fact[,c("prod","year","month")],FUN=function(x){return(sum(x))})
apply(revenue_cube,c("prod","year"),FUN=function(x){return(sum(x,na.rm=T))})
# 연도별 월별 작업
yrmo<-tapply(sales_fact$amount,sales_fact[,c("year","month")],FUN=function(x){return(sum(x))})
apply(revenue_cube,c("year","month"),FUN=function(x){return(sum(x,na.rm=T))})
# 매장별 제품별로 월별 매출액 확인 
loprmo<-tapply(sales_fact$amount,sales_fact[,c("loc","prod","month")],FUN=function(x){return(sum(x))})
apply(revenue_cube,c("loc","prod","month"),FUN=function(x){return(sum(x,na.rm=T))})

#차원 확대시키는 것 : group by
#차원 축소시키는 것 : apply

#로딩된 패키지 확인 
search()
mean(iris$Sepal.Length)
# with within

head(iris)
iris[1,1] =NA
median.per.species<-sapply(split(iris$Sepal.Length,iris$Species),median,na.rm=T)
iris<-within(iris,{
  Sepal.Length<-ifelse(is.na(Sepal.Length),median.per.species[Species],Sepal.Length)
})

mtcars
# 실린더가 4또는 6개인 자동차들 중 연비,실린더수,변속기 종류를 출력
str(mtcars)

mtcars[which(mtcars$cyl==c(4,6)),c("mpg","cyl","am")]
# 연비가 20보다 큰 데이터중 연비,실린더 수 , 변속기 종류 출력

mtcars[which(mtcars$mpg>20),c("mpg","cyl","am")]

#평균 마력 이상인 자동차 중 연비, 실린더, 변속기를 출력
mtcars[which(mtcars$hp>=mean(mtcars$hp)),c("mpg","cyl","am")]

#mtcars의 연비에 대해서 min/max 정규화 해보시오
(mtcars$mpg -min(mtcars$mpg))/(max(mtcars$mpg)-min(mtcars$mpg))
#위를 with문을 이용해서 표현해보시오
a<-with(mtcars,{
  (mpg-min(mpg))/(max(mpg)-min(mpg))
})

# merge
x<-data.frame(name=c("a","b","c"),math=c(1,2,3))
y<-data.frame(name=c("a","b","d"),english=c(4,5,6))
merge(x,y) #키가 일치하는경우
merge(x,y,all=TRUE) # 모든경우 없으면 NA

merge(x,y,all.x=TRUE) #left join
merge(x,y,all.y=TRUE) #right join
merge(x,y,all=TRUE)   #full join

#search

search() 
attach(airquality) # 데이터를 패키지처럼 로딩
transform(Ozone,logOzone=log(Ozone))
search()
detach(airquality)
search()
ls()

#subset 추출

subset(iris,subset=(Species=="setosa")) #조건
subset(iris,subset=(Species=="setosa"&Sepal.Length>5.0))
subset(iris,select=c(Sepal.Length,Species)) #열 선택
subset(iris,select=-c(Sepal.Length,Species))

# 실린더가 4~6개인 자동차들 중 연비,실린더수,변속기 종류를 출력
str(mtcars)
subset(mtcars,subset=(cyl>=4 & cyl<=6),select=c(mpg,cyl,am))
# 실린더가 4또는 6개 연비 실린더 변속기 마력 출력
subset(mtcars,subset=(cyl==4 |cyl==6),select=c(mpg,cyl,am,hp))
#이러면 안됨 subset(mtcars,subset=(cyl==c(4,6)),select=c(mpg,cyl,am,hp)) # 이

#문제 
#연비(mpg)가 20보다 큰 자동차들 중 연비,실린더수,변속기종류를 출력
subset(mtcars,subset=(mpg>20),select=c(mpg,cyl,am))
#변속기가 자동이고 실린더가 4,6개인 자동차들의 연비 평균은?
subset(mtcars,subset=(am==0&cyl==4|cyl==6),select=mean(mpg))

(test<-c(1,1,7,8,12,14))
quantile(test)
