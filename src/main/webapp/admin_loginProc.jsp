<%@page import="jdbc.dao.MemberDao"%>
<%@page import="dto.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 사용자가 입력한 아이디와 비밀번호를 가져옴
request.setCharacterEncoding("utf-8");

//콘솔 메시지
System.out.println("관리자 로그인 처리 시작");

String userId = request.getParameter("userid");
String userEmail = request.getParameter("userpw");
String remember = request.getParameter("remember");

System.out.println("userid: " + userId);
System.out.println("userpw: " + userEmail);
System.out.println("remember: " + remember);

// 관리자의 아이디와 비밀번호
String adminId = "admin";
String adminEmail = "admin@korea.com";

// 아이디와 비밀번호가 관리자의 것과 일치하는지 확인
if (userId.equals(adminId) && userEmail.equals(adminEmail)) {
	System.out.println("로그인, 이메일 확인 완료");
	MemberVo member = MemberDao.getInstance().selectForLogin(userId, userEmail);
	// 사용자의 아이디와 비밀번호가 유효한지 확인
	if (member != null) {
		// 로그인 성공 시
		session.setAttribute("ID", userId);
		System.out.println("로그인에 성공하였습니다.");
		System.out.println(userId + "님 로그인 하셨습니다.");
%>
<script>
	alert("관리자 로그인 성공!");
	window.location.href = "member_list.jsp"; // 게시판 페이지로 이동
</script>
<%
} else {
// 로그인 실패 시
%>
<script>
	alert("로그인에 실패하였습니다.");
	window.location.href = "admin_loginForm.jsp"; // 로그인 폼 페이지로 이동
</script>
<%
}
} else {
// 아이디 혹은 비밀번호가 입력되지 않은 경우
%>
<script>
	alert("올바른 아이디와 이메일을 입력하세요.");
	window.location.href = "admin_loginForm.jsp"; // 로그인 폼 페이지로 이동
</script>
<%
}
%>