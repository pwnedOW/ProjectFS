<%@ page import="db.dao.UsersDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%

	String email = session.getAttribute("loginEmail").toString();
	
	UsersDAO usersDAO = new UsersDAO();
	
	int user_no = usersDAO.getUser_noByEmail(email);
	System.out.println(email);
	System.out.println(user_no);
	usersDAO.deleteUserByUser_no(user_no);
	
	%>
	
	<script>
		alert('회원 탈퇴가 완료되었습니다.');
		location.href="logout_action.jsp";
	</script>
</body>
</html>