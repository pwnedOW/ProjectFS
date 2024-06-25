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
			<p>FlameSoul</p>
			<p>Online</p>
			<div class=signUp_form>
				<form action="signUp_action.jsp" method="post">
					<input type="email" name="id" placeholder="EMAIL"> <br>
					<input type="password" name="pw" placeholder="PASSWORD"> <br>
					<input type="text" name="pw" placeholder="NAME"> <br>
					<input type="date" name="pw" placeholder="BIRTH"> <br>
					<input type="tel" name="pw" placeholder="TEL"> <br>
					<button type="submit">SIGN UP</button>
				</form>
			</div>

		</div>
	</div>


</body>
</html>