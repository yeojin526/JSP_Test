<%@page import="jdbc.dao.MemberDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int memberno = Integer.parseInt(request.getParameter("memberno"));

String loginId = (String) session.getAttribute("ID");
if (loginId == null) {
	response.sendRedirect("loginForm.jsp");
}

MemberDao dao = MemberDao.getInstance();
dao.delete(memberno);
%>

<script>
	alert('회원이 삭제 되었습니다.');
	location.href = "member_list.jsp";
</script>