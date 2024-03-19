<%@page import="dto.Board"%>
<%@page import="jdbc.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
	
//글 번호 값 얻기, 주어지지 않았으면 0으로 설정
String tmp = request.getParameter("num");
int num = (tmp != null && tmp.length() > 0) ? Integer.parseInt(tmp) : 0;

//게시글 데이터를 담을 변수 정의
	String writer  = "";
	String title   = "";
	String content = "";
	String regtime = "";
	int    hits    = 0;
	
	
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
Board board = dao.selectOne(num, true);

// 글 데이터를 변수에 저장
writer  = board.getWriter();
title   = board.getTitle();
content = board.getContent();
regtime = board.getRegtime();
hits    = board.getHits();

// 글 제목과 내용이 웹 페이지에 올바르게 출력되도록 
// 공백과 줄 바꿈 처리
title   = title.replace  (" ", "&nbsp;");
content = content.replace(" ", "&nbsp;").replace("\n", "<br>");
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>   
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>

	<%-- 폼 --%>
	<form class="p-3">
		<div class="mb-3">
		<h1 class="mt-4"><%=title %></h1>
			<label for="title" class="form-label"></label> 
			<input type="hidden"
				class="form-control" id="title" name="title" maxlength="80"
				value="<%=title%>">
		</div>
		<div class="mb-3">
			<label for="writer" class="form-label">작성자</label>
			<input type="text"
				class="form-control" id="writer" name="writer" maxlength="20"
				value="<%=writer%>" readonly>
		</div>	
		<div class="mb-3">
			<label for="content" class="form-label"></label>
			<textarea class="form-control" id="content" rows="10" name="content"
				placeholder="내용을 입력해주세요" readonly><%=content%></textarea>
		</div>
		<br>
		
		<button type="button" class="btn btn-secondary mb-3" value="취소"
				onclick="history.back()">이전페이지</button>
	</form>

       
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous">
		
	</script>
</body>
</html>