<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% // 웹서비스 구조상 자주 사용되는 request,response,page,pageContext,session,application
// 쿠키는 필요할 때 객체 인스턴스해서 사용
// client에 저장 : 중요한 정보는 아닌데 빈번하게 사용되어야 하는 것

Cookie inname=new Cookie("inname",request.getParameter("inname"));
Cookie inaddr=new Cookie("inaddr",request.getParameter("inaddr"));

inname.setMaxAge(60*60*24); // 기한 설정 
inaddr.setMaxAge(60*60*24);

response.addCookie(inname); // 
response.addCookie(inaddr);
%>
<center>
<h1>쿠키 세팅 완료</h1>
</center>
</body>
</html>