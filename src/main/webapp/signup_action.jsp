<%@ page import="db.dao.UsersDAO"%>
<%@ page import="db.dto.UsersDTO"%>
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
	UsersDAO usersDAO = new UsersDAO();

	String email = request.getParameter("email");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");

	UsersDTO user1 = new UsersDTO();

	%>
	<script>
		alert('아이디 또는 비밀번호를 확인해주세요')
		location.href = "login.jsp";
	</script>

	<%
	} else {
	%>
	<script>
		alert('로그인 성공');
		location.href = "login.jsp";
	</script>
	<%
	}
	%>
</body>
</html>