<%@page import="java.text.SimpleDateFormat"%>
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
	alert("로그인이 필요한 페이지입니다.");
	window.location.href = "loginForm.jsp"; // 로그인 페이지로 이동
</script>
<%
}
BoardDao dao = BoardDao.getInstance();
List<Board> list = dao.selectList();

System.out.println("-------전체 회원정보 로딩 완료");

%>

<style>
table.table-bordered.border-primary thead tr.bg-primary th {
	background-color: #007bff !important;
	color: white;
}
    .custom-navbar {
        background-color: #54B435; /* 배경색 */
        color: #ffffff; /* 텍스트 색상 */
    }
</style>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
		<div class="container-fluid">		
			<a class="navbar-brand" href="board_list_view.jsp">Community</a>
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
				<tr class="bg-primary" style="background-color: #007bff !important;">
					<th scope="col" style="width: 5%">No</th>
					<th scope="col" style="width: 35%">제목</th>
					<th scope="col" style="width: 15%">작성자</th>
					<th scope="col" style="width: 15%">게시일</th>
					<th scope="col" style="width: 10%">조회수</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Board board : list) {
				%>
				<tr>
					<td><%=board.getNum()%></td>
					<td style="text-align: left;"><a
						href="board_detail_view.jsp?num=<%=board.getNum()%>"><%=board.getTitle()%>
					</a></td>
					<td><%=board.getWriter()%></td>
					<td>
					<script> //'년-월-일'까지만 출력되도록 데이터 형식 병경
        				var regTime = '<%=board.getRegtime()%>';
						var formattedRegTime = new Date(regTime).toISOString()
								.split('T')[0];
						document.write(formattedRegTime);
					</script>
					</td>
					<td><%=board.getHits()%></td>
					<td>
						<button class="btn btn-warning btn-sm"
							onClick='location.href=
					    "board_write.jsp?num=<%=board.getNum()%>"'>수정</button>
					</td>
					<td>
						<button class="btn btn-warning btn-sm"
							onClick='location.href=
					    "board_delete.jsp?num=<%=board.getNum()%>"'>삭제</button>
					</td>
				</tr>

			<% }

%>
			</tbody>
		</table>
		<button class="btn btn-primary"
			onClick='location.href= "board_write.jsp"'>글쓰기</button>
		<button class="btn btn-outline-success"
			onClick='location.href= "user_memberUpdateForm.jsp"'>내 정보 수정</button>
		<button class="btn btn-outline-danger"
			onClick='location.href= "logout.jsp"'>로그아웃</button>


		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
			crossorigin="anonymous"></script>


</body>
</html>
