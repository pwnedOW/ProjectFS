<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플레임소울 온라인</title>
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
				if (loginEmail == null) {
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
						<p>현재 이메일 <%=loginEmail%> </p>
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
							<ul>
								<li>
									<h2>1. 게임이용 불가, 캐릭터 삭제</h2>
									<p>
										계정 삭제 시 영구히 사용할 수 없으며, 해당 계정으로 구매한 모든 게임(캐릭터, 아이템, 전적, 유료 콘텐츠 일체) 또한 영구히 삭제됩니다.
									</p>
								<li>
								
								<li>
									<h2>2. 게시글 비공개 처리, 삭제</h2>
									<p>
										 탈퇴 후에도 등록하였던 게시물(커뮤니티 게시글 및 댓글)은 그대로 남아있습니다.<br>
										 삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.
									</p>
								<li>
								
								<li>
									<h2>3. 회원탈퇴 복구 가능 기간</h2>
									<p>
										회원탈퇴를 신청한 계정은 신청일로부터 15일간 계정 복구(탈퇴 취소)가 가능하며,<br>
										기간 경과(신청일로부터 30일간 보관) 이후 영구 삭제 처리됩니다.
									</p>
								<li>
								
								<li>
									<h2>4. 개인정보 수집 에 대한 내용</h2>
									<p>
										법령에 따라 보존의무가 있는 정보는 회원 탈퇴 이후에도 해당 기간동안 보관될 수 있습니다.
									</p>
								<li>
								
								<li>
									<h2>5. 연결된 외부 서비스 이용 불가</h2>
									<p>
										회원탈퇴 시 계정으로 로그인하여 사용한 외부 서비스들은 이용할 수 없습니다.<br>
										외부 서비스에 이미 전달된 개인 정보와 이용 기록의 삭제를 원하시는 경우 해당 서비스에서 직접 탈퇴를 진행해 주세요.
									</p>
								<li>
							</ul>
							
							<input type="checkbox" id="chk_box">위의 회원탈퇴 시 주의사항을 모두 확인하였습니다.<br>
							<button type="submit">회원 탈퇴</button>
							<br>
						</form>
						<script>
			        		const form_withdrawal = document.querySelector('#form_withdrawal');
			
			        		form_withdrawal.addEventListener('submit', (e)=>{
			            		e.preventDefault(); 
			
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