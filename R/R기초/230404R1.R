# 연관분석 ( Association analysis ) : 장바구니 분석
#install.packages("arules")
library(arules) # apriori를 구현한 패키지
data("Adult") # transactions 거래행렬 ( 범주형데이터에 대해서 행렬로 구성)
 # ngCMatrix : sparse matrix(희소행렬) : 텍스트 마이닝에서도 발생생
 # 마트의 품목을 많음 -> 장바구니(희소)
 # 희소행렬을 표현하는 방법 : (인접행렬(공간낭비),그래프 표현(메모리는 절약, 처리시간 증가))
str(Adult) 
# @가 나오면 S4 class
# S3는 함수를 이용해서 클래스 생성(R은 함수(1급객체)를 이용하는 프로그래밍)
rules<-apriori(Adult) # set of 6137 rules 
rules.sub<-subset(rules,subset=rhs %in% "marital-status=Never-married" &lift>2)
rules.sub # set of 58 rules
inspect(rules.sub)

rules.sub<- subset(rules,subset=lhs%ain%
                     c("age=Young","workclass=Private"))
inspect(rules.sub)
#중요한 rule을 생성하고자 할 때 parameter를 이용한 제약(support와 confidence를 이용한 제약)
rules<-apriori(Adult,parameter=list(supp=0.5,conf=0.8,minlen=2)) # 80 rules
inspect(rules)
#install.packages("arulesViz")
library(arulesViz)
plot(rules,method="graph",engine="interactive")

white.lhs<-subset(rules,lhs %in% "race=White")
length(white.lhs)
inspect(white.lhs)

# 문제 : race=White, native-country=United-State 인 것이 lhs에 나타나는
# rule 조합을 선택해 보세요

# in, ain, pin
# pro_lhs<-subset(rules,lhs %in% c("race=White","native-country=United-State")) # 내가 짜본 것(오류)

WhiteORus.lhs<-subset(rules,lhs %in% "race=White",lhs %in% "native-country=United-States")
inspect(WhiteORus.lhs)

# rules에 대하여 support와 confidence를 이용해서 정렬하고 상위 3개만 출력
sortRules<-sort(rules,by="support",desc=T)
head(inspect(sortRules),2)
inspect(head(rules,2))
inspect(head(sort(rules,decreasing = T,by=c("support","confidence")),3))
?sort # 오버로딩

adult<-as(Adult,"data.frame")
str(adult)
head(adult)

ar<-apriori(Adult,parameter=list(supp=0.1,conf=0.8))
ar2<-apriori(Adult,parameter=list(supp=0.2,conf=0.95))
ar6<-apriori(Adult,parameter=list(supp=0.5,conf=0.8))
inspect(head(ar6))
rules<-apriori(Adult,parameter=list(support=0.3,confidence=0.5),
               appearance=list(rhs="relationship=Husband"),control=list(sort=-1))
inspect(rules)
?apriori

# 문제
# 1)최소 support=0.5 최소 confidence=0.8을 지정하여 연관규칙 생성
test1<-apriori(Adult,parameter=list(supp=0.5,confidence=0.8))
# 2)연관 분석결과를 연관이 네트워크 형태로 시각화
plot(test1,method="graph")
plot(test1)
# 3)lhs가 White인 규칙만 subset으로 작성하고 연관어 시각화
test1sub<-subset(test1,lhs %in% "race=White")
plot(test1sub,method="graph")

data("Groceries")
str(Groceries)
inspect(Groceries)
summary(Groceries) # summary(Groceries) 연관분석에서 사용하면
size(head(Groceries))
LIST(head(Groceries,3)) # list # 연관분석인 경우
itemFrequencyPlot(Groceries,topN=15)
itemFrequency(Groceries[,1:5])

a_matrix<-matrix(c(
  1,1,0,0,0,
  0,0,1,0,0,
  0,0,0,1,1,
  1,1,1,0,0,
  0,1,0,0,0
),ncol=5,byrow=T)
dimnames(a_matrix)<-list(paste("Tr",c(1:5),sep=""),c("milk","bread","butter","beer","diapers"))

a_matrix
image(a_matrix)
trans2<-as(a_matrix,"transactions") # 희소행렬처리 포맷으로 변환

