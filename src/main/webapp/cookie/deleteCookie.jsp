<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length>0){ 				//쿠키 배열값에 데이터가 존재할 때
		for(int i = 0; i<cookies.length; i++){				//전체 쿠키 개수만큼 반복문
			if(cookies[i].getName().equals("name")){		//쿠키의 '이름'이 name이면
				Cookie cookie= new Cookie("name", "");	    //'이름 값'이 없는 쿠키의
				cookie.setMaxAge(0);						//★★'유효시간'을 0으로 지정★★★
				response.addCookie(cookie);					//브라우저에 응답한다. (새로고침 느낌?)
															//(유효시간이 0이므로)브라우저가 쿠키를 삭제함.			
			}
		}
	}
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 삭제</title>
</head>
<body>
쿠키가 삭제되었습니다.
</body>
</html>