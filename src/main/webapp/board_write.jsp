<%@page import="jdbc.dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@page import="jdbc.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

// 글 번호 값 얻기, 주어지지 않았으면 0으로 설정
String tmp = request.getParameter("num");
int num = (tmp != null && tmp.length() > 0) ? Integer.parseInt(tmp) : 0;

// 새 글쓰기 모드를 가정하고 변수 초기값 설정
/* String writer  = ""; */
String title   = "";
String content = "";
String action = "board_insert.jsp";

//세션에서 작성자 정보 가져오기
String writer = (String) session.getAttribute("ID");


// 글 번호가 주어졌으면, 글 수정 모드
if (num > 0) {
	BoardDao dao = BoardDao.getInstance();
	Board board = dao.selectOne(num, false);

	// 글 데이터를 변수에 저장
	writer = board.getWriter();
	title = board.getTitle();
	content = board.getContent();

	// 글 수정 모드일 때는 저장 버튼을 누르면 UPDATE 실행
	action = "board_update.jsp?num=" + num;

}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성/수정</title>   
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>

	<%-- 입력 폼 --%>
	<form method="post" action="<%=action%>" class="p-3">
		<div class="mb-3">
			<label for="title" class="form-label">제목</label> 
			<input type="text"
				class="form-control" id="title" name="title" maxlength="80"
				value="<%=title%>" required>
		</div>
		<div class="mb-3">
			<label for="writer" class="form-label">작성자</label>
			<input type="text"
				class="form-control" id="writer" name="writer" maxlength="20"
				value="<%=writer%>" disabled>
		</div>	
		<div class="mb-3">
			<label for="content" class="form-label">내용</label>
			<textarea class="form-control" id="content" rows="10" name="content"
				placeholder="내용을 입력해주세요" required><%=content%></textarea>
		</div>
		<br>
		<button type="submit" class="btn btn-primary mb-3">저장</button>
		<button type="button" class="btn btn-secondary mb-3" value="취소"
			onclick="history.back()">취소</button>	
	</form>

       
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous">
		
	</script>
</body>
</html>