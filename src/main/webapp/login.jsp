<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<div class="container_login">
		<div class=login_login_box>
			<p>FlameSoul</p>
			<div class=login_form>
				<form action="login_action.jsp" method="post">
					<input type="email" name="id" placeholder="EMAIL"> <br>
					<input type="password" name="pw" placeholder="PASSWORD"> <br>
					<button type="submit">LOGIN</button>
				</form>
			</div>
			<div class="login_find">
				<div class="login_find_left">
					<button onclick="login_join()">> 회원가입</button>
					<script>
						function login_join() {
							location.href = "login_join_action.jsp";
						}
					</script>
				</div>
				<div class=login_find_right>
					<button class="findId" onclick="findId()">> ID 찾기</button>
					<script>
						function findId() {
							location.href = "findId.jsp";
						}
					</script>
					<button class="findPw" onclick="findPw()">> 비밀번호 찾기</button>
					<script>
						function findPw() {
							location.href = "findPw.jsp";
						}
					</script>
				</div>
			</div>
		</div>
	</div>


</body>
</html>