rule<-apriori(trans2,parameter=list(supp=0.01,conf=0.01)) #16
inspect(rule)
body<-read.csv("c:/Users/401-14/Documents/bodycheck.csv")

tran<-read.csv("c:/Users/401-14/Documents/tran.txt",header=F)

# 라면,맥주,우유,고기,과일
# 수작업(다음조합에 대하여 지지도,신뢰도,향상도를 구하시오)

# 맥주->고기 
1/nrow(tran);(1/nrow(tran))/(2/nrow(tran));(1/nrow(tran))/((2/nrow(tran))*(4/nrow(tran)))
# 라면,우유->맥주
1/nrow(tran);(1/nrow(tran))/(3/nrow(tran));(1/nrow(tran))/((3/nrow(tran))*(2/nrow(tran)))

matrixg <- matrix(c(
  1,1,1,0,0,
  1,0,1,1,0,
  1,0,0,1,1,
  0,1,1,1,0,
  1,0,1,1,0,
  0,0,1,0,1
), ncol = 5, byrow = T)
dimnames(matrixg) <- list(paste("user", c(1:6), sep=""),
                          c("라면", "맥주", "우유", "고기", "과일"))

matrixg<-as(matrixg,"transactions")

# 데이터를 데이터 베이스에 입력하고 로딩하여 처리하시오
library(dplyr)
library(dbplyr)
library(DBI)
library(rstudioapi)
library(RMySQL)
conn=dbConnect(MySQL(),user='root',password='acorn1234',dbname='Rtest',host='192.168.41.201')

dbListTables(conn)
matrixg<-as.data.frame(matrixg)
dbWriteTable(conn,"tran",matrixg)
dbListTables(conn)
dbListFields(conn,"tran")
db_tran<-dbReadTable(conn,"tran")
dim(db_tran)

res<-dbSendQuery(conn,"SELECT * FROM tran ")
res #MySQLResult (java에서는 ResultSet -> Class로 변환)
query_result <-dbFetch(res)
dim(query_result)
dbClearResult(res)
dbDisconnect(conn)


query_result<-as.matrix(query_result[-1])
image(query_result)

class(query_result)
query_result<-as(query_result,"transactions")
class(query_result)

# 연관분석을 통해
 # 적당한 지지도와 신뢰도를 결정하시오
apriori(query_result)
result<-apriori(query_result) #5 # support 0.1 confidence 0.8
inspect(result)
result2<-apriori(query_result,parameter=list(support=0.3,confidence=0.5,minlen=2)) #10
inspect(result2)
 # 결과를 해석하고 향상도를 이용해서 정렬한 다음 출력
sort(result2,by="lift",desc=T)
inspect(sort(result2,by="lift",desc=T))
plot(result2,method="graph",engine="interactive")


### 수업내용 ###
filepath<-"tran.txt"
data<-read.table(filepath,header=F,sep="\t")
#데이터 길이가 다른경우 ( list )
datalist<-list()
for(i in 1:nrow(data)){
  vector<-unlist(strsplit(data[i,1],","))
  datalist[i]<-list(vector)
}
datalist
#범주
(items<-unique(unlist(datalist))) # 라면 맥주 우유 고기 과일
# 6x5행렬 matrix

matrix<-matrix(0,nrow=nrow(data),ncol=length(items))
dim(matrix)
datalist[2]

for(i in 1:nrow(data)){
  for(datai in datalist[i]){
    matrix[i,match(datai,items)]<-1
  }
}

df<-data.frame(matrix,row.names=NULL)
colnames(df)<-items
print(df)

library(dplyr)
library(dbplyr)
library(DBI)
conn<-DBI::dbConnect(MySQL(),
                     user='root',
                     password='acorn1234',
                     dbname='Rtest',
                     host='192.168.41.201')

dbListTables(conn)

dbWriteTable(conn,"transaction_table",df)

# db에 테이블만 만들었을 경우
for(i in 1:nrow(df)){
  values<-paste0("(",paste(df[i,],collapse=","),")")
  query<-paste0("INSERT INTO transaction_table VALUES ",values)
  dbExecute(conn,query)
}

