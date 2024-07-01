<%@ page import="db.dao.UsersDAO" %>
<%@ page import="db.dao.OverallDAO" %>
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
		String password = request.getParameter("password");
		
		//처리 로직
		//id pw 맞는지!
		//DB 비교 
		
		//id, pw 매개변수로 -> select .. from where id='id' and pw='pw';
		if("admin@fsonline.com".equals(email) && "1234".equals(password)){
			System.out.println("관리자 로그인 성공!");
		%>
				<script>
				alert('관리자 로그인');
				location.href = "adminPage.jsp";
				</script>
		<%
		}
		
		//result...
		System.out.println(email + " : " + password);
		//결과 로그인 성공?
		session.setAttribute("loginEmail", email);
		session.setAttribute("loginPassword", password);
		
		if(usersDAO.login(email, password) == false){
		%>
			<script>
				alert('아이디 또는 비밀번호를 확인해주세요');
				location.href = "login.jsp";
			</script>

	<%	
			}else{
	%>
		<script>
			alert('로그인 성공');
			location.href = "index.jsp";
		</script>
	<%
		}
		
		
		//로그인 실패? -> id, pw 잘못되었습니다. -> 로그인 화면으로 이동! 
				
		
	%>
</body>
</html>