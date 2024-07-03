<%@ page import="db.dto.OverallDTO" %>
<%@ page import="db.dao.OverallDAO" %>
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
	
		OverallDAO overallDAO = new OverallDAO();
		UsersDAO usersDAO = new UsersDAO();
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		//처리 로직
		//id pw 맞는지!
		//DB 비교
		
		
		//id, pw 매개변수로 -> select .. from where id='id' and pw='pw';
		
		//result...
		if(usersDAO.login(email, pw) == false){
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
		
		System.out.println(email + " : " + pw);
		//결과 로그인 성공?
		session.setAttribute("loginId", email);
		//로그인 실패? -> id, pw 잘못되었습니다. -> 로그인 화면으로 이동! 
	%>
	
	
	
</body>
</html>