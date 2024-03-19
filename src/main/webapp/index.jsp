<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>커뮤니티에 오신 것을 환영합니다.</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container px-5">
				<a class="navbar-brand" href="index.html">Menu</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" href="board_list_view.jsp">커뮤니티 게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="joinForm.jsp">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="loginForm.jsp">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="admin_loginForm.jsp">관리자 페이지</a></li>


					</ul>
				</div>
			</div>
		</nav>
		<!-- Header-->
		<style>
.custom-header {
	background-color: #54B435; /* 배경색 */
}
</style>
		<header class="custom-header py-5">
			<div class="container px-3">
				<div class="row gx-5 align-items-center justify-content-center">
					<div class="col-lg-8 col-xl-7 col-xxl-6">
						<div class="my-5 text-center text-xl-start">
							<h1 class="display-5 fw-bolder text-white mb-2">다양한 주제와 관심사로
								사용자를 폭넓게 연결하는 커뮤니티 Y</h1>
							<p class="lead fw-normal text-white-50 mb-4">Quickly design
								and customize responsive mobile-first sites with Bootstrap, the
								world’s most popular front-end open source toolkit!</p>
							<div
								class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
								
								<style>
    .custom-btn {
        background-color: #54B435; /* 배경색 */
        border-color: #ffffff; /* 테두리 색상 */
        color: #ffffff; /* 텍스트 색상 */
        font-weight: bolder;
        
    }
    .custom-btn:hover {
        background-color: #F0FF42; /* 배경색 (마우스 호버 시) */
        border-color: #379237; /* 테두리 색상 (마우스 호버 시) */
        color: #379237; /* 텍스트 색상 (마우스 호버 시) */
        font-weight: bolder;
    }
</style>

<a class="btn btn-lg px-4 me-sm-3 custom-btn" href="joinForm.jsp">지금 가입하기</a>  
							</div>
						</div>
					</div>
					<div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
						<img class="img-fluid rounded-3 my-5"
							src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." />      
					</div>
				</div>
			</div>
		</header>
		<!-- Features section-->
		<section class="py-5" id="features">
			<div class="container px-5 my-5">
				<div class="row gx-5">
					<div class="col-lg-4 mb-5 mb-lg-0">
						<h2 class="fw-bolder mb-0">'커뮤니티 Y'에서 나눌 수 있는 다양한 주제들</h2>
					</div>
					<div class="col-lg-8">
						<div class="row gx-5 row-cols-1 row-cols-md-2">
							<div class="col mb-5 h-100">
								<div
									class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-collection"></i>
								</div>
								<h2 class="h5">최신 이슈</h2>
								<p class="mb-0">Paragraph of text beneath the heading to
									explain the heading. Here is just a bit more text.</p>
							</div>
							<div class="col mb-5 h-100">
								<div
									class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-building"></i>
								</div>
								<h2 class="h5">연예</h2>
								<p class="mb-0">Paragraph of text beneath the heading to
									explain the heading. Here is just a bit more text.</p>
							</div>
							<div class="col mb-5 mb-md-0 h-100">
								<div
									class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-toggles2"></i>
								</div>
								<h2 class="h5">사회/경제</h2>
								<p class="mb-0">Paragraph of text beneath the heading to
									explain the heading. Here is just a bit more text.</p>
							</div>
							<div class="col h-100">
								<div
									class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-toggles2"></i>
								</div>
								<h2 class="h5">일상/취미</h2>
								<p class="mb-0">Paragraph of text beneath the heading to
									explain the heading. Here is just a bit more text.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
	</main>
	<!-- Footer-->
	<footer class="bg-dark py-4 mt-auto">
		<div class="container px-5">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row"> 
				<div class="col-auto">
					<div class="small m-0 text-white">Copyright &copy; 
						YJ's Website 2023</div>
				</div>
				<div class="col-auto">
					<a class="link-light small" href="#!">Privacy</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Terms</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Contact</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
