# matrix
# 동질적 vector가 열로 여러개 모여 있는 행렬
# 데이터 변환,데이터처리
# 공간매핑:MRS
# 데이터처리: 차원감소(시각화:3차원(컬러값,선타입)), 특징추출
# 시각화 없이 데이터를 이해하는 것은 불가능 
# 100개의 변수라면 시각화 어려움100차원 (2차원,3차원으로 표현해야함)
# 특징이 많으면 복잡 -> 특징 추출을 통해 차원을 감소시켜야함

# 클래스를 함수로 만들어 함수베이스 프로그래밍이다.
# 사각형을 유지해야함 
(a=matrix(1:9,nrow=4,ncol=3,byrow=TRUE))
matrix(1:17,nrow=3)
class(a)
attributes(a) #차수 dimension

x<-matrix(1:9,nrow=3)
colnames(x)
colnames(x)<-c("c1","c2","c3")
rownames(x)<-c("R1","R2","R3")
x
# 왜 dimnames는 리스트로 전달 될 까?
# 리스트는 열별 행별 개수가 달라도 되기 때문에
(x<-matrix(1:9,nrow=3,dimnames=list(c("x","y","z"),c("A","B","C"))))

# 선형대수를 동질적 데이터에만 가능 이질적데이터 불가능
# dataframe에는 행렬 연산이 적용되지 않음
# 빈 매트릭스를 만들고 값을 지정
y<-matrix(nrow=2,ncol=2)
y[1,2]
y[1,1]<-1
y[2,1]<-2
y[1,2]<-3
y[2,2]<-4
mode(y)
class(y)

cbind(c(1,2,3),c(4,5,6)) # column bind
rbind(c(1,2,3),c(4,5,6)) # row bind

# matrix의 attribute는 dim이 있음
(x<-c(1,2,3,4,5,6)) # vector
dim(x) #dim(x)의 정보가 없음 
(dim(x)<-c(2,3))
x

(x<-matrix(1:9,nrow=3,byrow=T))
(y<-matrix(11:19,nrow=3,byrow=T))
(c<-rbind(x,y))
(d<-cbind(x,y))

(x=matrix(1:9,nrow=3,byrow=T))
x[c(1,2),c(2,3)]
x[c(2,3),] # 없으면 모두 다
x[,]
x[-1,] # 1행이 없다는 뜻 (-1)
(a=x[1,])
class(a)
x[c(TRUE,FALSE,TRUE),c(TRUE,TRUE,FALSE)]
x[c(TRUE,FALSE),c(2,3)]
x[c(TRUE,FALSE)] # 하나의 벡터로 보고 데이터 추출

x[x>5]
x[x%%2==0]

(mdat<-matrix(seq(20,4,-2),nrow=3,ncol=3,byrow=TRUE,
              dimnames=list(c("a","b","c"),c("x","y","z"))))
t(mdat)
nrow(mdat)
ncol(mdat)
dim(mdat) # 차수
rowMeans(mdat) # 행 방향으로
rowSums(mdat) # 열 개수만큼(행이 없어지는 것)
colMeans(mdat) # 행 개수만큼
colSums(mdat)
#행렬의 대각선에 있는 값의 의미:크기를 결정 
diag(mdat)
diag(20,12,4)

# 벡터는 크기와 방향값을 표현
eigen(mdat) # 고유값 분해(크기와 방향 분해)
# 고유치 + 고유벡터
# 고유치 : 축방향으로의 크기 
# 고유벡터 : 축의 방향을 의미
# 정방행렬이면서 대칭행렬(상관계수행렬,거리값 행렬)
# 에 대하여 고유값 분해를 하면 
# 고유벡터가 othogonal하다 (정직교) 
# 고유값분해를 하여 생성되는 고유벡터에 데이터를 재표현하면
# noise가 사라진다.
# =>주성분분석(Principal Component Analysis)
svd(mdat) #singular value decomposition 특이행렬분해:
# 비 정방행렬에 사용
# 비 정방행렬에는 정방행렬도 포함이 된다.
# 희소행렬에서 특징추출을 분해할때 사용
# 희소행렬(sparce matrix):요소가 0이 많은 경우
# 마트에서 장을 본 이후에 저장된 벡터
# 텍스트 분석에서 사용하는 단어벡터

# y=ax
# y=10x 일때 y값이 20이라면 x 값은
solve(10,20)

