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
	<div class="cash_contents">
		<div class="cash_nav">

			<div class="cash_nav_left">
				<p><a href="index.jsp">Flame Soul</a></p>
				<p><a href="index.jsp">Online</a></p>
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
			if (session.getAttribute("loginId") == null) {
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
			//Object 객체 타입 -> String 
			String loginId = session.getAttribute("loginId").toString();
			%>
			<div class="user_cash_infor">

				<div class="cash_infor_left">
					<p><%=loginId%></p>
					<p>보유 캐시 : 100,000</p>
				</div>

				<div class="cash_infor_left">
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
			<button class="tablink" onclick="openTab(event, 'equipment_item')">장비 아이템</button>
			<button class="tablink" onclick="openTab(event, 'consumption_item')">소비 아이템</button>
			<button class="tablink" onclick="openTab(event, 'pobability_item')">확률형 아이템</button>
			<button class="tablink" onclick="openTab(event, 'pet_item')">펫 아이템</button>
		</div>

	<div id="equipment_item" class="tabcontent">
        <div class="cash_container">
            
            <div class="item">
                <img src="img/5.png" alt="equipment_item 1">
                <p>파수꾼의 헬름</p><br>
                <span class="price">4,900</span><br>
				<button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item_action() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
            
            <div class="item">
                <img src="img/6.png" alt="equipment_item 2">
                <p>파수꾼의 흉갑</p><br>
                <span class="price">5,900</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
            
            <div class="item">
                <img src="img/7.png" alt="equipment_item 3">
                <p>파수꾼의 건틀릿</p><br>
                <span class="price">3,900</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
            
            <div class="item">
                <img src="img/8.png" alt="equipment_item 4">
                <p>파수꾼의 각반</p><br>
                <span class="price">4,900</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>

            <div class="item">
                <img src="img/9.png" alt="equipment_item 5">
                <p>흑기사의 헬름</p><br>
                <span class="price">4,900</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
            
            <div class="item">
                <img src="img/10.png" alt="equipment_item 6">
                <p>흑기사의 흉갑</p><br>
                <span class="price">5,900</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
            
            <div class="item">
                <img src="img/11.png" alt="equipment_item 7">
                <p>흑기사의 건틀릿</p><br>
                <span class="price">3,900</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
            
            <div class="item">
                <img src="img/12.png" alt="equipment_item 8">
                <p>흑기사의 각반</p><br>
                <span class="price">4,900</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
            
            <div class="item">
                <img src="img/13.png" alt="equipment_item 9">
                <p>불의 마녀의 헬름</p><br>
                <span class="price">4,900</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
            
            <div class="item">
                <img src="img/14.png" alt="equipment_item 10">
                <p>불의 마녀의 흉갑</p><br>
                <span class="price">5,900</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
            
            <div class="item">
                <img src="img/15.png" alt="equipment_item 11">
                <p>불의 마녀의 건틀릿</p><br>
                <span class="price">3,900</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
            
            <div class="item">
                <img src="img/16.png" alt="equipment_item 12">
                <p>불의 마녀의 각반</p><br>
                <span class="price">4,900</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>       
            
                                         
        </div>
    </div>
    


 <div id="consumption_item" class="tabcontent" style="display:none">
        <div class="cash_container">
            <div class="item">
                <img src="img/1,2.png" alt="consumption_item 1">
                <p>채널 확성기 1개</p><br>
                <span class="price">300</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
            
            <div class="item">
                <img src="img/1,2.png" alt="consumption_item 2">
                <p>채널 확성기 11개</p><br>
                <span class="price">3,000</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
        
            <div class="item">
                <img src="img/3,4.png" alt="consumption_item 3">
                <p>서버 확성기 1개</p><br>
                <span class="price">700</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
            
            <div class="item">
                <img src="img/3,4.png" alt="consumption_item 4">
                <p>서버 확성기 11개</p><br>
                <span class="price">7,000</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
            
            <div class="item">
                <img src="img/20.png" alt="consumption_item 5">
                <p>경험치 부스트 물약</p><br>
                <span class="price">1,500</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
            
            <div class="item">
                <img src="img/21.png" alt="consumption_item 6">
                <p>드랍율 부스트 물약</p><br>
                <span class="price">1,500</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>      
        </div>
    </div>

    <div id="pobability_item" class="tabcontent" style="display:none">
        <div class="cash_container">
            <div class="item">
                <img src="img/22,23.png" alt="pobability_item 1">
                <p>영혼 조각 뽑기 상자 1개</p><br>
                <span class="price">900</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>

            <div class="item">
                <img src="img/22,23.png" alt="pobability_item 2">
                <p>영혼 조각 뽑기 상자 11개</p><br>
                <span class="price">9,000</span><br>
                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            </div>
        </div>
    </div>
    
    <div id="pet_item" class="tabcontent" style="display:none">
        <div class="cash_container">
                <div class="item">
	                <img src="img/17.png" alt="pet_item 1">
	                <p>숲의 위습 펫</p><br>
	                <span class="price">9,900</span><br>
	                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
            	</div>
            
	            <div class="item">
	                <img src="img/18.png" alt="pet_item 2">
	                <p>어둠 영혼 펫</p><br>
	                <span class="price">9,900</span><br>
	                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
	            </div>
	            
	            <div class="item">
	                <img src="img/19.png" alt="pet_item 3">
	                <p>불꽃 여우 펫</p><br>
	                <span class="price">9,900</span><br>
	                <button onclick="openPurchaseWindow()">구매하기</button>
				<script>
			        function buy_item() {
			            window.open('buy_item.jsp');
			        }
			    </script>
	            </div>     
            </div>
        </div>
    </div>





	<script src="buy_item.js"></script>


	<script src="cashShop.js"></script>

	<%
	if (session.getAttribute("loginId") == null) {
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