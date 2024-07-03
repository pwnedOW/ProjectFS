<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	
	<form action="signup_action.jsp" method="post">
		이메일 : <input type="email" name="email"> <button>중복확인</button><br>
		비밀번호 : <input type="password" name="pw"> <br>
		본명 : <input type="text" name="name"> <br>
		생년월일 : <input type="date" name="birth"> <br>
		전화번호 : <input type="tel" name="tel"> <br>
		
		<button type="submit">회원가입</button>
	</form>
</body>
</html>