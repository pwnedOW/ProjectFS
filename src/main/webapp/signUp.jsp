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
	<div class="container_signUp">
		<div class=signUp_signUp_box>
			<p>Flame Soul</p>
			<p>Online</p>
			<div class=signUp_form>
				<form action="signUp_action.jsp" method="post">
					<input type="email" name="id" placeholder="EMAIL"> <br>
					<input type="password" name="pw" placeholder="PASSWORD"> <br>
					<input type="password" name="pw" placeholder="PASSWORD CHECK"> <br>
					<input type="text" name="name" placeholder="NAME"> <br>
					<input type="text" name="birth" placeholder="BIRTH ex)981026"> <br>
					<input type="tel" name="tel" placeholder="TEL"> <br>

					<button onclick="signUp_action()">SIGN UP</button>
					<script>
						function signUp_action() {
							location.href = "signUp_action.jsp";
						}
					</script>

				</form>
			</div>

		</div>
	</div>


</body>
</html>