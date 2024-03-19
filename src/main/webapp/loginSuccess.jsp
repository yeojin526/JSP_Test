<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
<!-- 세션에 저장된 사용자 아이디 확인 (로그인 성공시 저장됨) -->
<%= session.getAttribute("userId")%> 님 로그인 하셨습니다.  <br>
<% response.sendRedirect("list.jsp"); %>
<% System.out.println("loginSuccess.jsp 페이지 진입 완료");%>

<!-- <a href = "logout.jsp"><button>로그아웃</button></a> -->
</body>
</html>