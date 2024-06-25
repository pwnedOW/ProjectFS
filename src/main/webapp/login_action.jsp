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
		//로그인 입력한 값을 기준으로 로그인 여부 확인!
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//처리 로직
		//id pw 맞는지!
		//DB 비교 
		
		//id, pw 매개변수로 -> select .. from where id='id' and pw='pw';
		
		//result...
// 		if(result == null){
// 			//실패
// 		} else {
// 			//성공
// 		}
		
		System.out.println(id + " : " + pw);
		//결과 로그인 성공?
		session.setAttribute("loginId", id);
		//로그인 실패? -> id, pw 잘못되었습니다. -> 로그인 화면으로 이동! 
	%>
	
	<script>
		alert('로그인 성공');
		location.href = "index.jsp";
	</script>
</body>
</html>