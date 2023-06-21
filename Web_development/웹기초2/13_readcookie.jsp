<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% // 쿠키는 동일 사이트 주소를 방문하게 되면 자동으로 쿠키값을 가지고 요청하게 됨
Cookie cookie=null;
Cookie[] cookies=null; // 쿠키배열
cookies = request.getCookies(); // getCookies의 리턴값이 배열
if(cookies !=null){
	out.println("<h2> 쿠키의 내용 </h2>");
for(int i=0;i<cookies.length;i++){
	cookie=cookies[i];
	//삭제시 주석을 풀고 확인하시오
	// 문자열에서 compareTo는 두개를 비교
	// 앞의 문자열이 크면 + 같으면 0 작으면 -
	//문자열 코드 순서 로 비교
/* 	if((cookie.getName()).compareTo("inname")==0){
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		out.print("쿠키삭제:"+cookie.getName()+"<br/>");
	} */
	out.print("Name:"+cookie.getName()+",");
	out.print("Value:"+cookie.getValue()+"<br/>");
}
}else{
	out.println("<h2>쿠키를 찾을 수 없습니다.</h2>");
}
%>
</body>
</html>