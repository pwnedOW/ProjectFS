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
	<div class="container">
		<div class="top_nav">
			<div class="top_nav_left">
				<p>메뉴</p>
			</div>

			<div class="top_nav_center">
				<p>FlameSoul Online</p>
			</div>

			<div class="top_nav_right">
				<%
				if (session.getAttribute("loginId") == null) {
				%>
				<button onclick="join()">회원가입</button>
				<script>
					function join() {
						location.href = "join_action.jsp";
					}
				</script>

				<button onclick="login()">로그인</button>
				<script>
					function login() {
						location.href = "login.jsp";
					}
				</script>
				<%
				} else {
				//Object 객체 타입 -> String 
				String loginId = session.getAttribute("loginId").toString();
				%>
				<h1><%=loginId%></h1>
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

		<div class="contents">
			<div class="img">
				<img alt="img" src="img/banner.jpg">
				<div class="index_user_box">
					<div class=start_box>
					<button class=btn_start onclick="gameStart()">GAME START</button>
						<script>
							function gameStart() {
								location.href = "gamestart.jsp";
							}
						</script>
					</div>
					<div class=index_login_box>
						<p>이메일로 로그인하세요.</p>
						<button class=index_btn_login onclick="login()">로그인</button>
						<script>
							function login() {
								location.href = "login.jsp";
							}
						</script>
					</div>
					<div class=index_join_box>
						<button onclick="join()">> 회원가입</button>
						<script>
							function join() {
								location.href = "join_action.jsp";
							}
						</script>
						
						<button onclick="find()">> ID/비밀번호 찾기</button>
						<script>
							function join() {
								location.href = "find_action.jsp";
							}
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>