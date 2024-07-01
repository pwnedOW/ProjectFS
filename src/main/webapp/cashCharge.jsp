<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐시 충전</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="cashCharge_container">
		<div class="cashCharge_container_left">
			<div>
				<h1>캐시충전</h1>
			</div>
			<form id="cashChargeForm" onsubmit="handleFormSubmit(event)">
				<div class="cashCharge_payInput">
					<select id="amountSelect" name="amount"
						onchange="selectAmount(this.value)">
						<option value="1,000">1,000</option>
						<option value="3,000">3,000</option>
						<option value="5,000">5,000</option>
						<option value="10,000">10,000</option>
						<option value="30,000">30,000</option>
						<option value="50,000" selected>50,000</option>
						<option value="100,000">100,000</option>
					</select>
				</div>
				<dl>
					<dt>보유 캐시</dt>
					<dd id="currentCash">89</dd>
					<dt>충전 후 캐시</dt>
					<dd id="afterChargeCash">50,089</dd>
				</dl>
				<button type="submit">결제하기</button>
			</form>
		</div>

		<div class="cashCharge_container_right">
			<div class="right_header">
				<h2>결제수단</h2>
			</div>
			<div class="payments_list">
				<button>휴대폰</button>
				<button>신용/체크카드</button>
				<button>토스페이</button>
				<button>간편결제</button>
				<button>상품권</button>
				<button>카카오페이</button>
				<button>기타</button>
			</div>
		</div>
	</div>
	<script src="cashCharge.js"></script>
</body>
</html>
