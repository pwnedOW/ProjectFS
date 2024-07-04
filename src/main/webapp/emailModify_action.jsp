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
		request.setCharacterEncoding("UTF-8"); 
		
		String modifyingEmail = request.getParameter("modifyingEmail");
		
		String loginEmail = null;
				
		if(session.getAttribute("loginEmail") != null) {
			loginEmail = session.getAttribute("loginEmail").toString();
		}
		
		UsersDAO usersDAO = new UsersDAO();
		
		int result = usersDAO.modifyEmail(modifyingEmail ,loginEmail);
		
		if(result > 0){
			
	%>
			<script>
				alert('정상적으로 수정되었습니다. 다시 로그인해주세요');
				location.href="logout_action.jsp";
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