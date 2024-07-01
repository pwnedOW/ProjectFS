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
		String loginPassword = request.getParameter("loginPassword");
		String password = request.getParameter("modifyingPassword");
		String passwordCheck = request.getParameter("modifyingPasswordCheck");

		session.setAttribute("modifyingPassword", password);
		session.setAttribute("modifyingPasswordCheck", passwordCheck);
		session.setAttribute("loginPassword", loginPassword);

		if (session.getAttribute("loginPassword") != null) {
			loginPassword = session.getAttribute("loginPassword").toString();
		}

		UsersDAO usersDAO = new UsersDAO();

		boolean checkPasswordResult = usersDAO.checkPassword(loginPassword);

		

		System.out.println("현재 비밀번호 : " + loginPassword);
		System.out.println("변경할 비밀번호 : " + password);
		System.out.println("비밀번호 확인 : " + passwordCheck);

		
		if (checkPasswordResult && password.equals(passwordCheck)) {
			usersDAO.modifyPassword(password, loginPassword);
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
	%>
</body>
</html>
