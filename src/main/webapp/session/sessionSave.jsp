<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//'data'를 가져옴
	String data = request.getParameter("data");
	
//session.setAttribute(): 세션에 데이터 저장 
// (저장된 세션 가져오기 => session.getAttribute())
	session.setAttribute("saveData", data); //세션에 저장 (key, value)
	
	response.sendRedirect("sessionInfo.jsp");
%>

<!-- 응용: 'data'대신 'userId'를 사용하여 '사용자 아이디'를 세션에 저장할 수 있음 -->

