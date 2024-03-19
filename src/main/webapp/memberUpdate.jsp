<%@page import="dto.MemberVo"%>
<%@page import="jdbc.dao.MemberDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

// 양식에 입력되었던 값 읽기
 String id = request.getParameter("id" );
 String email   = request.getParameter("email"  );
 String nickname = request.getParameter("nickname");

 System.out.println(id);
 System.out.println(email);
 System.out.println(nickname);
 
// 빈 칸이 하나라도 있으면 오류 출력하고 종료
 if (id == null || id.length() == 0 
 || email == null || email.length() == 0 
 || nickname == null || nickname.length() == 0) {
 %>
 <script>
 	alert('모든 항목이 빈칸 없이 입력되어야 합니다.');
 	history.back();
 </script>

<%
}
MemberDao dao = MemberDao.getInstance();
MemberVo member = new MemberVo(id,email,nickname);

dao.update(member);

session.setAttribute("member", member);
%>

<script>
    alert('수정이 완료되었습니다.');
    
    history.back(); // 이전 페이지로 이동
</script>