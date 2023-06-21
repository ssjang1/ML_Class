sum<-0
for(i in 1:1000){
  sum<-sum+i
}
print(sum)

sqrt(4)

2*2*2

2^3
factorial(4)
fac(4)
factor

x<-c(931,754,1029,1139,1442)
x225<-x-225
a1<-x225%/%100 

a2<-x225%%100
birthday<-rbind(a1,a2)
max(c(20,11,17,21,19))
abs(-20)
sqrt(25)
37+7
152%%7
11*4-(13%%4)

a<-c(1:5)
a[2]<-5
i<-(1:5)
a[c(1,5)]<-c(10,50)
a<-ifelse(a[i]==1|a[i]==5,a*10,a)

x<-c(170,168,172,175,169,180,178,175,179,182)
y<-c(174,170,169,180,173,175,177,176,180,179)
mean_x<-mean(x)
mean_y<-mean(y)
var_x<-sum((x-mean(x))^2/(length(x)-1))
var_y<-var(y)
a<-sum((x-mean(x))*(y-mean(y)))
a/sd(x)/sd(y)/9

cor(x,y)
