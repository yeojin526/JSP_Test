<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length>0){ 				//쿠키 배열값에 데이터가 존재할 때
		for(int i = 0; i<cookies.length; i++){				//전체 쿠키 개수만큼 반복문
			if(cookies[i].getName().equals("name")){		//'name'라는 '이름'을 가진 쿠키가 존재하면
				Cookie cookie= new Cookie("name", "KKA");	//★★★'이름 값'을 KKA로 지정한 쿠키를 생성하여★★★
				response.addCookie(cookie);					//브라우저에 응답한다. (새로고침 느낌?)
			}
		}
	}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 수정</title>
</head>
<body>
쿠키가 수정되었습니다.
</body>
</html>