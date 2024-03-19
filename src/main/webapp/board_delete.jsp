<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="jdbc.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
int num = Integer.parseInt(request.getParameter("num"));

String loginId = (String) session.getAttribute("ID");
if (loginId == null) {
	response.sendRedirect("loginForm.jsp");
}

BoardDao dao = BoardDao.getInstance();
dao.delete(num);
%>

<script>
	alert('게시글이 삭제 되었습니다.');
	location.href = "board_list_view.jsp";
</script>


