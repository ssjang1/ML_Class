# 문제
# 클러스터 별로 자기가 알고싶은 성향을 확인해서 제출
# 3개이상
aggregate(data=teens,mall+shopping~gender=="F",mean)
teens
aggregate(data=teens,friends~drugs,mean)
aggregate(data=teens,music+dance~friends>150,mean)