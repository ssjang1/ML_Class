#install.packages("tidyverse")
library(tidyverse)
exp(1)
1 %>%exp

head(mtcars,4)
mtcars %>% head(4)
iris #150x5

iris %>%
  subset(Sepal.Length >5) %>%
  aggregate(.~Species, ., mean) # . 데이터가 들어갈 위치

str(mtcars)
mtcars %>%
  arrange(desc(mpg)) %>% #정렬
  head(4)

mpg_inds = order(mtcars$mpg) # 정렬된 데이터의 인덱스
head(mtcars[mpg_inds,],4)

mtcars %>%
  arrange(desc(mpg)) %>%
  head(10)

#문제 : mtcars(gear,hp)순으로 정렬해보시오
mtcars %>%
  arrange(desc(gear),desc(hp)) %>%
  head(10)

mtcars %>%
  select(cyl,disp,hp) %>%
  head(2)

mtcars %>%
  select(starts_with("d")) %>% #start_with 문자열 (선두문자열 체크)
  head(2)

mtcars %>%
  select(ends_with("p")) %>%
  head(2)

#문제 iris 데이터중에 Sepal로 시작하는 데이터만 선택
iris %>%
  select(starts_with("Sepal")) 

#iris데이터중에 Petal이나 Sepal로 시작하는 데이터 선택
iris %>%
  select(starts_with(c("Petal","Sepal")))

iris %>% select(matches("[pt]al")) #문자열 정규표현식 함수 pal이나 tal

mtcars %>% select(contains('ar')) %>% head(2)

#파생변수
mtcars = mtcars %>%
  mutate(hp_wt=hp/wt,mpg_wt=mpg/wt)
mtcars

#원래는 
mtcars$hp_wt = mtcars$hp/mtcars$wt # 원래는 이런식으로 만듬

mtcars=mtcars %>%
  mutate_at(c("hp_wt","mpg_wt"),log)

#install.packages("EDAWR")
#library(EDAWR)
#EDAWR::cases

head(diamonds)
(df.diamonds_ideal <- filter(diamonds,cut=="Ideal"))

(df.diamonds_ideal<-dplyr::select(df.diamonds_ideal,carat,cut,color,price,clarity))

(df.diamonds_ideal<-mutate(df.diamonds_ideal,price_per_carat=price/carat))

# pipeline명령으로 변경
df.diamonds<-diamonds %>%
  filter(cut=="Ideal")%>%
  dplyr::select(carat,cut,color,price,clarity)%>%
  mutate(price_per_carat=price/carat)

diamonds %>%
  filter(cut=="Ideal")%>%
  ggplot(aes(x=color,y=price))+
  geom_boxplot()

diamonds %>%
  filter(cut=="Ideal")%>%
  ggplot(aes(price))+
  geom_histogram()+
  facet_wrap(~ color) # color로 범주화한 다음 시각화 

# tapply 
iris %>%
  group_by(Species)%>%
  summarize(meanSepLength=mean(Sepal.Length))%>%
  ggplot(aes(Species,meanSepLength))+geom_bar(stat="identity") # stat="identity"는 y변수에 대해서 합계를 계산해라

#문제
#iris데이터에 대해서 Sepal.length에 10000을 곱해서 x변수에 추가하고
#Species와 x변수를 선택해서 result변수에 대입하시오 
iris_test=iris%>%
  mutate(x=Sepal.Length*10000)
result=iris_test %>%
  select("Species","x")

result<-iris %>%
  mutate(x=10000*Sepal.Length)%>%
  dplyr::select(Species,x)%>%
  map_dfr(.,~format(.x,big.mark='.'))

head(mtcars,4)
(by_cyl<-mtcars%>%group_by(cyl)) # 데이터에 변화는 없는데 마킹 해놓는다.
by_cyl%>%summarise( # 그룹표시가 있는데이터에 대해서 그룹별로 요약약
  disp=mean(disp),
  hp=mean(hp)
)

#문제 mtcars 데이터에 대하여 vs, am으로 그룹화하고 disp의 평균을 구해보시오
(byvsam<-mtcars%>%group_by(vs,am))
byvsam%>%summarise(
  meandisp=mean(disp)
)

result<-mtcars %>%
  group_by(vs,am)%>%
  #ungroup() %>%
  dplyr::summarise(n=n())

result %>%
  dplyr::summarise(n=sum(n))

#group_by()를 풀고싶을 땐 ungroup()

(by_cyl %>%
    group_by(vs,am)%>%
    group_vars())

#install.packages("hflights")
library(hflights)
?hflights #227,496 x 21 # SQLite 경량 데이터베이스 (웹)
head(hflights)

library(data.table) #고속으로 데이터처리를 위해
hflights_df<-as_tibble(hflights)
#df,dt
class(hflights)
class(hflights_df)

