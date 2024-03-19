<%@page import="dto.Board"%>
<%@page import="jdbc.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.time.*" %>
 
<%
    request.setCharacterEncoding("utf-8");

    // 양식에 입력되었던 값 읽기
     int    num     = Integer.parseInt(request.getParameter("num"));
     String writer = (String) session.getAttribute("ID");
     String title   = request.getParameter("title"  );
     String content = request.getParameter("content");
    
  // 빈 칸이 하나라도 있으면 오류 출력하고 종료
     if (title == null || title.length() == 0 
     || content == null || content.length() == 0) {
     %>
     <script>
     	alert('모든 항목이 빈칸 없이 입력되어야 합니다.');
     	history.back();
     </script>
     <%
     return;
     }
     
  //값 확인용 출력
     System.out.println("num: "+num);     System.out.println("writer: "+writer);
     System.out.println("title: "+title);     System.out.println("content: "+content);

    BoardDao dao = BoardDao.getInstance();
    Board board = new Board(num, title, content);
	
    System.out.println("update 작업 시작");
    
    dao.update(board); 
    
    System.out.println("update 작업 완료");
    
    // 게시판으로 돌아감
    response.sendRedirect("board_list_view.jsp");
%>     