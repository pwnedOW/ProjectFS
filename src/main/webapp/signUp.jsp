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
	<div class="container_signUp">
		<div class=signUp_signUp_box>
			<p>Flame Soul</p>
			<p>Online</p>
			<div class=signUp_form>
				<form action="signUp_action.jsp" method="post" id="form_signUp">
					<input type="email" name="email" maxlength="30" id="input_email" placeholder="EMAIL"><br> 
					<input type="password" name="password" maxlength="30" id="input_password" placeholder="PASSWORD"> <br>
					<input type="password" name="password" maxlength="30" id="input_password_check" placeholder="PASSWORD CHECK"> <br>
					<input type="text" name="name" maxlength="5" id="input_name" oninput="numberMaxLength(this);" placeholder="NAME"> <br>
					<input type="text" name="birth" maxlength="6" id="input_birth" placeholder="BIRTH ex)981026"> <br>
					<input type="tel" name="tel" maxlength="11" id="input_tel" placeholder="TEL"> <br>

					<button type="submit">SIGN UP</button>

					<script>
	
	 	function numberMaxLength(e){
		    if(e.value.length > e.maxLength){
		        e.value = e.value.slice(0, e.maxLength);
		    }
		}
			
		const form_signUp = document.querySelector('#form_signUp');
		
		form_signUp.addEventListener('submit', (e)=>{
			e.preventDefault();
			
			let input_email = document.querySelector('#input_email');
			let input_password = document.querySelector('#input_password');
			let input_password_check = document.querySelector('#input_password_check');
			let input_name = document.querySelector('#input_name');
			let input_birth = document.querySelector('#input_birth');
			let input_tel = document.querySelector('#input_tel');
			
			input_email.value = input_email.value.trim();
			input_password.value = input_password.value.trim();
			input_password_check.value = input_password_check.value.trim();
			input_name.value = input_name.value.trim();
			input_birth.value = input_birth.value.trim();
			input_tel.value = input_tel.value.trim();
				
				
			if(input_email.value.trim() == '' || input_email.value.trim() == null ){
				alert('이메일은 필수입력입니다.');
				input_email.focus();
				return false;
			}
			
			if(input_password.value.trim() == '' || input_password.value.trim() == null ){
				alert('비밀번호는 필수입력입니다.');
				input_password.focus();
				return false;
			}
			
			if(input_password_check.value.trim() == '' || input_password_check.value.trim() == null ){
				alert('비밀번호 확인은 필수입력입니다.');
				input_password_check.focus();
				return false;
			}
			
			if(input_password.value.trim() != input_password_check.value.trim()){
				alert('비밀번호가 다릅니다.');
				input_password_check.focus();
				return false;
			}
			
			if(input_name.value.trim() == '' || input_name.value.trim() == null ){
				alert('이름은 필수입력입니다.');
				input_name.focus();
				return false;
			}
			
			
			
			if(input_birth.value.trim() == '' || input_birth.value.trim() == null ){
				alert('생년월일은 필수입력입니다.');
				input_birth.focus();
				return false;
			}
			
				// 6자리 생년월일
				const birth = document.querySelector("#input_birth").value.trim();
				const regBirth = /^([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))$/;
			
				if(!regBirth.test(birth)) {
				    alert('정확한 생년월일 6자리를 입력해주세요');
				    return;
				}
		
			
			
			if(input_tel.value.trim() == '' || input_tel.value.trim() == null ){
				alert('전화번호는 필수입력입니다.');
				input_tel.focus();
				return false;
			}
			
			// '-'이 상관없는 버전
			const tel = document.querySelector("#input_tel").value.trim();
			const regTel = /^01([0|1|6|7|8|9])-?([0-9]{4})-?([0-9]{4})$/;

			if(!regTel.test(tel)) {
			    alert('정확한 핸드폰번호를 입력해주세요');
			    return;
			}
			
			form_signUp.submit();

		});
	
	</script>

				</form>
			</div>

		</div>
	</div>


</body>
</html>