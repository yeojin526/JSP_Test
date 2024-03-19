<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>
	<div class="container" style="padding-top: 50px">
		<form action="<%=request.getContextPath()%>/memberInput.jsp" method="post">
			<div class="mb-3">
				<label for="idInput" class="form-label">아이디</label> <input
					type="text" name="id" class="form-control" id="idInput"
					placeholder="아이디">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">이메일</label>
				<input type="email" name="email" class="form-control"
					id="exampleFormControlInput1" placeholder="name@example.com">
			</div>
			<div class="mb-3">
				<label for="nameInput" class="form-label">닉네임</label> <input
					type="text" name="name" class="form-control" id="nameInput"
					placeholder="이름">
			</div>
			<style>
.custom-btn {
	background-color: #54B435; /* 사용자 지정 배경색 */
	border-color: #ffffff; /* 사용자 지정 테두리 색상 */
	color: #ffffff; /* 사용자 지정 텍스트 색상 */
	font-weight: bolder;
}

.custom-btn:hover {
	background-color: #ffffff; /* 사용자 지정 배경색 (마우스 호버 시) */
	border-color: #379237; /* 사용자 지정 테두리 색상 (마우스 호버 시) */
	color: #379237; /* 사용자 지정 텍스트 색상 (마우스 호버 시) */
	font-weight: bolder;
}
</style>
			<button class="btn btn custom-btn mb-3" type="submit"
				onclick="location.href='memberInput.jsp'">등록</button>		
			<button type="button" class="btn btn-secondary mb-3" value="취소"
				onclick="history.back()">취소</button>
					
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous">
		
	</script>
</body>
</html>