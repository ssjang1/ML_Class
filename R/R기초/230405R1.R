#install.packages("tseries") # 시계열 분석 및 계산 재정학(finace)에 대한 함수들
#install.packages("forecast") # 선형이나 시계열을 위한 예측 함수들
#install.packages("TTR") # Technical trading rule 기술적 트레이딩 룰
# MA(moving average) 이동평균법 (5,12,20,60,120)
# SMA(Simple)
# WMA(weighted) 가중이동평균 (1,2,3,4,5) 가중치(영향력)
# EMA(exponentially) 지수 이동 평균법 : 이자 -복리계산산
# 연관분석 ngcMatrix : transaction ( 희소행렬을 표현)
library(tseries)
library(forecast)
library(TTR)

ts(1:10,frequency=4,start=c(1959,2)) # 2사분위수
print(ts(1:10,frequency = 7,start=c(12,2)),calendar=T)

gnp<-ts(cumsum(1+round(rnorm(100),2)),start=c(1954,7),frequency=12)
class(gnp) # 'ts' 시계열 데이터 포맷
plot(gnp)

#
kings<-scan("kings.dat")
kings
kingstimeseries<-ts(kings)
kingstimeseries
plot(kingstimeseries)

# SMA(simple moving average)
king_sma3<-SMA(kingstimeseries,n=3)
plot.ts(king_sma3)
king_sma8<-SMA(kingstimeseries,n=8)
plot.ts(king_sma8)
kpss.test(king_sma8) # Statinaryity 안정성테스트 # 귀무가설: 시계열 데이터가 정상성이다.
# 차분
king_diff <- diff(kingstimeseries,differences=1)
plot.ts(king_diff)
kpss.test(king_diff) # 정상성을 가진 데이터

acf(king_diff,lag.max=20) # 첫번째 lag에서 초과
acf(king_diff,lag.max=20,plot=F)
# partial auto correlation function
pacf(king_diff,lag.max=20) # lag1,lag2,lag3에 대해서 초과
pacf(king_diff,lag.max=20,plot=F)

#(p,d,q): p:AR d:차분횟수 q:MA계수
auto.arima(kings) #추천:ARIMA(0,1,1) 비정상성을 가진 데이터에도 적용
kingstimeseriesarima<-arima(kingstimeseries,order=c(0,1,1)) # 예측 모델
kingstimeseriesarima
#plot(kingstimeseriesarima)
?forecast 
# h : Number of periods for forecasting
kingstimeseriesforecasts <- forecast(kingstimeseriesarima,h=5) # 예측함수(predict)
kingstimeseriesforecasts
plot(kingstimeseriesforecasts)

# 문제

x=w=rnorm(300)
for(t in 2:300) x[t]=x[t-1]+w[t]

# 위 데이터에 대하여 시계열 데이터 변환해보고
# 데이터가 정상성을 띄고 있는지 확인

xseries<-ts(x,frequency=12,start=c(1,1))
kpss.test(xseries) # 비정상성이다.
# SMA(xseries)
# kpss.test(SMA(xseries))
kpss.test(diff(xseries)) # 정상성
tsdisplay(diff(xseries))
# ACF,PACF 데이터의 독립성 ( 시차 데이터가 서로 영향을 미치는가 )
# 점선 안에 있으면 서로 독립적이다.
# 벗어난 게 있다는 것은 독립적이지 않은 경우

## 정상성 확인
library(tseries)
class(AirPassengers)
(apts<-ts(AirPassengers,frequency = 12))
plot(apts)
adf.test(apts,alternative = "stationary",k=0) # 정상성
# 귀무가설 : 비안정성
# 귀무가설 : 해당 시계열 데이터가 단위근 과정(unit root process)을 따른다"는 것입니다. 
#이때 단위근 과정은 시계열이 추세성을 가지며 평균이 일정하지 않고, 즉 정상성을 가지지 않는 것을 의미
kpss.test(apts)
auto.arima(AirPassengers)

