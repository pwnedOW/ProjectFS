<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이템 구매하기</title>
<link rel="stylesheet" href="./css/style.css">
<script>
	function closeWindow() {
		window.close();
	}
</script>
</head>
<body>
	<div class="buy_item_container">
		<div class="buy_item_infor">
			<div class="item_infor">
				<img src="<%=request.getParameter("itemImage")%>" alt="item image">
				<p><%=request.getParameter("itemInfo")%></p>
				<p><%=request.getParameter("itemPrice")%></p>
			</div>
			<form action="payment.jsp" method="post">
				<!-- Payment form fields here -->
				<input type="checkbox">위 상품의 구매에 동의하시면 체크박스를 클릭해주세요.<br>
				<button type="submit">구매하기</button>
				<button type="button" onclick="closeWindow()">닫기</button>
			</form>
			<div class="precautions">
				<h3>결제 시 유의사항</h3>
				<p>- 구매 상품은 구매한 날로부터 7일 이내에 청약철회할 수 있습니다.</p>
				<p>다만, 상품함에서 수령했거나 사용한 것으로 볼 수 있는 경우에는 청약철회가 제한됩니다.</p>
				<p>- 구매하신 상품은 게임 실행 후, 우측 하단의 상품함을 통해 수령할 수 있습니다.</p>
				<p>- 게임 이용이 제한된 계정 및 캐릭터는 상품 구매가 불가능합니다.</p>
				<p>- 상품 관련하여 문의하실 사항이 있다면 고객센터 > 문의하기를 이용해 주세요.</p>
			</div>
		</div>
	</div>
</body>
</html>
