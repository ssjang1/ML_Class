<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Directive : @를 붙이고 servlet에 지시 수행문 -->
<!-- JSP페이지가 컴파일되면 servlet이 만들어짐 -->
<!-- MIME type : content type -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
p{text-decoration:underline;}
</style>
</head>
<body>
<%-- JSP 주석문 --%>
<%! int i=10; %> <!-- 변수 선언 -->
<%! int a,b,c; %>
<%-- request,response,out,session,application 자동으로 활성화 --%>
<% out.println("빅데이터 과정 <br>"); %> <%--scriptlet --%>
<% out.println("자바와 동일한데 패키지 처리만 달라짐 <br>"); %>
<% System.out.println("어디에 출력되나?"+i); %>
<p> 서버측 java server page 입니다.</p>
JSP의 시작입니다.
변수 i에 들어 있는 값은 <%= i %> 입니다. <%-- 표현식(변수에 있는 값 한개 출력) --%>
<script>
console.log("브라우저에 출력합니다.")
</script>
</body>
</html>