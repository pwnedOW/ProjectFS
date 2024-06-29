<<<<<<< HEAD
<%@ page import="db.dto.OverallDTO"%>
<%@ page import="db.dao.OverallDAO"%>
<%@ page import="db.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
=======
<%@ page import="db.dto.OverallDTO" %>
<%@ page import="db.dao.OverallDAO" %>
<%@ page import="db.dao.UsersDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
>>>>>>> 7229994438767737ac3babb84e0b54a41c30b4f5
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD

=======
	
>>>>>>> 7229994438767737ac3babb84e0b54a41c30b4f5
	<%
	
		OverallDAO overallDAO = new OverallDAO();
		UsersDAO usersDAO = new UsersDAO();
		
		String email = request.getParameter("email");
<<<<<<< HEAD
		String password = request.getParameter("password");
=======
		String pw = request.getParameter("pw");
>>>>>>> 7229994438767737ac3babb84e0b54a41c30b4f5
		
		//처리 로직
		//id pw 맞는지!
		//DB 비교
		
		
		//id, pw 매개변수로 -> select .. from where id='id' and pw='pw';
<<<<<<< HEAD
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
			//alert('로그인 성공');
			location.href = "index.jsp";
		</script>
	<%
		}
		
		
		//로그인 실패? -> id, pw 잘못되었습니다. -> 로그인 화면으로 이동! 
				
		
	%>



=======
		
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
	
	
	
>>>>>>> 7229994438767737ac3babb84e0b54a41c30b4f5
</body>
</html>