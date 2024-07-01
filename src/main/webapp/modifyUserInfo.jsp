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
	<%
	String loginEmail = session.getAttribute("loginEmail").toString();
	%>
	<div class="modify_container">
		<div class="modify_nav">
			<div class="modify_nav_left">
				<p>
					<a href="index.jsp">Flame Soul</a>
				</p>
				<p>
					<a href="index.jsp">Online</a>
				</p>
			</div>

			<div class="modify_nav_center">
				<p>MY PAGE</p>
			</div>

			<div class="modify_nav_right">
				<%
				if (session.getAttribute("loginId") == null) {
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
				%>
				<p><%=loginEmail%></p>

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
		<div class="modify_contents">
			<div class="modify_contents_left">
				<div class="modify_tabs">
					<button class="modify_tablink"
						onclick="openTab(event, 'change_email')">이메일 변경하기</button>
					<button class="modify_tablink"
						onclick="openTab(event, 'change_password')">비밀번호 변경하기</button>
					<button class="modify_tablink"
						onclick="openTab(event, 'withdrawal')">회원탈퇴</button>
				</div>
			</div>

			<div id="change_email" class="modify_contents_right">
				<div class="userInfo_container">
					<div class="change">
						<p>현재 이메일 <%=loginEmail%>  </p>
						<!--이메일 수정-->
						<form action="emailModify_action.jsp" method="post">
							<label>새 이메일</label> <input type="email" name="modifyingEmail">
							<button type="submit">확인</button>
						</form>
					</div>
				</div>
			</div>

			<div id="change_password" class="tabcontent" style="display: none">
				<div class="userInfo_container">
					<div class="change">
						<form action="passwordModify_action.jsp" method="post">
							<label>현재 비밀번호 입력</label><input type="password" name="loginPassword"><br>
							<label>새 비밀번호 입력</label><input type="password" name="modifyingPassword"><br>
							<label>비밀번호 입력 확인</label><input type="password" name="modifyingPasswordCheck"><br>
							<button type="submit">확인</button>
						</form>
					</div>
				</div>
			</div>

			<div id="withdrawal" class="tabcontent" style="display: none">
				<div class="userInfo_container">
					<div class="change">
						<form action="withdrawalCheck_action.jsp" method="post"
							id="form_withdrawal">
							<input type="checkbox" id="chk_box"><p>위의 회원탈퇴 시 주의사항을 모두 확인하였습니다.</p><br>
							<button type="submit">회원 탈퇴</button>
							<br>
						</form>
						<script>
			        		const form_withdrawal = document.querySelector('#form_withdrawal');
			
			        		form_withdrawal.addEventListener('submit', (e)=>{
			            		e.preventDefault(); // 기본 이벤트 중지: submit 폼 전송 막기!
			
			            	let chk_box = document.querySelector('#chk_box');
			
			
			            	if(!chk_box.checked){
				                alert('유의사항에 동의해주세요.');
				                chk_box.focus();
				                return false;
				            }
				            form_withdrawal.submit();
					        });
					    </script>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="modifyUserInfo.js"></script>
</body>
</html>