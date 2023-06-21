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