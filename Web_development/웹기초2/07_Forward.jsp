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
String name="본인의 이름"; // 변수를 추가하는 경우
String bloodType = request.getParameter("bloodType");//value가 전달
%>

<jsp:forward page='<%=bloodType + ".jsp"%>'>
<jsp:param name="name" value="<%=name%>"/>
</jsp:forward>
</body>
</html>