<%@ page import="db.dao.Time_logDAO"%>
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
		request.setCharacterEncoding("UTF-8"); 
		System.out.println(request.getParameter("email"));
		System.out.println(request.getParameter("password"));
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("birth"));
		System.out.println(request.getParameter("tel"));
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String tel = request.getParameter("tel");
		
		UsersDAO usersDAO = new UsersDAO();
	
		if (password.length() > 30) {
    // 비밀번호 길이가 30자 초과일 경우
		    %>
			<script>
		        alert('비밀번호는 30자리 이하로 설정해주세요.');
		        history.back();
		    </script>
			<%
		} else if (name.length() > 5) {
		    // 이름이 5자 초과일 경우
		    %>
			<script>
		        alert('올바른 이름을 입력해주세요.');
		        history.back();
		    </script>
			<%
		} else if (tel.length() > 11) {
		    // 전화번호가 11자 초과일 경우
		    %>
			<script>
		        alert('11자리 이하의 전화번호를 입력해주세요.');
		        history.back();
		    </script>
			<%
		    return;
		} else {
		
			int result = usersDAO.signUp(email, password, name, birth, tel);
			
			
			if (result > 0) {
				Time_logDAO time_logDAO = new Time_logDAO();
				int user_no = usersDAO.getUser_noByEmail(email);
				time_logDAO.newUser(user_no);
			    %>
				<script>
			        alert('회원가입이 완료되었습니다.');
			        location.href = 'index.jsp';
			    </script>
				<%
			} else {
			    %>
				<script>
			        alert('이미 존재하는 이메일 또는 이미 가입된 전화번호입니다.');
			        history.back();
			    </script>
				<%
			}
			System.out.println(result);
		}
		%>
		
		
</body>
</html>