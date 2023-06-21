<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.println("환영:"+request.getParameter("uname"));
out.println("환영:"+request.getParameter("uname1"));
out.println("환영:"+request.getParameter("uname2"));
%>

<table width="100%" border="1" align="center">
<tr bgcolor="#949494">
<th> 헤더이름 </th>
<th>헤더값</th>
</tr>
<%-- 쿠기정보,ip정보,port정보 --%>
<%
Enumeration headerNames=request.getHeaderNames();
while(headerNames.hasMoreElements()){
	String paramName=(String)headerNames.nextElement();
	out.print("<tr><td>"+paramName+"</td>\n");
	String paramValue=request.getHeader(paramName);
	out.println("<td>"+paramValue+"</td></tr>\n");
}
%>
</table>
</body>
</html>