<%@ page import="db.dao.OverallDAO"%>
<%@ page import="db.dao.Cash_logDAO"%>
<%@ page import="db.dao.UsersDAO"%>
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
	Cash_logDAO cash_logDAO = new Cash_logDAO();
	UsersDAO usersDAO = new UsersDAO();
	
	String email = session.getAttribute("loginEmail").toString();
	
	int price = Integer.parseInt(request.getParameter("itemPrice"));
	String price = Integer.parseInt(request.getParameter("itemPrice"));
	
	int user_no = usersDAO.getUser_noByEmail(email);
	
	System.out.println(user_no);
	System.out.println(overallDAO.getBalanceByUser_no(user_no));
	System.out.println(email);
	
	cash_logDAO.buyItem(user_no, item_no);
	
	%>


	<script>
		alert('구매가 완료되었습니다.');
		window.close();
	</script>
</body>
</html>