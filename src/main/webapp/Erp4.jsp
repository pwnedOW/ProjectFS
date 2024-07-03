<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<header class="header">
		<div class="header-container">
			<h1 class="header-title">ERP 시스템</h1>
			<button class="header-close-btn">x</button>
		</div>
	</header>
	<main class="main">
		<h2 class="main-title">사용자 관리</h2>
		<div class="user-controls">
			<form action="<%=request.getContextPath()%>Erp4.jsp" method="post">
				<select name="sk">
					<option value="item_no">아이템(고유번호)</option>
					<option value="item_name">아이템 이름</option>
					<option value="item_price">아이템 가격</option>
					<option value="item_sales_status">아이템 판매상태</option>

					<input type="text" class="list" id="searchInput" name="sv">
					<input type="submit" value="확인" class="user-controls-button">
				</select>
			</form>

		</div>
		<div class="container">
			<div class="button-group">
				<form action="<%=request.getContextPath()%>Erp.jsp" method="post">
					<input class="button-group-button" type="submit" value=" 유저 정보 "
						action="<%=request.getContextPath()%>Erp.jsp" method="post">

				</form>
				<form action="<%=request.getContextPath()%>Erp2.jsp" method="post">
					<input class="button-group-button" type="submit" value=" 캐릭터 정보 "
						action="<%=request.getContextPath()%>Erp2.jsp" method="post">

				</form>
				<form action="<%=request.getContextPath()%>Erp3.jsp" method="post">
					<input class="button-group-button" type="submit" value="캐쉬 정보"
						action="<%=request.getContextPath()%>Erp3.jsp" method="post">

				</form>
				<form action="<%=request.getContextPath()%>Erp4.jsp" method="post">
					<input class="button-group-button" type="submit" value=" 아이템 정보 "
						action="<%=request.getContextPath()%>Erp4.jsp" method="post">

				</form>
			</div>
			<div class="table-container">
			
				<table class="user-table">
					<thead>
					
						<tr>
							<th>번호</th>
							<th>아이템 이름</th>
							<th>아이템 가격</th>
							<th>아이템 판매상태</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody id="userTableBody">
						<%
						request.setCharacterEncoding("utf-8");
						Connection conn = null;
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						//JDBC 프로그램 순서
						//01단계 :드라이버 로딩 시작
						Class.forName("oracle.jdbc.driver.OracleDriver");
						String sk = request.getParameter("sk");
						String sv = request.getParameter("sv");
						System.out.println(sk + "<-- sk Erp4.jsp");
						System.out.println(sv + "<-- sv Erp4.jsp");

						try {
							String ORCL = "jdbc:oracle:thin:@localhost:1521/orcl";
							String dbUser = "scott";
							String dbPass = "tiger";
							conn = DriverManager.getConnection(ORCL, dbUser, dbPass);
							if (sk == null & sv == null) {
								
								pstmt = conn.prepareStatement("select * from cash_item ");
							} else if (sk != null & sv.equals("")) {
								
								pstmt = conn.prepareStatement("select * from cash_item ");
							} else if (sk != null & sv != null) {
								
								if (sk.equals("item_no")) {
							pstmt = conn.prepareStatement("select *  from cash_item where item_no=?");
								} else if (sk.equals("item_name")) {
							pstmt = conn.prepareStatement("select * from cash_item where item_name=?");
								} else if (sk.equals("item_price")) {
							pstmt = conn.prepareStatement("select * from cash_item  where item_price=?");
								} else if (sk.equals("item_sales_status")) {
							pstmt = conn.prepareStatement("select * from cash_item  where item_sales_status=?");
								}
								pstmt.setString(1, sv);
							}

							
							rs = pstmt.executeQuery();
							System.out.println(rs + "<-- rs Erp.jsp");
							while (rs.next()) {
						%>

						<tr>
							<td><%=rs.getInt("item_no")%></td>
							<td><%=rs.getString("item_name")%></td>
							<td><%=rs.getString("item_price")%></td>
							<td><%=rs.getString("item_sales_status")%></td>


							<td><a
								href="<%=request.getContextPath()%>
                /mupdate/m_update_form.jsp?send_id=<%=rs.getString("item_no")%>">수정</a>
							</td>
							<td><a
								href="<%=request.getContextPath()%>
                /mdelete/m_delete_pro.jsp?send_id=<%=rs.getString("item_no")%>">삭제</a>
							</td>

						</tr>





						<%
						}

						} catch (SQLException ex) {
						out.println(ex.getMessage());
						ex.printStackTrace();

						} finally {
						// 6. 사용한 Statement 종료
						if (rs != null)
						try {
							rs.close();
						} catch (SQLException ex) {
						}
						if (pstmt != null)
						try {
							pstmt.close();
						} catch (SQLException ex) {
						}

						// 7. 커넥션 종료
						if (conn != null)
						try {
							conn.close();
						} catch (SQLException ex) {
						}
						}
						%>
						<!-- JavaScript로 데이터 삽입 -->

					</tbody>

					</div>
					</div>

					</main>

					<footer class="footer"></footer>

					
					<script src="mainpage.js"></script>

				</table>
</body>
</html>