# 2x+3y=5
# 3x+5y=6
(mdat<-matrix(c(2,3,3,5),nrow=2,ncol=2,byrow=T))
(c=c(5,6))
solve(mdat,c)  # solve(계수값,함수값)
#x=7,y=-3 

# matrix의 등장은 방정식의 해를 푸는 도구
# 연립방정식의 해를 구하시오 계산과정에서 발생하는 매트릭스의
# 행의 합,행의 평균, 열의 합, 열의 평균을 구하시오
# 1x+3y+5z=10
# 2x+5y+1z=8
# 2x+3y+8z=3
(matrixtest<-matrix(c(1,3,5,2,5,1,2,3,8),nrow=3,ncol=3,byrow=T))

(solvetest<-c(10,8,3))
solve(matrixtest,solvetest)
rowMeans(matrixtest)
rowSums(matrixtest)
colMeans(matrixtest)
colSums(matrixtest)
# solve가 하는일은  첫 매개변수를 역행렬로 구하고 다음 매개변수와 
# 행렬곱해서 
(inv_m<-solve(matrixtest))
inv_m %*% solvetest
identity_m<-inv_m %*% matrixtest
identity_m %*% inv_m
# 행렬은 나눗셈이 없다. 역행렬 이용해서 곱함

# Matrix operation 문제
# 다음 두 매트릭스를 rbind,cbind를 이용하여 묶으시오
# 다음 두 매트릭스의 사칙연산을 구하시오
# 다음 두 매트릭스의 행렬내적(곱:%*%)을 구하시오

# 1 2 3 4 5
# 6 7 8 9 10
# 11 12 13 14 15

mat1<- matrix(seq(1,15),nrow=3,byrow=T)
test <- matrix(1:15,nrow=3)
mat2<- matrix(seq(16,30),nrow=3,byrow=T)
test2<- matrix(16:30,nrow=3,byrow=T)

rbind(mat1,mat2)
cbind(mat1,mat2)
mat1+mat2
mat1-mat2
mat1/mat2
mat1 %*% t(mat2)

#cos  0   sin
#0    0   0
#-sin 0   cos

vector1 <-c(5,9,3)
vector2 <-c(10:14)
result<- array(c(vector1,vector2),dim=c(4,3,2)) # 면행렬->행렬면 
print(result)

# 3차원 데이터
column.names<-c("COL1","COL2","COL3")
row.names<-c("ROW1","ROW2","ROW3")
matrix.names<-c("Matrix1","Matrix2","Matrix3","Matrix4","Matrix5")
result<-array(c(11:19,21:29,31:39,41:49,51:59),dim=c(3,3,5),
              dimnames=list(row.names,column.names,matrix.names))
print(result)
print(result[3,,2])
result[,"COL1","Matrix1"]
# 2면에 있는 데이터 모두 출력
result[,,2]
# 2번 매트릭스 3행2열에 있는 데이터
result[3,2,2]
# 1번 매트릭스 2행 3열 데이터
result[2,3,1]
# 2번 매트릭스 1행 3열 데이터
result[1,3,2]
# 3번 매트릭스 2행 2열
result[2,2,3]
# 3번 매트릭스 2행 3열
result[2,3,3]
# 4번 매트릭스 3행 2열
result[3,2,4]
# 5번 매트릭스 3행 1열
result[3,1,5]

# data.frame
# 사각형 유지해야하고 열내 동질적이고 열간 이질적인 데이터
# R은 데이터를 표현할 때 열 중심으로 
#데이터를 저장하고 통계처리에 유리 (10배 빠름) 
# 데이터를 실시간으로 추가할 수 있음(javascript)

x<-c(10,20,30,40)
y<-c(6,7,8,9)
# 변수의 개수가 특성의 개수를 의미
(data<-data.frame(width=x,height=y)) # 처음부터 열 이름을 붙여 사용
str(data)
data$width # $뒤에는 열이름이 온다.
data[,1] # matrix방식으로 접근가능
head(data)
data$delinetr=c(30,40,50,60) # 실시간 데이터 추가
data
edit(data)

