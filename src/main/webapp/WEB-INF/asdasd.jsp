<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="index_login_box">
		<%
		if (session.getAttribute("loginId") == null) {
		%>
		<p>이메일로 로그인하세요.</p>
		<button class=index_btn_login onclick="login()">로그인</button>
		<script>
			function login() {
				location.href = "login.jsp";
			}
		</script>

		<div class=index_join_box>
			<button onclick="join()">> 회원가입</button>
			<script>
				function join() {
					location.href = "join.jsp";
				}
			</script>
			<%
			} else {
			//Object 객체 타입 -> String 
			String loginId = session.getAttribute("loginId").toString();
			%>
			<div class=user_infor>
				<p><%=loginId%></p>
				<button onclick="myPage()">마이페이지</button>
				<script>
					function myPage() {
						location.href = "myPage.jsp";
					}
				</script>

				<button onclick="logout()">로그아웃</button>
				<script>
					function logout() {
						location.href = "logout_action.jsp";
					}
				</script>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>