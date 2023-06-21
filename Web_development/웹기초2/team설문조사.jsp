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
String arr[]={"01 평소에는 아무렇지도 않던 일들이 괴롭고 귀찮게 느껴졌다." , "02 먹고 싶지 않았다. 식욕이 없었다. ",
        "03 어느 누가 도와주더라도 나의 울적한 기분을 떨쳐버릴 수 없을 것 같았다. ", "04 무슨 일을 하든 정신을 집중하기가 힘들었다. ",
        "05 비교적 잘 지냈다.","6. 상당히 우울했다.", "7. 모든 일들이 힘들게 느껴졌다.", "8. 앞일이 암담하게 느껴졌다.",
        "9. 지금까지의 내 인생은 실패작이라는 생각이 들었다.", "10. 적어도 보통 사람들 만큼의 능력은 있었다고 생각한다.","11 잠을 설쳤다 (잠을 잘 이루지 못 했다).","12 두려움을 느꼈다.","13 평소에 비해 말수가 적었다.",
		"14 세상에 홀로 있는 듯한 외로움을 느꼈다.","15 큰 불만 없이 생활했다.","16. 사람들이 나에게 차갑게 대하는 것 같았다. ", 
        "17. 갑자기 울음이 나왔다. ","18. 마음이 슬펐다. ", "19. 사람들이 나를 싫어하는 것 같았다. ","20. 도무지 뭘 해 나갈 엄두가 나지 않았다. "};

String ans[]={"극히드물다(1일이하)","가끔(1~2일)","자주(3~4일)","거의대부분(5~7일)"};

int solve[]={1,1,1,1,2,1,1,1,1,2,1,1,1,1,2,1,1,1,1,1};
int i = 1;
int j = 1;
int order = 0;
String groupname = ""; // 내부적인 문제번호
String selname = ""; // 선택번호
%>

<form method=post action="team설문응답.jsp">
	<table border=1>
		<%
		for (String data : arr) {
			groupname = "mind" + i; // 그룹번호
		%>
		<tr>
			<td colspan=5>설문 : "<%=data%>"
			</td>
		</tr>
		<tr>
			<%
			for (String str : ans) {
				if (solve[i - 1] == 1) 
					selname = "sel" + j; // 응답구분 
				else {
					order = 5 - j;
					selname = "sel" + order;
				}
			%>
			<td><input type="radio" name=<%=groupname%> value=<%=selname%>>
				<label><%=str%></label></td>
			<%
			j += i;
			}
			%>
		</tr>
		<%
		j = 1; // 다음 문제를 출력하기 위해 초기화
		i += 1; // 다음 문제 번호
		}
		%>
</table>
<input type="submit" value="제출하기" />
</form>
</body>
</html>