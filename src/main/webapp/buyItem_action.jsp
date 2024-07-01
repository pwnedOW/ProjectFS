<%@ page import="db.dao.OverallDAO"%>
<%@ page import="db.dao.Cash_logDAO"%>
<%@ page import="db.dao.Cash_itemDAO"%>
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
	Cash_itemDAO cash_itemDAO = new Cash_itemDAO();
	UsersDAO usersDAO = new UsersDAO();
	
	String email = session.getAttribute("loginEmail").toString();
	String item_name = request.getParameter("itemInfo");
	
	int item_price = Integer.parseInt(request.getParameter("itemPrice"));
	
	
	int user_no = usersDAO.getUser_noByEmail(email);
	int item_no = cash_itemDAO.getItem_noByItem_name(item_name);
	
	System.out.println("유저번호 : " + user_no);
	System.out.println("유저잔액 : " + overallDAO.getBalanceByUser_no(user_no));
	System.out.println("아이템번호 : " + item_no);
	
	cash_logDAO.buyItem(user_no, item_price, item_no);
%>


	<script>
		alert('구매가 완료되었습니다.');
		window.close();
	</script>
</body>
</html>