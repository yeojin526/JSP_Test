<%@page import="jdbc.dao.MemberDao"%>
<%@page import="dto.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

//회원 번호 값 얻기, 주어지지 않았으면 0으로 설정
String tmp = request.getParameter("memberno");
int memberno = (tmp != null && tmp.length() > 0) ? Integer.parseInt(tmp) : 0;

String id = "";
String email = "";
String nickname = "";

MemberDao dao = MemberDao.getInstance();
MemberVo member = dao.selectNum(memberno);

id = member.getId();
email = member.getEmail();
nickname = member.getNickname();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>

	<div class="container" style="padding-top: 50px">
		<form action="memberUpdate.jsp?memberno= <%=memberno %>" method="post">
			<div class="mb-3">
				<label for="idInput" class="form-label">아이디</label> <input
					type="text" name="id" class="form-control" id="id"
					placeholder="아이디" value="<%=id%>" readonly>
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">이메일</label>
				<input type="email" name="email" class="form-control" id="email"
					placeholder="name@example.com" value="<%=email%>">
			</div>
			<div class="mb-3">
				<label for="nameInput" class="form-label">닉네임</label> <input
					type="text" name="nickname" class="form-control" id="nickname"
					placeholder="이름" value="<%=nickname%>">
			</div>
			<style>
.custom-btn {
	background-color: #54B435; /* 배경색 */
	border-color: #ffffff; /* 테두리 색상 */
	color: #ffffff; /* 텍스트 색상 */
	font-weight: bolder;
}

.custom-btn:hover {
	background-color: #ffffff; /* 배경색 (마우스 호버 시) */
	border-color: #379237; /* 테두리 색상 (마우스 호버 시) */
	color: #379237; /* 텍스트 색상 (마우스 호버 시) */
	font-weight: bolder;
}
</style>
			<button class="btn btn custom-btn mb-3" type="submit">저장</button>
			<button type="button" class="btn btn-secondary mb-3" value="취소"
				onclick="history.back()">이전페이지</button>

		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous">
		
	</script>
</body>
</html>