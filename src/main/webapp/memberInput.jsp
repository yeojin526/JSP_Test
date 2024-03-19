<%@page import="jdbc.dao.MemberDao"%>
<%@page import="dto.MemberVo"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	MemberVo member = MemberDao.getInstance().selectId(id);
	if (member != null) {
		// 이미 있는 아이디이면 오류 표시
	%>
	<script>
		alert('이미 등록된 아이디입니다.');
		history.back()
	</script>
	<%
	} else {
	MemberVo member1 = new MemberVo(request.getParameter("id"), request.getParameter("email"),
			request.getParameter("name"));
	MemberDao.getInstance().insert(member1);
	%>
	<script>
		alert('가입이 완료되었습니다.');
		window.location.href = "loginForm.jsp";
	</script>
	<%
	}
	%>

</body>
</html>