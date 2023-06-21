Sys.getenv("JAVA_HOME")
Sys.getlocale()
ls()

# -<대입, =equal
x<-5
x

typeof(x) # double이 기본
mode(x) #데이터 타입입
class(x) #자료구조
# 정수형 변환
x = as.integer(x) #R에서는 .이 이름으로 사용
y<-x
x<-10 #값에 의한 전달을 하고 있음
y
x

z="대한민국"
print(z)
z
typeof(z)
mode(z)
class(z)

x+y
x-y
x*y
y/x
y%/%x
y%%x
y^x
x+z #자바라면 암묵적 캐스팅으로 String으로 출력됨 R에선 에러

# 비교연산자 관계연산자 (TRUE/FALSE) 
x<-5
y<-16
x+y
x>y
x<=5
x>=20
y==16
x!=5
(x<-c(TRUE,FALSE,0,6)) #combine ->vector 
#(가장 바깥에 괄호 넣으면 값 넣고 바로 출력)
(y<-c(FALSE,TRUE,FALSE,TRUE)) #boolean

x+1 # for문을 사용하지 않음, vector화 연산 
#거짓에 하나를 더하면 참이 되고 참에 하나를 빼면 거짓이된다..
!x # 데이터를 TRUE/FALSE로 자동변환하고 부정

x&y #개별연산
x&&y #통합연산

# 숫자를 벡터화 할 때
v<-2:8
v
v1<-8
v2<-12

t<-1:10
v1%in%t # matching 연산자
print(v1%in%t)
print(v2%in%t)

#행렬 matrix (vector로 부터 생성)
#2X3 행렬
(M=matrix(c(2,6,5,1,10,4),nrow=2,ncol=3,byrow=TRUE)) #byrow=TRUE 행방향으로 
t(M) #transpose 전치행렬 행과 열의 순서를 변경 (행렬곱을 하기 위해)
# 행렬곱 앞 행렬의 열수와 뒤 행렬의 행수가 일치해야함
# 결과는 앞 행렬의 행수 X 뒤행렬의 열수
# 앞의 행렬 2X3
# 뒤의 행렬 3X2
t=M%*%t(M)
print(t)

# 행렬의 거듭제곱하려면 행렬의 전치행렬을 구해서 행렬곱
num <-6
num^2
num
num<-num^2*5+10/3
num

c(1,3,5,7,9) *2
c(1,3,5,7,9) *c(2,4) #recycling
c(1,3,5,7,9,10) *c(2,4)
c(2,4) *c(1,3,5,7,9,10) # 리사이클링을 이용해서 개수를 맞춤

factorial(1:5) # 함수의 매개변수의 기본이 vector
factorial(c(1,2,3,4,5))

exp(2) # 밑을 자연대수로 하는 지수
exp(2:10)
sqrt(c(1,4,9,16))
cos(c(0,pi/4))

?exp
1/0 #Inf 무한대
0/0 #NaN 수가 정의되지 않음 , NA는 결측치
-1/0 
sum(c(1,2,NA,3)) # 연산에서 결측치가 하나라도 있으면 NA
#반드시 결측치 처리를 해야한다.

vec<-c(0,Inf,NaN,NA)
typeof(vec)
mode(vec)
class(vec)
is.finite(vec) #확인함수 is
is.nan(vec)
is.na(vec)
is.infinite(vec)
sum(vec)

`%divisible%` <-function(x,y)
{
  if(x%%y==0) return(TRUE)
  else return(FALSE)
}
10%divisible%3
10%divisible%2
`%divisible%`(10,5)

#
x<-c(5,6,7)
y<-c(1,2,3)
x%%y
x%*%y # (%*%행렬곱에서 사용)  벡터곱을 내적이라고 함 
#내적은 크기값을 고려한 사이각이다.

LETTERS
letters
month.abb #abb 축약어
month.name
pi
ls() # 메모리에 있는 변수 확인
int <-50
int
typeof(int) # int를 변수명으로 사용해도 무방

#통계함수
score<-c(85,95,75,65)
score
mean(score)
avg<-sum(score)/4
sum(score)

var(score) # 분산이 큰 변수가 중요하다(주성분이다)
sum((score-avg)*(score-avg))/3
sd(score)