# ARIMA(2,1,1)(0,1,0)
(fit<-arima(log(AirPassengers),c(2,1,1),seasonal=list(order=c(0,1,0),period=12)))
pred<-predict(fit,n.ahead=10*12)
# 데이터에 로그를 취해 arima했기때문에 역으로 exp를 취해줘야 복원
ts.plot(AirPassengers,2.718^pred$pred,log="y",lty=c(1,3))

par(mfrow=c(1,1))
air.model<-Arima(window(AirPassengers,end=1956+11/12),order=c(2,1,1),
                 seasonal=list(order=c(0,1,0),period=12),lambda=0)
plot(forecast(air.model,h=48))
lines(AirPassengers)


#(p,d,q): p:AR d:차분횟수 q:MA계수
# 문제
# WWWusage의 60기 까지만의 데이터를 분석하고 향후 10기에 대하여
# 예측해보시오 ( 분석을 해보니 log가 좋아서 변환해봄)
# 비정상성 -> 정상성으로 변환

##내가한거
?WWWusage
?arima
class(WWWusage) # 분당 동접수
WWWusage
www<-WWWusage[1:60]
kpss.test(www) # 비정상성
tswww<-ts(www)
kpss.test(tswww)
kpss.test(log(tswww))
kpss.test(diff(tswww))

(wwwfit<-arima(log(tswww),c(2,1,1),seasonal=list(order=c(0,1,0),period=10)))
wwwpred<-predict(wwwfit,n.ahead=60)
ts.plot(WWWusage,2.718^wwwpred$pred,log="y",lty=c(1,3))

## 수업내용
auto.arima(WWWusage)
kpss.test(WWWusage) # p-value = 0.05377 정상성이다.
#acf,pacf 자기상관성의 유무
acf(WWWusage)
pacf(WWWusage)

kpss.test(log(WWWusage))
plot(log(WWWusage))
acf(log(WWWusage))
pacf(log(WWWusage))
auto.arima(log(WWWusage))

log(WWWusage) %>%
  Arima(order=c(1,1,1))%>%
  forecast(h=20)%>%
  autoplot

data(gas)
str(gas)
plot(gas)
plot.ts(gas)
plot(stl(gas,s.window="periodic"))
# 분해시계열
?stl # Seasonal Decomposition of Time Series by Loess :
# 비선형회귀에 의한 시계열 데이터 분해

kpss.test(gas)
acf(gas)
pacf(gas)
gas.diff<-diff(log(gas)) # 로그를 취하고 차분을 취했더니=> 정상성가진데이터
adf.test(gas.diff,alternative="stationary",k=0)
kpss.test(gas.diff)#안정적
acf(gas.diff)
pacf(gas.diff)
plot(gas.diff)
gas.ari<-auto.arima(gas.diff)
summary(gas.ari) # ARIMA(0,0,1)(0,1,1)
fit<-arima(window(log(gas),end=1980),c(0,0,1),
           seasonal = list(order=c(0,1,1),period=12))
forres<-forecast(fit,h=100)
forres$method
forres$residuals # 실제값-예측값 차이 
library(ggplot2)
autoplot(forres$residuals)+xlab("날짜")+ylab("잔차")+
  ggtitle("모델잔차")
autoplot(forres$residuals)+xlab("날짜")
ggAcf(forres$residuals)+ggtitle("잔차의 ACF")
# 자기 상관성
Box.test(forres$residuals,lag=10,fitdf=0) #p-value < 2.2e-16 자기상관성 0이 아니다다
# 귀무가설: 잔차들은 자기상관이 없는 랜덤한 오차를 따른다 #gpt 
# 귀무가설: 데이터들이 독립적으로 분포(자기상관성이0)
Box.test(forres$residuals,lag=2,fitdf=0)
Box.test(forres$residuals,lag=7,fitdf=0)

plot(forecast(fit,h=100))
plot(2.718^forres$fitted)


################
################
################


