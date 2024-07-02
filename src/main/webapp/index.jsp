<%@page import="db.dto.Time_logDTO"%>
<%@page import="java.util.List"%>
<%@ page import = "db.dao.Time_logDAO" %>
<%@ page import = "db.dao.UsersDAO" %>
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
				<p><a href="index.jsp">Flame Soul</a></p>
				<p><a href="index.jsp">Online</a></p>
			</div>

			<div class="top_nav_center">
				<ul>
					<li><a href="#">게임소식</a>
						<ul>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">업데이트</a></li>
							<li><a href="#">이벤트</a></li>
							<li><a href="#">캐시샵공지</a></li>
							<li><a href="#">공지사항</a></li>
						</ul></li>
					<li><a href="#">가이드</a>
						<ul>
							<li><a href="#">게임정보</a></li>
							<li><a href="#">퀘스트정보</a></li>
							<li><a href="#">확룰형 아이템</a></li>
							<li><a href="#">조작키 가이드</a></li>
							<li><a href="#">스킬 가이드</a></li>
						</ul></li>
					<li><a href="#">직업소개</a>
						<ul>
							<li><a href="#">전사</a></li>
							<li><a href="#">마법사</a></li>
							<li><a href="#">궁수</a></li>
							<li><a href="#">도적</a></li>
							<li><a href="#">해적</a></li>
						</ul></li>
					<li><a href="cashShop.jsp">캐시샵</a>
						<ul>
							<li><a href="#">전체보기</a></li>
							<li><a href="#">장비아이템</a></li>
							<li><a href="#">확률형 아이템</a></li>
							<li><a href="#">소비 아이템</a></li>
							<li><a href="#">펫</a></li>
						</ul></li>
					<li><a href="#">미디어</a>
						<ul>
							<li><a href="#">영상</a></li>
							<li><a href="#">음악</a></li>
							<li><a href="#">아트웍</a></li>
							<li><a href="#">플레이 영상</a></li>
							<li><a href="#">가이드 영상</a></li>
						</ul></li>
					<li><a href="#">다운로드</a>
						<ul>
							<li><a href="#">클라이언트 다운로드</a></li>
							<li><a href="#">클라이언트 재설치</a></li>
							<li><a href="#">드라이버 업데이트</a></li>
						</ul></li>
				</ul>
			</div>

			<div class="top_nav_right">
				<%
				if (session.getAttribute("loginEmail") == null) {
				%>
				<button onclick="signUp()">회원가입</button>
				<script>
					function signUp() {
						location.href = "signUp.jsp";
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
				String loginId = session.getAttribute("loginEmail").toString();
				%>
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

		<div class="contents">
			<div class="contents_img">
				<div class="index_user_box">
					<div class=start_box>
						<button class=btn_start onclick="gameStart()">GAME START</button>
						<script>
							function gameStart() {
								location.href = "gameStart_action.jsp";
							}
						</script>
					</div>

					<%
					if (session.getAttribute("loginEmail") == null) {
					%>
					<div class=index_login_box>
						<p>이메일로 로그인하세요.</p>
						<button class=index_btn_login onclick="login()">로그인</button>
						<script>
							function login() {
								location.href = "login.jsp";
							}
						</script>
					</div>
					<div class=index_signUp_box>
						<button onclick="signUp()">> 회원가입</button>
						<script>
							function signUp() {
								location.href = "signUp.jsp";
							}
						</script>

						<button onclick="find()">> ID/비밀번호 찾기</button>
						<script>
							function join() {
								location.href = "find.jsp";
							}
						</script>
					</div>
					<%
					} else {
					//Object 객체 타입 -> String 
					if(session.getAttribute("loginEmail") != null) {
						String loginEmail = session.getAttribute("loginEmail").toString();
					%>
					<div class=index_login_box>
						<p><%=loginEmail%>님 반갑습니다.</p>
						<button class=index_btn_login onclick="logout()">LOGOUT</button>
						<script>
							function logout() {
								location.href = "logout_action.jsp";
							}
						</script>
					</div>

					<div class=index_signUp_box>
						<button onclick="myPage()">> 마이페이지</button>
						<script>
							function myPage() {
								location.href = "myPage.jsp";
							}
						</script>
						<%
						UsersDAO usersDAO = new UsersDAO();
						String email = session.getAttribute("loginEmail").toString();
						
						int user_no = usersDAO.getUser_noByEmail(email);
                        Time_logDAO time_logDAO = new Time_logDAO();
                        String last_login = time_logDAO.getLast_login(user_no);
                        
                        if(last_login == null) {
                        	%>
                        	<button>접속기록없음</button>
                        	<%
                        } else {
						%>
						<button><%=last_login%></button>
					</div>

					<%
                       	 }
						}
					}
					%>

				</div>
			</div>
		</div>
	</div>
</body>
</html>