sqrt(var(score))

# 
score <-c(85,95,NA,75,65)
score
sum(score)
mean(score,na.rm=TRUE)
sum(score,na.rm=T)

x<-c(10,20,30,'40')
mode(x)
typeof(x)
(xx<-as.numeric(x))
mode(xx)

#R에서는 데이터를 정성적(질적)데이터,정량적(양적)데이터 
#정성적데이터: factor형 데이터, 범주형 데이터
#정량적데이터: 이산적데이터,연속적데이터

gender<-c('M','F','M','F','M')
gender
mode(gender)
class(gender)
plot(gender)

fgender <-as.factor(gender) # 변환함수
fgender
fgender[2]
mode(fgender) #numeric
class(fgender)# factor
plot(fgender) # 숫자로 매핑됨

Sys.Date()
Sys.time()
today <-'2023-03-20 11:56:50' # 입출력은 문자열 계산은 특별 숫자계산
(today2<-as.Date(today))
ctoday<-strptime(today,'%Y-%m-%d %H:%M:%S') # 문자열을 날짜로 분해
ctoday

?sum
args(sum)
example(sum)

data()
Nile #시계열 데이터
length(Nile)
plot(Nile)

# vector: 배열 개념으로 저장(ArrayList)
# 왜 vector인가? 데이터를 선형대수로 처리하겠다.
# vector : 동질적 데이터를 담음
# vector의 기본연산 (+ - * / 요소별로 연산)
# 내적과 외적
# 두 벡터가 이루는 면의 수직 벡터를 이용해서 음영을 줄 때 사용
# 내적은 요소끼리 곱한다음 다 더하면 크기가 고려된 사이각
# 유사도(추천) 와 거리(군집분석)
# 사이각이라면 각은 사이즈가 1이다. 곱셉의 항등원 1
# 덧셈의 항등원 0
# 하나의 벡터에서 크기값은 

x<-c(1,5,4,9,0) # 벡터는 위아래로 저장 
class(x)
length(x)
NROW(x)
NCOL(x)
x
#vector ->matrix -> array 동질적 데이터
#vector-> 이질적인 요소로 구성된 dataframe
#데이터프레임임 열내 동질적, 열간 이질적
#matrix array dataframe은 사각형으로 이빨이 빠지면 안됨
#list는 이빨이 빠져도 됨 

(x=vector("list",10))
(x=vector("numeric",10))
rm(x)
(y<-2:-2)
seq(1,3.2,by=0.2) # 간격 지정 
seq(1,5,length.out=4) #개수지정
seq(1,6,length.out=4)
seq(98,74,length.out=3)

(b<-rep(1:4,2))
(d<-rep(1:3,each=3))
(d<-rep(1:3,2,each=3)) # each가 먼저 적용

x<-c(1:9)
x
(x[3]<-3)
x[c(2:4)] #벡터를 이용해서 인덱싱
x[-1] # 제외하고

x[c(2,-4)] # 양수 음수 복합 안됨
x[c(2.4,3.54)] #소수점은 절사
x[c(TRUE,FALSE,FALSE,TRUE)] #boolean indexing
x[x<3]
x[x>3] #관계연산자를 이용한 인덱싱

(x<-c("first"=3,"second"=0,"third"=9))
x["second"] #키 데이터 접근방법법
x[c("first","third")]

#비교
c(1,2,3) ==c(1,2,100)

x<-1:5
all(x>2) #모두 조건만족
any(x<2)#하나라도 조건만족

#정렬 원본에 영향미치지 않음
x <-c(3,2,6,4,5,8,1)
sort(x)
sort(x,decreasing=TRUE)

#인덱스 정렬 하나의 열을 기준으로 다른 데이터를 정렬하고 싶은 경우
#두개의 열에 대하여 하는 기준 하나 정렬된 참조
#국어 점수를 기준으로 이름을 참조조
order(x)
order(x,decreasing=TRUE)
x[order(x)]

#NA 결측치
sum(2,7,5)
x=c(2,NA,3,1,4)
sum(x)
sum(x,na.rm=TRUE)
mean(x,na.rm=TRUE)
median(x,na.rm=TRUE) #중위수 ( 이상치를 고려하기 때문에)
prod(x,na.rm=TRUE)

