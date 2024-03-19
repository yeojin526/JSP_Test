<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//쿠키는 'Map'형식(속성-값)으로 데이터를 저장함. (완전히 Map과 같은 건 아님)
	Cookie cookie1 = new Cookie("name", "HGD");   //이름, 값
	Cookie cookie2 = new Cookie("age", "20");     //이름, 값

	System.out.println("name:"+ cookie1.getValue());  
	System.out.println("age:"+ cookie2.getValue());
	
	response.addCookie(cookie1);
	response.addCookie(cookie2);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
쿠키가 생성되었습니다.
</body>
</html>