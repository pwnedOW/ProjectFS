<%@ page import="java.util.List"%>

<%@ page import="db.dto.Cash_itemDTO"%>

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
<link rel="stylesheet" href="./css/style.css">
</head>
<body>

	<%
	OverallDAO overallDAO = new OverallDAO();
	Cash_logDAO cash_logDAO = new Cash_logDAO();
	UsersDAO usersDAO = new UsersDAO();
	Cash_itemDAO cash_itemDAO = new Cash_itemDAO();
	List<Cash_itemDTO> equipment_itemList = cash_itemDAO.getEquipment_itemList();
	List<Cash_itemDTO> consumption_itemList = cash_itemDAO.getConsumption_itemList();
	List<Cash_itemDTO> probability_itemList = cash_itemDAO.getProbability_itemList();
	List<Cash_itemDTO> pet_itemList = cash_itemDAO.getPet_itemList();
	
	String email = (String) session.getAttribute("loginEmail");
	
	
	int  user_no = usersDAO.getUser_noByEmail(email);
	int  balance = overallDAO.getBalanceByUser_no(user_no);
	%>
	<div class="cash_contents">
		<div class="cash_nav">

			<div class="cash_nav_left">
				<p>
					<a href="index.jsp">Flame Soul</a>
				</p>
				<p>
					<a href="index.jsp">Online</a>
				</p>
			</div>

			<div class="cash_nav_center">
				<p>CASH SHOP</p>
			</div>

			<div class="cash_nav_right">
				<button onclick="cashCharge()">캐시충전</button>
				<script>
					function cashCharge() {
						location.href = "cashCharge.jsp";
					}
				</script>
				<button onclick="cashHistory()">구매내역</button>
				<script>
					function cashHistory() {
						location.href = "cashHistory.jsp";
					}
				</script>
			</div>

		</div>


		<div class="cash_nav_top">
			<%
			if (session.getAttribute("loginEmail") == null) {
			%>
			<p>로그인을 하시면 나의 캐시 정보를 확인할 수 있습니다.</p>
			<button onclick="login()">로그인</button>
			<script>
				function login() {
					location.href = "login.jsp";
				}
			</script>
			<%
			} else {
			%>
			<div class="user_cash_info">

				<div class="cash_info_left">
					<p><%=email%></p>
					<p>
						보유 캐시 :<%=balance %></p>
				</div>

				<div class="cash_info_left">
					<button onclick="logout()">로그아웃</button>
					<script> 
 						function logout() {
 							location.href = "logout_action.jsp";
 						}
 					</script>
				</div>
			</div>
			<%
 			}
%>
		</div>

		<div class="tabs">
			<button class="tablink" onclick="openTab(event, 'equipment_item')">장비
				아이템</button>
			<button class="tablink" onclick="openTab(event, 'consumption_item')">소비
				아이템</button>
			<button class="tablink" onclick="openTab(event, 'probability_item')">확률형
				아이템</button>
			<button class="tablink" onclick="openTab(event, 'pet_item')">펫
				아이템</button>
		</div>

		<div id="equipment_item" class="tabcontent">
			<div class="cash_container">
				<% 
        for(Cash_itemDTO equipment_item : equipment_itemList){
        %>
				<div class="item">
					<img src="img/e<%=equipment_item.getItem_no()%>.png"
						alt="equipment_item <%=equipment_item.getItem_no() %>">
					<p><%=equipment_item.getItem_name() %></p>
					<br> <span class="price"><%=equipment_item.getItem_price()%></span><br>

					<button onclick="openPurchaseWindow()">구매하기</button>
				</div>
				<% 
        }
        %>
			</div>
		</div>
		<div id="consumption_item" class="tabcontent" style="display: none">
			<div class="cash_container">
		<% 
        for(Cash_itemDTO consumption_item : consumption_itemList){
        %>
				<div class="item">
					<img src="img/temp<%=consumption_item.getItem_no()%>.png"
						alt="consumption_item <%=consumption_item.getItem_no() %>">
					<p><%=consumption_item.getItem_name() %></p>
					<br> <span class="price"><%=consumption_item.getItem_price()%></span><br>

					<button onclick="openPurchaseWindow()">구매하기</button>
				</div>
		<% 
        }
        %>
			</div>
		</div>

		<div id="probability_item" class="tabcontent" style="display: none">
			<div class="cash_container">
				<% 
		        for(Cash_itemDTO probability_item : probability_itemList){
		        %>
						<div class="item">
							<img src="img/p<%=probability_item.getItem_no()%>.png"
								alt="probability_item <%=probability_item.getItem_no() %>">
							<p><%=probability_item.getItem_name() %></p>
							<br> <span class="price"><%=probability_item.getItem_price()%></span><br>
		
							<button onclick="openPurchaseWindow()">구매하기</button>
						</div>
				<% 
		        }
		        %>
			</div>
		</div>

		<div id="pet_item" class="tabcontent" style="display: none">
			<div class="cash_container">
				<% 
		        for(Cash_itemDTO pet_item : pet_itemList){
		        %>
						<div class="item">
							<img src="img/pet<%=pet_item.getItem_no()%>.png"
								alt="pet_item <%=pet_item.getItem_no() %>">
							<p><%=pet_item.getItem_name() %></p>
							<br> <span class="price"><%=pet_item.getItem_price()%></span><br>
		
							<button onclick="openPurchaseWindow()">구매하기</button>
						</div>
				<% 
		        }
		        %>
			</div>
		</div>
	</div>


	<script src="buy_item.js"></script>


	<script src="cashShop.js"></script>

	<%
	if (session.getAttribute("loginEmail") == null) {
	%>
	<script>
		function openPurchaseWindow() {
			alert("로그인을 한 후에 구매할 수 있습니다.");
		}
	</script>
	<%
	}
	%>
</body>
</html>