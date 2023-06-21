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
request.setCharacterEncoding("utf-8");
String name=request.getParameter("name");
String bloodType=request.getParameter("bloodType");
%>
당신의 이름은 <%=name %>이고 <br>
<b><%=bloodType %></b>형이고<br>
할때 하고... 놀때 놀자. ㅋㅋ<br>
코로나에 강하다.
짱이에요!
</body>
</html>