res<-dbSendQuery(conn,"SELECT * FROM transaction_table")
df<-dbFetch(res)
df
df<-as.matrix(df[-1])
df_tran<-as(df,"transactions")
rule<-apriori(df_tran)
rule<-apriori(df_tran,parameter=list(supp=0.6,conf=0.3,minlen=2,maxlen=3))
inspect(rule)
plot(rule,method="graph")


#
data(AdultUCI)
AdultUCI
str(AdultUCI)
Ad<-AdultUCI
dim(Ad)
head(Ad)
#<-as(,"transactions")

#1,3,5,11,12,13 연속형 변수
a<-apriori(AdultUCI,parameter=list(supp=0.5,conf=0.7,minlen=2))
inspect(a)
sum(is.na(Ad))
dim(Ad)

# 1 age
count(unique(AdultUCI["age"]))
min(AdultUCI$age);max(AdultUCI$age)
#c(15,25,45,65,100)
AdultUCI[["age"]]<-ordered(cut(AdultUCI[["age"]],c(15,25,45,65,100)),
                           labels=c("young","middle","senior","old"))

# 3 fnlwgt
AdultUCI["fnlwgt"]<-NULL
# 5 education-num
AdultUCI["education-num"]<-NULL
# 11 capital-gain
AdultUCI[["capital-gain"]]<-ordered(cut(AdultUCI[["capital-gain"]],
                                        c(-Inf,0,median(AdultUCI[["capital-gain"]][AdultUCI[["capital-gain"]]>0]),Inf)),
                                    labels=c("None","Low","High"))
# 12 capital-loss
AdultUCI[["capital-loss"]]<-ordered(cut(AdultUCI[["capital-loss"]],
                                        c(-Inf,0,median(AdultUCI[["capital-loss"]][AdultUCI[["capital-loss"]]>0]),Inf)),
                                    labels=c("None","Low","High"))
# 13 hours-per-week
AdultUCI[["hours-per-week"]]<-ordered(cut(AdultUCI[["hours-per-week"]],c(0,25,40,60,168)),
                                      labels=c("part-time","full-time","over-time","workaholic"))
Adult_new<-as(AdultUCI,"transactions")
basket_rules<-apriori(Adult_new,parameter=list(sup=0.08,conf=0.5,target="rules"))
inspect(basket_rules[1:10])
p<-inspectDT(basket_rules)
htmlwidgets::saveWidget(p,"arules_2.html",selfcontained=F)
browseURL("arules_2.html")


# 1) 가족관계 및 교육수준이 소득과의 연관
head(cbind(AdultUCI["education"],AdultUCI["relationship"]))
pro1<-apriori(cbind(AdultUCI["education"],AdultUCI["relationship"],AdultUCI["income"]),parameter=list(supp=0.05,conf=0.3),minlen=3)
inspect(sort(pro1,by="lift"))
plot(pro1,method="graph",engine="interactive")
# 2) 주당일하는 시간과 소득과의 관계
pro2<-apriori(AdultUCI[c("hours-per-week","income")],parameter=list(supp=0.1,conf=0.1),minlen=2)
inspect(pro2)
# 일하는 시간에 비례해서 소득이 늘어나는 약한 경향 

# 3) 보고싶은 연관 관계 여러개
?AdultUCI
mean(Ad$`capital-gain`)
?apriori

max(Ad$`capital-loss`)

# 신뢰도 0.1이상중에 lift가 가장 높은 관계 
#{age=young,
# relationship=Own-child                                support  confidence   lift 
# capital-gain=None} => {marital-status=Never-married} 0.1015315, 0.9708301, 2.942066      

Arules<-apriori(AdultUCI[-11],parameter=list(supp=0.1,conf=0.8),minlen=2)
Arules_s<-sort(Arules,by="lift",desc=F)
inspect(Arules_s)
Arules.sub<-subset(Arules, lift>2)
inspect(head(sort(Arules.sub,by="lift")))

# race와 native-country의 관계
inspect(apriori(AdultUCI[c("race","native-country")],minlen=2))

# sex와 capital-loss의 관계
inspect(apriori(AdultUCI[c("capital-loss","sex")],minlen=2))

# ocuupation, income
inspect(sort(apriori(AdultUCI[c("occupation","income")],parameter=list(supp=0.01,conf=0.1),minlen=2),by="lift"))