#정렬
#%>% 파이프 없이 단독으로 사용이 될 때는 데이터를 입력
arrange(hflights_df,Month,DayofMonth,desc(AirTime))
summarize(hflights_df,delay=mean(ArrDelay,na.rm=T))

# 목적지 별로 그룹핑 한 다음 TailNum별로 요약한 것을 planes 이라는 변수에
# 횟수를 flights로 요약
planes <-hflights %>%
  group_by(dest) %>%
  TailNum %>%
  summarise(n=n())

hflights_df %>%
  group_by(Dest)%>%
  summarise(planes=n_distinct(TailNum),flights=n())

#연 월 일로 그룹핑해서  연 월 일 별 비행횟수 확인해보시오

hflights_df%>%
  group_by(Year,Month,DayofMonth)%>%
  summarise(flightcounts=n()) %>%
  summarise(flightcounts=n())

#년월일로 그룹핑한다음 년원일과 arrDelay,depDelay만 선택하고
# ArrDelay , depDelay의 평균을 구하시오
# ArrDelay,depDealy의 합계가 30이 넘는 경우만 출력하시오
hf<-hflights_df %>%
  group_by(Year,Month,DayofMonth) %>%
  summarize(meanArr=mean(ArrDelay,na.rm=T),meanDep=mean(DepDelay,na.rm=T),sumDelay=ArrDelay+DepDelay )
hf$sumDelay[is.na(hf$sumDelay)]<-0
filter(hf,sumDelay>30)  

hflights_df %>%
  group_by(Year,Month,DayofMonth) %>%
  dplyr::select(Year:DayofMonth,ArrDelay,DepDelay) %>%
  summarise(arr=mean(ArrDelay,na.rm=TRUE),dep=mean(DepDelay,na.rm=T))%>%
  filter(arr>30,dep>30)

# 데이터는 몇년 동안의 데이터인가. (년도 데이터를 중복을 제거하고 카운트)
# distinct, n_distinct
hflights_df %>%
  group_by(Year)%>%
  summarize(n_distinct(Year)) # 매개변수가 vector 
  
# 1월 1일의 데이터를 추출하시오 
filter(hflights_df,Month==1&DayofMonth==1)
# 1월 혹은 2월 데이터를 추출하시오
filter(hflights_df,Month==1|Month==2)
# arrange를 이용해서 년 월 도착시간으로 정렬하시오
hflights_df%>%
  arrange(ArrTime)
# Month기준으로 내림차순으로 정렬하시오
hflights_df%>%
  arrange(desc(Month))
# select로 연월일 제외하고 선택
hflights_df %>%
  select(-c(Year,Month,DayofMonth))

# 비행편수를 구하기 위해서 항공기별(TailNum)로 그룹화하시오
fg<-hflights_df%>%group_by(TailNum)
# 그룹화 한 결과를 항공기별 횟수, Distance의 평균, Arrdelay의 도착지연 시간 평균을 요약하시요
fg2<-fg %>%
  summarise(flightcount=n(),meanDistance=mean(Distance),meanArrDelay=mean(ArrDelay,na.rm=T))
# 위의 결과에서 횟수가 20 초과 ,거리의 평균이 2000 이하인 데이터만 출력하시요
  filter(fg2,flightcount>20,meanDistance<=2000)
# 위의 요약결과의 결측치 처리 : 위의 결과값이 dist(distance의 평균)와 delay(ArrDelay의 평균)이
# 모두 1 이상인 경우만 필터링하시요
  filter(fg2,meanDistance>=1,meanArrDelay>=1)
  
# 1) 다음데이터를 데이터프레임으로 생성하시오 
# empno pay bonus
# 101   250 0.10
# 102   180 0.10
# 103   200 0.12
# 104   300 0.15
# 105  1000 0.0
  
empno<-c(101,102,103,104,105)
pay<-c(250,180,200,300,1000)  
bonus<-c(0.10,0.10,0.12,0.15,0.00)
emp<-data.frame("사원번호"=empno,"급여"=pay,"보너스"=bonus)

# 2) total이라는 이름으로 보너스가 고려된 급여를 계산해서 추가
total=pay*(1+bonus)
emp<-cbind(emp,total=total)
emp%>%
  mutate(total=total)
# 3) total의 급여가 300이상인 사원번호와 총급여 출력
emp%>%
  select(empno,total)%>%
  filter(total>=300)
# 4) 다음 dept 변수값을 추가
deptno<-c(1,2,1,2,2)
emp<-cbind(emp,deptno)
# 5) 부서별 평균급여를 출력하시오
emp%>%
group_by(deptno)%>%
summarise(mt=mean(total))

# test
emp%>%
  mutate(phonecall=c(011,010,010,011,012))

