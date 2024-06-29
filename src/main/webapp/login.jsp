<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>
=======
    pageEncoding="UTF-8"%>
>>>>>>> 7229994438767737ac3babb84e0b54a41c30b4f5
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>Login</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<div class="container_login">
		<div class="login_login_box">
			<p>Flame Soul</p>
			<p>Online</p>
			<div class="login_form">
				<form action="login_action.jsp" method="post">
					<input type="email" name="email" placeholder="EMAIL"> <br>
					<input type="password" name="password" placeholder="PASSWORD"> <br>
					<button type="submit">LOGIN</button>
				</form>
			</div>
			<div class="login_find">
				<div class="login_find_left">
					<button onclick="signUp()">회원가입</button>
					<script>
						function signUp() {
							location.href = "signUp.jsp";
						}
					</script>
				</div>
				<div class="login_find_right">
					<button onclick="findAccount()">ID/PW 찾기</button>
					<script>
						function findAccount() {
							location.href = "findAccount.jsp";
						}
					</script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
=======
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	
	<form action="login_action.jsp" method="post">
		아이디 : <input type="email" name="email"> <br>
		비밀번호 : <input type="password" name="pw"> <br>
		<button type="submit">로그인</button>
	</form>
</body>
</html>
>>>>>>> 7229994438767737ac3babb84e0b54a41c30b4f5
