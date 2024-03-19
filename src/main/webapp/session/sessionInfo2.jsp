<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 
<%@ page session="true"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%

//세션의 유효시간 설정 (초단위)
	//방법 1	
	//session.setMaxInactiveInterval(10);
	
	//방법2 : web.xml에서 설정 (분단위)
	
	SimpleDateFormat formatter =
			new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");

	Date creationTime = new Date();
	creationTime.setTime(session.getCreationTime()); //세션이 최초로 생성된 시간
	
	Date lastAccessedTime = new Date();
	lastAccessedTime.setTime(session.getLastAccessedTime()); //세션이 마지막으로 접근한 시간
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 정보 확인</title>
</head>
<body>
세션ID: <%=session.getId() %><br>
최초 세션 생성 시간: <%=formatter.format(creationTime) %><br>
마지막 접근 시간: <%=formatter.format(lastAccessedTime) %>
</body>
</html>