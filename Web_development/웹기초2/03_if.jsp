<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 블록문 안에 tag를 활용해서 출력 가능 --%>
<%! int day=3; %>
<% if (day==1 | day==7){ %>
<p>오늘은 주말입니다.</p>
<p>조건이 맞으면 출력되는 것</p>
<% } else { %>
<p> 오늘은 주말이 아닙니다.</p>
<% } %>

<%
switch(day){
case 0: out.println("SUNDAY"); break;
case 1: out.println("MONDAY"); break;
case 2: out.println("TUESDAY"); break;
case 3: out.println("WEDNESDAY"); break;
case 4: out.println("THURSDAY"); break;
case 5: out.println("FRIDAY"); break;
case 6: out.println("SATURDAY"); break;
}
%>

</body>
</html>