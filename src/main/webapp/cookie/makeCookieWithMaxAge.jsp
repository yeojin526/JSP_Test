<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie cookie3 = new Cookie("abc", "abc");   //이름, 값
	cookie3.setMaxAge(200); 				   	 //초단위
	response.addCookie(cookie3); 				 //브라우저에 응답
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효시간이 지정된 쿠키 생성</title>
</head>
<body>

</body>
</html>