L3 = LETTERS[1:3]
d<-data.frame(cbind(x=1,y=1:10),fac=sample(L3,10,replace=TRUE))
d
d$fac
(d$yhat<-d$fac)
d$yhat
str(d)
head(d)
# 범주형 변수
d$fac=factor(d$fac)
rownames(d)=c("일","이","삼","사","오",'육',"칠","팔","구","십")
d
x<-data.frame("SN"=1:2,"Age"=c(21,15),"Name"=c("에어컨","삼성SDS"))
str(x)
x$Name # 문자열로 참조
x["Name"] #data.frame으로 참조
ncol(x)
nrow(x)
length(x) # x는 2차원 => 2차원에서는 열의 개수를 의미
x["Age",1]<-20; # Age 행이 생성
x
x[1,"Age"]<-25;
x
x$SN<-NULL
data()
str(trees)
head(trees)
tail(trees)
trees[2:3,]
trees[trees$Height>82,] # 조건식으로 boolean indexing
trees[10:12,2] # numeric
trees[10:12,2,drop=FALSE] # data.frame
summary(trees) #데이터를 열로 봄
#Min 최소값 , 1st quantile(1사분위수), meadian 중위수
#mean 평균 3rd quantile(3사분위수) max 최대값
#데이터 이상치 여부를 확인하고 싶다
boxplot(trees)
# 3사분위수-1사분위수 : inter Quantile range
# 3사분위수 +IQR*1.5 상한이상치
# 1사분위수 -IQR*1.5 하한이상치 

# Data Cleaning 데이터 전처리
# 결측치처리 NA : 제거,평균으로 대체,비슷한 데이터로 대치
# 이상치처리 boxplot(trees) 신뢰구간을 구한다음 
# 2사분위수를 넘어가는 것 제외
# 정규화 min max,nomalize, z점수
## 범주화

pairs(trees) #변수간의 상관도를 출력: 대칭행렬
# 상관계수 행렬은 대칭행렬이다.
"C:\\Users\\401-14\\Documents"
data<- read.csv("C:/Users/401-14/Documents/input.csv",fileEncoding="utf-8",encoding="CP949",header=TRUE)
data <- read.csv("C:\\Users\\401-14\\Documents\\input.csv", fileEncoding="utf-8",encoding="CP949",header=TRUE)
colnames(data)[1]<-"id"
print(data)
print(is.data.frame(data))
ncol(data)
nrow(data)
sal <-max(data$salary)
print(sal)
(retval<-subset(data,salary==max(salary))) # 조건에 맞는 걸 가져와라

#install.packages("stringr")
library(stringr) # 문자열 다룰 때는 stringr
(retval<-subset(data,str_trim(dept)=="전산"))
(info<- subset(data,salary>600&str_trim(dept)=="전산"))
(retval<-subset(data,as.Date(start_date)>as.Date("2014-01-01")))
write.csv(retval,"output.csv")
(newdata<-read.csv("output.csv"))

#문제 1) 다음 데이터를 데이터 프레임에 입력하시오
#     영어 등급
#퀴즈 67   "C"
#중간 92   "A"
#기말 89   "B"
eng<-c(67,92,89)
grade<-c("C","A","B")
colname=c("영어","등급")
rowname=c("퀴즈","중간","기말")
data<-data.frame("영어"=eng,"등급"=grade,row.names=rowname)

# 문제2) 수학점수를 50,100,80 입력 (열로추가)
# 보충이라는 이름으로 dataframe을 만들어 rbind(행으로추가)
# 영어점수 90 등급 A 수학 100
data$"수학"<-c(50,100,80)
da<-data.frame("영어"=c(90),"등급"="A","수학"=c(100),row.names="보충")
data2<-rbind(data,da)
#열별 합계를 계산해서 데이터에 추가
(hab<-colSums(as.matrix(cbind(data2$"영어",data2$"수학"))))
hab[1]
dasum<-data.frame("영어"=hab[1],"등급"=0,"수학"=hab[2],row.names="합계")
data3<-rbind(data2,dasum)
# 국어 점수를 추가하시오(90,80,100,77)
kor<-c(90,80,100,77)
korsum<-sum(kor)
data3$"국어"<-c(kor,korsum)
data3
write.table(data3,file="sungjuk.csv",sep=",",col.names=NA)
(data4<-read.table("sungjuk.csv",header=TRUE,sep=","))

#정규분포: 평균이0이고 전체확률이 1인 분포
((x<-rnorm(400,mean=50,sd=10)))
# 표준정규분포표 (확률확인 가능)
# z=데이터-mean/sd 
max((z<-(rnorm(400,mean=50,sd=10)-50)/10))
hist(x)

x<-runif(40000,min=0,max=100) #uniform 균등분포
hist(x)
x<-floor(runif(400,min=0,max=100))
plot(x)
plot(c(data4$"수학"[1:4]),main="그래픽",col="red",ylab="수학점수",xlim=c(0,4),ylim=c(0,100),type="b")
# type="b" both: line+dot

