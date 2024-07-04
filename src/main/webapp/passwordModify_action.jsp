<%@ page import="db.dao.UsersDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<%
		String loginEmail = session.getAttribute("loginEmail").toString();
		String loginPassword = request.getParameter("loginPassword");
		String modifyingPassword = request.getParameter("modifyingPassword");
		String modifyingPasswordCheck = request.getParameter("modifyingPasswordCheck");

		if (session.getAttribute("loginPassword") != null) {
			loginPassword = session.getAttribute("loginPassword").toString();
		}

		UsersDAO usersDAO = new UsersDAO();

		boolean checkPassword = usersDAO.checkPassword(loginPassword);

		System.out.println("로그인한 이메일 : " + loginEmail);
		System.out.println("로그인한 비밀번호 : " + loginPassword);
		System.out.println("변경할 비밀번호 : " + modifyingPassword);
		System.out.println("비밀번호 확인 : " + modifyingPasswordCheck);
		
		if (checkPassword && modifyingPassword.equals(modifyingPasswordCheck)) {
			
			int modifyPassword = usersDAO.modifyPassword(modifyingPassword, loginEmail, loginPassword);
			
			if(modifyPassword > 0){
	%>
				<script>
					alert('정상적으로 수정되었습니다. 다시 로그인해주세요');
					location.href = "logout_action.jsp";
				</script>
	<%
			} else {
	%>
				<script>
					alert('수정할 수 없습니다.');
					history.back();
				</script>
	<%
			}
		} else {
	%>		
			<script>
				alert('수정할 수 없습니다.');
				history.back();
			</script>
	<%
		}
	%>

</body>
</html>
