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
	String mypage_password = request.getParameter("mypage_password");
	String password = request.getParameter("password");

	String loginPassword = null;

	if (session.getAttribute("loginPassword") != null) {
		loginPassword = session.getAttribute("loginPassword").toString();
	}

	if (mypage_password.length() > 30) {
	%>
	<script>
		alert('비밀번호는 30자리 이하로 설정해주세요.');
		history.back();
	</script>
	<%
	}

	if (!mypage_password.equals(loginPassword)) {
	%>
	<script>
		alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
		history.back();
	</script>
	<%
	}
	System.out.println(loginPassword);
	System.out.println(mypage_password);
	%>
	<script>
		location.href = "modifyUserInfo.jsp";
	</script>
</body>
</html>