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
	<script>
		let answer = confirm('플레임소울 온라인/모바일 로그인 및 게임이용이 불가능하며,'
				+ '보유하신 모든 게임 캐릭터와 게임정보가 삭제됩니다. 정말로 탈퇴하시겠습니까?');
		if(answer == true) {
			location.href = "withdrawal_action.jsp";
		} else {
			history.back();
		}
	</script>
</body>
</html>