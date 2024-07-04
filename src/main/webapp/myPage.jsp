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
	<div class="myPage_contents">
		<div class="myPage_nav">

			<div class="myPage_nav_left">
				<p>
					<a href="index.jsp">Flame Soul</a>
				</p>
				<p>
					<a href="index.jsp">Online</a>
				</p>
			</div>

			<div class="myPage_nav_center">
				<p>MY PAGE</p>
			</div>

			<div class="myPage_nav_right">
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
				String loginEmail = session.getAttribute("loginEmail").toString();
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
		<div class=confirmSelf>
			<form action="myPage_action.jsp" method="post" id="form_myPage">
				<h3>본인확인</h3>
					<p>고객님의 소중한 개인정보보호를 위해서 본인확인을 진행합니다.</p>
				<div class=myPage_inner_box>

					<label>비밀번호 확인</label>
					<input type="password" name="mypage_password"
						maxlength="40" id="mypage_password">
					<button type="submit">확인</button>
				</div>
			</form>

			<script>
        const form_myPage = document.querySelector('#form_myPage');

        form_myPage.addEventListener('submit', (e)=>{
            e.preventDefault(); // 기본 이벤트 중지: submit 폼 전송 막기!

            let mypage_password = document.querySelector('#mypage_password');

            mypage_password.value = mypage_password.value.trim();

            if(mypage_password.value.trim() == '' || mypage_password.value.trim() == null ){
                alert('비밀번호는 필수입력입니다.');
                mypage_password.focus();
                return false;
            }
            form_myPage.submit();
        });
    </script>
		</div>
	</div>

</body>
</html>