# test mining
library(stringr)
# []선택 {}갯수
# str_extract 처음 패턴만 분리
str_extract("abcd12aaa33","[0-9]{2}") # 정규 표현식 (패턴 비교)
str_extract_all("abcd12aaa33","[0-9]{2}")
# if 비교문을 사용하는 것이 아니라 패턴을 이용해서 선택
str<-'hongkildong35lee45kang55안창호25'
(result<-str_extract_all(str,'[a-z]{3}'))
(result<-str_extract_all(str,'[0-9]{2}'))
(result<-str_extract_all(str,'[가-하]{3}'))
nchar(str)
length(str)

head(USArrests)
(states=rownames(USArrests))
grep(pattern="k",x=states)
grep(pattern="k",x=states,value=T,ignore.case=T)
grep(pattern="[wW]",x=states,value=T)

money="$money"
sub(pattern="\\$",replace="",x=money)
gsub("\\d","_","the dandelion war 2010") # d는 숫자 
gsub("\\D","_","the dandelion war 2010") # D는 숫자가 아닌것
gsub("\\w","_","the dandelion war 2010") # w는 문자 
gsub("\\W","_","the dandelion war 2010") # W는 문자가 아닌것
gsub(pattern="[[:blank:]]",replacement="","the dandelion war 2010") # 공백없애기

data<-c("12.578.69486")
# 데이터의 . 을 없애보시오
gsub(pattern="\\.",replace="",x=data)

lorem="대한민국 만세, 모두다 하나"
str_sub(lorem,start=1,end=5)
bad_text=c("This","example","has several")
str_trim(bad_text,side="both")#공백제거
str_pad("hola",width=7)
str_extract_all("abcd12aaa33","\\d")#"[1-9]{2}"
chr6="123한글나라456"
str_extract(chr6,"[가-흐]+")

chr6="abdbsdsa 010-1234-5678 dasdasd"
pat<-"[0-9]{3}-[0-9]{4}-[0-9]{4}"
str_extract(chr6,pat)

fruits1<-c("사과 한개","배 두개","바나나 세개")
str_replace(fruits1,"[개]","바구니")

shoppinglist<-c("2017-10-19 수입3000원","2017-10-20 수입14500원","2017-10-21 수입2500원")
str_extract_all(shoppinglist,"[0-9]{4}원",simplify=T)
str_replace_all(shoppinglist,"-","/")
str_extract_all(shoppinglist,"[0-9]{4}[-][0-9]{2}[-][0-9]{2}",simplify=T)

#install.packages("tm")
library(tm)
data("crude")

# 역문서빈도
tfidf=function(mat){
  tf<-mat
  id=function(col){sum(!col==0)}
  idf<-log(nrow(mat)/apply(mat,2,id))
  tfidf<-mat
  for(word in names(idf)){tfidf[,word]<-tf[,word]*idf[word]}
  return(tfidf)
}
class(crude) # "VCorpus" "Corpus" ngcMatrix 처럼 tm의 고유포멧 (document 20개)
inspect(crude[1:3])
tdm<-TermDocumentMatrix(crude)[1:10,1:20]
# 행이 단어, 열이 문서
# DocumentTermMatrix : 행이 문서, 열이 단어 # Sparsity 희소성:94%=>0
Docs(tdm)
Terms(tdm)

tdm<-TermDocumentMatrix(crude,
                        control=list(removePunctuation=T,
                                     removeNumbers=T,
                                     stopwords=T,
                                     wordLengths=c(2,Inf)))
findFreqTerms(tdm,lowfreq=10)
findFreqTerms(tdm,2,3)
findAssocs(tdm,"dlrs",0.5)
findMostFreqTerms(tdm)
(termFrequency<-rowSums(as.matrix(tdm)))
(termFrequency<-colSums(as.matrix(tdm)))
(termFrequency<-subset(termFrequency,termFrequency>=10))
#install.packages("wordcloud")
library(wordcloud)
m<-as.matrix(tdm)
wordFreq<-sort(rowSums(m),decreasing=T)
set.seed(375)
pal<-brewer.pal(8,"Dark2")
wordcloud(words=names(wordFreq),freq=wordFreq,min.freq=10,
          random.order=F,rot.per=.1,colors=pal)
