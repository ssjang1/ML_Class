<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.lang.*,java.util.*,java.sql.*,com.mariadb.book.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
ArrayList<BookDTO> list =new ArrayList<BookDTO>();
list=(ArrayList<BookDTO>) request.getAttribute("booklist");
%>
<a href="http://localhost:8080/daejeon5/book_tabs.html"><h5>메뉴로</h5></a>
<h3>연락처</h3>
<table border=1>
<tr>
<th>번호</th>
<th>이름</th>
<th>전화번호</th>
<th>메모</th>
<th>분류</th>
</tr>
<%
Iterator itr=list.iterator();
while(itr.hasNext()){
	BookDTO dto=(BookDTO) itr.next();

%>
<tr>
<td><%=dto.getNo() %></td>
<td><%=dto.getName() %></td>
<td><%=dto.getPhone() %></td>
<td><%=dto.getMemo() %></td>
<td><%=dto.getLabel() %></td>
</tr>
<%
}
%>
</table>
</body>
</html>
