<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println(session.getAttribute("loginId" + "님이 로그아웃 하였습니다."));
	session.invalidate(); //세션 무효화
	
	response.sendRedirect("index.jsp");

%>