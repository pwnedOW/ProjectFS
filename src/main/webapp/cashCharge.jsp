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
<title>캐시 충전</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <%
    OverallDAO overallDAO = new OverallDAO();
    Cash_logDAO cash_logDAO = new Cash_logDAO();
    Cash_itemDAO cash_itemDAO = new Cash_itemDAO();
    UsersDAO usersDAO = new UsersDAO();

    String email = (String) session.getAttribute("loginEmail");
    
    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int user_no = usersDAO.getUser_noByEmail(email);
    int balance = overallDAO.getBalanceByUser_no(user_no);
    int chargeAmount = 0;

    String amountParam = request.getParameter("amount");
    if (amountParam != null) {
    	chargeAmount = Integer.parseInt(amountParam);
    }
    int afterChargeCash = balance + chargeAmount;

    System.out.println("유저번호 : " + user_no);
    System.out.println("유저잔액 : " + balance);
    System.out.println("충전금액 : " + chargeAmount);
    System.out.println("충전 후 잔액 : " + afterChargeCash);
    %>
    
    <div class="cashCharge_container">
        <div class="cashCharge_container_left">
            <div>
                <h1>캐시충전</h1>
            </div>
            <form id="cashChargeForm" action="cashCharge.jsp" method="get">
                <div class="cashCharge_payInput">
                    <select id="amountSelect" name="amount"
                        onchange="this.form.submit()">
                        <option selected>금액을 선택해주세요.</option>
                        <option value="1000" <%=(chargeAmount == 1000) ? "selected" : ""%>>1,000</option>
                        <option value="3000" <%=(chargeAmount == 3000) ? "selected" : ""%>>3,000</option>
                        <option value="5000" <%=(chargeAmount == 5000) ? "selected" : ""%>>5,000</option>
                        <option value="10000" <%=(chargeAmount == 10000) ? "selected" : ""%>>10,000</option>
                        <option value="30000" <%=(chargeAmount == 30000) ? "selected" : ""%>>30,000</option>
                        <option value="50000" <%=(chargeAmount == 50000) ? "selected" : ""%>>50,000</option>
                        <option value="100000" <%=(chargeAmount == 100000) ? "selected" : ""%>>100,000</option>
                    </select>
                </div>
                <dl>
                    <dt>보유 캐시</dt>
                    <dd id="currentCash"><%=balance%></dd>
                    <dt>충전 후 캐시</dt>
                    <dd id="afterChargeCash"><%=afterChargeCash%></dd>
                </dl>
                <button type="submit" formaction="cashCharge_action.jsp">결제하기</button>
            </form>
        </div>

        <script>
            const cashChargeForm = document.querySelector('#cashChargeForm');

            cashChargeForm.addEventListener('submit', (e) => {
                const amountSelect = document.querySelector('#amountSelect');

                if (amountSelect.value == "금액을 선택해주세요.") {
                    alert('금액을 선택해주세요.');
                    amountSelect.focus();
                    e.preventDefault();
                    return false;
                } else {
                    cashChargeForm.submit();
                }
            });
        </script>

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
</body>
</html>
