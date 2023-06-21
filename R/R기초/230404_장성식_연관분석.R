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