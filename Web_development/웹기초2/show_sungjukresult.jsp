<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.lang.*,java.util.*,java.sql.*,com.mariadb.sungjukresult.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
ArrayList<SungjukresultDTO> list =new ArrayList<SungjukresultDTO>();
list=(ArrayList<SungjukresultDTO>) request.getAttribute("sungjukresultlist");
%>
<a href="http://localhost:8080/daejeon5/sungjukresult_tabs.html"><h5>메뉴로</h5></a>
<h3>학생정보</h3>
<table border=1>
<tr>
<th>번호</th>
<th>국어</th>
<th>수학</th>
<th>영어</th>
<th>총점</th>
<th>평균</th>
<th>학점</th>
</tr>
<%
Iterator itr=list.iterator();
while(itr.hasNext()){
	SungjukresultDTO dto=(SungjukresultDTO) itr.next();

%>
<tr>
<td><%=dto.getBunho() %></td>
<td><%=dto.getKor() %></td>
<td><%=dto.getMat() %></td>
<td><%=dto.getEng() %></td>
<td><%=dto.getTotal() %></td>
<td><%=dto.getAverage() %></td>
<td><%=dto.getGrade() %></td>
</tr>
<%
}
%>
</table>
</body>
</html>
