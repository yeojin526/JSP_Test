<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jdbc.dao.MemberDao"%>
<%@ page import="dto.MemberVo"%>
<%@ page import="java.sql.*"%>

<%
request.setCharacterEncoding("utf-8");

String userId = request.getParameter("userid");
String userEmail = request.getParameter("userpw");
String remember = request.getParameter("remember");

System.out.println("userid: " + userId);
System.out.println("userpw: " + userEmail);
System.out.println("remember: " + remember);

if (userId != null && !userId.isEmpty() && userEmail != null && !userEmail.isEmpty()) {
	MemberVo member = MemberDao.getInstance().selectForLogin(userId, userEmail);

	// 사용자의 아이디와 비밀번호가 유효한지 확인
	if (member != null) {
		session.setAttribute("ID", userId);
		// 로그인 성공 시	
		System.out.println("로그인에 성공하였습니다.");
		System.out.println(session.getAttribute("ID") + "님 로그인 하셨습니다.");
		
		if (remember != null) {   
	// 아이디 기억하기가 체크된 경우 쿠키 설정
	Cookie rememberCookie = new Cookie("remember", userId);
	rememberCookie.setMaxAge(60 * 60); // 1시간 유지되는 쿠키 생성
	response.addCookie(rememberCookie);
	System.out.println("쿠키 생성 완료!");

		} else {
	// 아이디 기억하기가 체크되지 않은 경우 쿠키 삭제
	Cookie rememberCookie = new Cookie("remember", "");
	rememberCookie.setMaxAge(0); // 쿠키 삭제
	response.addCookie(rememberCookie);
	System.out.println("쿠키 삭제");
		}
%>
<script>
	alert("로그인 성공!");
	window.location.href = "board_list_view.jsp"; // 게시판 페이지로 이동
</script>
<%
/*    response.sendRedirect("loginSuccess.jsp"); // 로그인 성공 페이지로 리다이렉트  */
} else {
// 로그인 실패 시
%>
<script>
	alert("로그인에 실패하였습니다.");
	window.location.href = "loginForm.jsp"; // 로그인 폼 페이지로 이동
</script>
<%
}
} else {
// 아이디 혹은 비밀번호가 입력되지 않은 경우
%>
<script>
	alert("올바른 아이디와 이메일을 입력하세요.");
	window.location.href = "loginForm.jsp"; // 로그인 폼 페이지로 이동
</script>
<%
}
%>

</html>