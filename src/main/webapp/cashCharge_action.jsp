<%@ page import="db.dao.UsersDAO"%>
<%@ page import="db.dao.Cash_logDAO"%>
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
	Cash_logDAO cash_logDAO = new Cash_logDAO();
	UsersDAO usersDAO = new UsersDAO();
	String email = session.getAttribute("loginEmail").toString();
	int chargeAmount = 0;
	int amountParam = Integer.parseInt(request.getParameter("amount"));
	if (amountParam != 0) {
		try {
			chargeAmount = amountParam;
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}
	
	int user_no = usersDAO.getUser_noByEmail(email);
	cash_logDAO.chargeCashByUser_no(user_no, amountParam);
	%>
	
	<script>
		alert('충전이 완료되었습니다.');
		window.close();
	</script>
</body>
</html>