library(dplyr)
library(dbplyr)
library(DBI)
library(rstudioapi)
#install.packages("RMySQL")
library(RMySQL)

conn=dbConnect(MySQL(),user='root',password='acorn1234',dbname='Rtest',host='192.168.41.201')

dbListTables(conn)
mtcars
dbWriteTable(conn,"mtcars",mtcars)
dbListTables(conn)
dbListFields(conn,"mtcars")
db_mtcars<-dbReadTable(conn,"mtcars")
dim(db_mtcars)

res<-dbSendQuery(conn,"SELECT * FROM mtcars WHERE cyl=4")
res #MySQLResult (java에서는 ResultSet -> Class로 변환)
query_result <-dbFetch(res)
dim(query_result)
dbClearResult(res)
dbDisconnect(conn)

#문제 daejeon 데이터베이스에 접속한 다음 테이블 리스트를 확인해보고
conn=dbConnect(MySQL(),user='root',password='acorn1234',dbname='daejeon',host='192.168.41.201')
dbListTables(conn)
# emp의 데이터를 "select * from emp"로 쿼리를 실행 후 결과출력
quest1<-dbSendQuery(conn,"select * from emp")
quest1_result<-dbFetch(quest1)

# 열별로 na가 몇개 인지 확인 

sapply(quest1_result,FUN=function(x) sum(is.na(x)))
#drop_na(quest1_result)
fill(quest1_result,COMM,direction='up')
replace_na(quest1_result,list(COMM=0))
dbClearResult(quest1)
dbDisconnect(conn)

#install.packages("nycflights13")
library(nycflights13)

conn <- DBI::dbConnect(RMySQL::MySQL(),
                 dbname="rtest",
                 host="192.168.41.201",
                 user="root",
                 password="acorn1234")

#rstudioapi::askForPassword("Database password"
dbWriteTable(conn,"flights",nycflights13::flights)
dbWriteTable(conn,"airlines",nycflights13::airlines)
dbWriteTable(conn,"planes",nycflights13::planes)
dbWriteTable(conn,"airports",nycflights13::airports)
dbWriteTable(conn,"weather",nycflights13::weather)
###########
# copy_to(conn,nycflights13::flights,"flights",temporary=FALSE,
#         indexes=list(c("year","month","day","carrier","tailnum","dest")))
# 
# copy_to(conn,nycflights13::airlines,"airlines",
#         temporary=FALSE,indexes=list("carrier"),overwrite=T)
# 
# copy_to(conn,iris,overwrite = TRUE)
#########

(mtcars<-tbl(conn,"mtcars"))
flights_db<-tbl(conn,"flights")
dim(flights_db)
flights_db %>% select(year:day,dep_delay,arr_delay)
db_test<- flights_db %>% filter(dep_delay >240)
db_test %>% show_query()

gb_test <-flights_db %>% group_by(dest) %>% summarise(delay =AVG(dep_time))
gb_test %>% show_query()

translate_sql(x==1 && (y<2||z>3))

# 과제 (종합적으로 연결)
# 엑셀에서 성적데이터를 입력(국어 영어 수학 과목과 3인분이 데이터)합니다. (합계, 평균제외)
# -csv로 저장
# R에서 데이터를 로딩하여 합계 평균 및 학점을 구합니다
# 계산된 결과 data.frame을 sungjukresult데이터베이스의 student테이블로 저장합니다. (RMySQL 사용)
# 국어 영어를 선택합니다.
# 국어 점수가 80이상인 데이터만 필터링 합니다.
# 처리 결과를 sungjukresult 데이터 베이스에 calcsungjuk 테이블에 저장합니다
# java로 db에 저장된 처리결과를 table로 웹페이지 서비스하시오오
attach(jumsu)
jumsu<- read.csv("C:/Users/401-14/Documents/jumsu.csv",fileEncoding="utf-8",encoding="CP949",header=F)
colnames(jumsu)<-c("국어","수학","영어")
jumsu<-jumsu%>%
  mutate(합계=국어+수학+영어)

jumsu$평균<-jumsu$합계/(length(jumsu)-1)
jumsu$학점<-ifelse(평균>=90,학점<-"A",ifelse(평균>=80,학점<-"B",ifelse(평균>=70,학점<-"C",ifelse(평균>=60,학점<-"D","F"))))

conn <- DBI::dbConnect(RMySQL::MySQL(),
                       dbname="sungjukresult",
                       host="192.168.41.201",
                       user="root",
                       password="acorn1234")
jumsu<-data.frame(jumsu)
dbWriteTable(conn,"student",jumsu)

j1<-jumsu %>%
  select(국어,영어)

j2<-jumsu %>%
  filter(국어>=80)%>%
  select_all

dbWriteTable(conn,"calcsungjuk",j2)
