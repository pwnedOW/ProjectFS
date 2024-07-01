<%@ page import="db.dao.Time_logDAO"%>
<%@ page import="db.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Last Login</title>
</head>
<body>
	<%
	UsersDAO usersDAO = new UsersDAO();
	String email = session.getAttribute("loginEmail").toString();
	
	int user_no = usersDAO.getUser_noByEmail(email);
	
	Time_logDAO time_logDAO = new Time_logDAO();

	time_logDAO.getTime_logByUser_no(user_no);
	System.out.println(user_no);
	
	%>
	
	<script>
	 	alert("클라이언트가 실행 중 입니다.");
	 	location.href ="index.jsp";
	</script>
</body>
</html>
