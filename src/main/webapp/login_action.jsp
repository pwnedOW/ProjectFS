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
		UsersDAO usersDAO = new UsersDAO();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if("admin@fsonline.com".equals(email) && "1234".equals(password)){
		%>
				<script>
				alert('관리자 로그인');
				location.href = "adminPage.jsp";
				</script>
		<%
		}
		
		System.out.println(email + " : " + password);
		if(usersDAO.login(email, password) == false){
		%>
			<script>
				alert('아이디 또는 비밀번호를 확인해주세요');
				location.href = "login.jsp";
			</script>

		<%	
		} else {
			session.setAttribute("loginEmail", email);
			session.setAttribute("loginPassword", password);
		%>
		<script>
			location.href = "index.jsp";
		</script>
		<%
		}
		%>
</body>
</html>