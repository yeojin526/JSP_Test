<%@page import="dto.MemberVo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="jdbc.JdbcUtil"%>
<%@ page import="jdbc.dao.MemberDao"%>
<%@page import="jdbc.dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page import="java.sql.*"%>

<%
String loginId = (String) session.getAttribute("ID");
if (loginId == null) {
%>
<script>
	alert("관리자 로그인이 필요한 페이지입니다.");
	window.location.href = "admin_loginForm.jsp"; // 로그인 페이지로 이동
</script>
<%
}
MemberDao dao = MemberDao.getInstance();
List<MemberVo> list = dao.selectMembers();
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>전체 회원 정보 조회</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>


	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="member_list">회원리스트</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>

			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">메인페이지</a></li>
					

				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="container" style="padding-top: 50px">
		<table class="table table-bordered border-primary">
			<thead>
				<tr>
					<th scope="col">회원번호</th>
					<th scope="col">아이디</th>
					<th scope="col">이메일</th>
					<th scope="col">닉네임</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (MemberVo member : list) {
				%>
				<tr>
					<td><%=member.getMemberno()%></td>
					<td><%=member.getId()%></td>
					<td><%=member.getEmail()%></td>
					<td><%=member.getNickname()%></td>
 					<td>
						<button class="btn btn-warning" type="submit"
							onClick='location.href=
					    "admin_memberUpdateForm.jsp?memberno=<%=member.getMemberno()%>"'>수정</button>
					</td>
					<td>
						<button class="btn btn-warning"
							onClick='location.href=
					    "memberDelete.jsp?memberno=<%=member.getMemberno()%>"'>삭제</button> 
					</td>
				</tr>
			</tbody>
			<%
			}
			%>

		</table>

		<button class="btn btn-outline-danger"
			onClick='location.href= "logout.jsp"'>로그아웃</button>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

</body>
</html>