#벡터에 이름 정하기
vectorA <-c(1,2,3,4)
names(vectorA)<-c("국어","영어","수학","과학")
vectorA

vectorA["국어"]
vectorA[2]
vectorA[-1]
vectorA[c(1,3)] # 벡터 인덱싱 (subset)

vectorA[vectorA>2]
vectorA[c(FALSE,FALSE,TRUE)]
append(vectorA,c(3,4,5)) #원래데이터에 영향을 미치지 않음: 값에 의한 전달이여서
vectorA
(vectorB=append(vectorA,c(3,4,5)))

#집합연산
union(vectorA,vectorB) #합집합
intersect(vectorA,vectorB)#교집합
setdiff(vectorA,vectorB) #차집합
setdiff(vectorB,vectorA)
setequal(vectorA,vectorB)#체크함수

#인덱스를 리턴하는 것들은 하나를 기준으로 다른 데이터를 참조할 때
(x<-c(3,2,6,4,5,8,1))
subset (x,x>3)
which(x*x>8) #인덱스를 찾을 때 

#확률

#복원추출
(x<-c(sort(sample(1:3,3,replace=T,prob=c(0.1,0.3,0.2)))))

nums<-c(5,8,10,NA,3,11)
nums
which.min(nums)
which.max(nums)
nums[which.min(nums)]
nums[which.max(nums)]

#문제
#1) vector1 벡터 변수를 만들고 "R 문자가 5회 반복되도록하시오
(vector1<- "R")
rep(vector1,each=5)
#2) vector2벡터 변수에 1~20까지 3간격으로 연속된 변수를 만드시오
(vector2<-seq(1,20,by=3))
#3) vector3에는 1~10까지 3간격으로 연속된 정수가 3회 반복되도록 만드시오
(vector3test<-seq(1,10,3))
(vector3<-rep(vector3test,each=3))
(vector3<-rep(seq(1,10,3),3))
#4) vector4에는 vector2-vector3가 모두 포함되는 벡터를 만드시오
(vector4<-setdiff(vector2,vector3))
#5) 25~-15까지 5간격으로 벡터 생성 seq()함수 이용
(vectorno5<-seq(25,-15,by=-5))
#6) vector4에서 홀수번째 값들만 선택하여 vector5에 할당하시오(첨자이용)
(vector5<-vector4[seq(1,length(vector4),by=2)])
#7) vector5에서 짝수번째 값들만 선택하여 vector6에 할당하시오(첨자이용)
(vector6<-vector5[seq(2,length(vector5),by=2)])
#8) vector5의 데이터를 문자로 변경하여 vector7에 저장 (as.character())
(vector7<-as.character(vector5))
#9) vector5와 vector6을 벡터 연산하여 더하시오
vector5+vector6
#10) vector5와 vector7을 벡터연산하여 더하시오 (as.numeric())
vector5+as.numeric(vector7)

#packages:base packages(R studio가 로딩할 때 자동으로 로딩),
#recommended packages(설치는 되어 있는데 로딩이 안된 패키지),
#others(설치도 안되어 있고 로딩이 안된 것들)
#install.packages("NISTunits") #설치
library(NISTunits)
NISTdegTOradian(180) #각도 ->라디안
# 각도에서 sin(x),cos(x)의 값의 범위 -1~1 사이의 값을 가짐
# 반지름이 1인 원에서의 계산

NISTdegTOradian(pi)
rad1 <-NISTdegTOradian(45)

#밑변 길이와 높이를 구하시오
a<-cos(rad1)
b<-sin(rad1)
a^2+b^2

c<-acos(a)
NISTradianTOdeg(c)
#삼각함수,지수함수,로그함수 ->초월함수 (+-*/로 값을 구할 수 없음: 즉 대수적으로 정확한 값이 없음)
#극한
#회전, 주기적으로 값이 변화하는 경우

#벡터 -> 정규화 (normalize)
#min-max 정규화, normalize, z점수 정규화
#모든 값을 0~1사이의 값으로 전환
# 정규화를 하는 이유 독립변수의 영향력을 균등하게하기위해서