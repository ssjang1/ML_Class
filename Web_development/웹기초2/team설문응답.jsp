<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int jumsu=0;
int total=0;
String level="";
%>
<%
for(int i=1; i<21; i++){
	String mind=request.getParameter("mind"+i);
	if(mind.equals("sel1")){jumsu=0;}
	else if(mind.equals("sel2")){jumsu=1;}
	else if(mind.equals("sel3")){jumsu=2;}
	else if(mind.equals("sel4")){jumsu=3;}
	total+=jumsu;
}
if(total < 20 ){level = "<h3> 건강한 상태</h3> <br> 당신의 행복을 다른사람에게도 전달해주세요. ";}
else if(total < 24){level = "<h3> 우울한 상태</h3> <br>주위사람들에게 도움을 청하세요";}
else {	level = "<h3>우울한 상태</h3> 전문가에게 상담을 받으세요.";}
%>
<script>
alert(<%=total%>)
</script>
<h1> 당신의 현재 우울증 검사 결과</h1>
<img src="images/depression.jpg" width="400" height="300"/> <br>
당신의 현재 상태는 다음과 같습니다. <br>
<%=level%>
</body>
</html>