# 문제 수학의 평균,중위수,분산,표준편차
suhak<-data4$"수학"[1:4]
mean(suhak)
median(suhak)
var(suhak)
sd(suhak)

# 문제 다음과 같은 벡터를 컬럼으로 갖는 데이터 프레임을 생성하시오 
name<-c("대한이","민국이","만세야","희망이","다함께")
age<-c(55,45,45,53,15)
gender<-c(1,1,1,2,1)
job<-c("연예인","주부","군인","직장인","학생")
sat<-c(3,4,2,5,5)
grade<-c("C","C","A","D","A")
total<-c(44.4,28.5,43.5,NA,27.1)

information<-data.frame("이름"=name,"나이"=age,"성별"=gender,"직업"=job,"만족도"=sat,"등급"=grade,"총 구매금액"=total)
str(information)
information$"성별"<-as.factor(information$"성별")
str(genderfactor)
#문제2: 성별 변수를 이용해서 히스토그램 그리기 hist
hist(as.integer(information$"성별"),main="성별분포",xlab="성별(남자,여자)",xlim=c(1,2),ylab="인원",col="lightblue")

#문제3: 만족도 변수를 이용해서 산점도 그리기 plot
plot(information$만족도,main="만족도 산점도",col="red",ylab="만족도",ylim=c(0,5))

#문제4: 총 구매금액에 대하여 평균과 분산 표준편차구하기
mean(information$총.구매금액,na.rm=T)
var(information$총.구매금액,na.rm=T)
sd(information$총.구매금액,na.rm=T)

#문제 : 다음데이터를 데이터 프레임을 만드시오
name<-c("유관순","홍길동","이순신","신사임당")
gender<-c("F","M","M","F")
price<-c(50,65,45,75)

client<-data.frame(name=name,gender=gender,price=price)
#조건1 price가 65이상인 고객은 Best 미만이면 Normal 문자열을
#result 변수에 넣고 client 파생변수로 추가하시오 
client$result=ifelse(great$price>=65,"Best","Normal")

#조건2 result 빈도수를 구하시오 
#3항연산자
#도수분포표 (table)
table(client$result)

#조건3 gender "M"이면 Male "F"면 Female 형식으로 client의
#파생변수로 추가하시오
client$gender_origin<-ifelse(client$gender=="M","Male","Female")
# list 
# 이질적인 데이터를 가질 수 있고 사각형을 유지하지 않아도 된다.
x<-c(82,95,78)
y<-c(84,92)
z<-c(96,86,82,77)
(core<-list("수학"=x,"영어"=y,"국어"=z)) # $로 접근하는 것은 동일
typeof(core)
length(core)
str(core)
# data.frame과 형식이 비슷함 but 사이즈가 다름
# 리턴 데이터로 참조해야 되는 경우가 많음
(x<-list("name"="에이콘","age"=19,"speaks"=c("한국어","영어")))
x$name
x[c(1:2)]
x[-2]
x[c(T,F,F)]
x[c("age","speaks")]
x["age"]
typeof(x["age"])
x[["age"]] # 두개면 그 안의 요소로 가져옴
typeof(x[["age"]])

a<-list(c(1:5))
b<-list(6:10)
lapply(c(a,b),max) # 함수 호출은 max(데이터): 함수의 매개변수로 함수를 전달할 때는 ()를 붙이지 않음

#factor형 (범주형 데이터: 무순서, 순서 범주데이터) : 정성적 데이터 
gender<-c('M','F','M','F','M')
gender
plot(gender)
fgender<-as.factor(gender)
fgender
fgender[2]
mode(fgender):class(fgender)
plot(fgender)

(x<-factor(c("single","married","married","single",levels=c("single","married","divorced"))))

str(x)
levels(x)
x[3]
x[c(2,4)]
x[-1]
x[2] <-"divorced"
x[3] <-"windowed" #levels에 없기 때문에 입력불가

(x=c(1:100))
cut(x,breaks=4) # 구간범주화:분석은 범주형  # 구간 갯수로 범주화
# 함수 충돌 방지하는 패키지:: 
z<-stats::rnorm(10000) # rnorm을 패키지마다 다르게 정의 할 수도 있음
z
table(cut(z,breaks=-6:6)) # 일정한 구간으로 범주화
graphics::hist(z,breaks=-6:6)

#전처리, data transform ->가장중요
