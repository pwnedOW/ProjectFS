<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "java.sql.SQLException"%>

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
		</div>
	</header>
	<main class="main">
		<h2 class="main-title">사용자 관리</h2>
		<div class="user-controls">
			<form action="<%=request.getContextPath()%>Erp2.jsp" method="post">
				<select name="sk">
					<option value="user_no">유저(고유번호)</option>
					<option value="nickname">닉네임</option>
					<option value="char_lvl">레벨</option>
					<option value="name">이름</option>
					<option value="birth">생일</option>
					<option value="tel">전화번호</option>
					<option value="money">재화</option>
					<input type="text" class="list" id="searchInput" name="sv">
					<input type="submit" value="확인" class="user-controls-button">
				</select>
			</form>

		</div>
		<div class="container">
			<div class="button-group">
				<form action="<%= request.getContextPath() %>/Erp.jsp" method="post">
                    <input class="button-group-button" type="submit" value="유저 정보">
                </form>
                <form action="<%= request.getContextPath() %>/Erp2.jsp" method="post">
                    <input class="button-group-button" type="submit" value="캐릭터 정보">
                </form>
                <form action="<%= request.getContextPath() %>/Erp3.jsp" method="post">
                    <input class="button-group-button" type="submit" value="캐쉬 정보">
                </form>
                <form action="<%=request.getContextPath()%>Erp4_equipment_item.jsp" method="post">
                    <input class="button-group-button" type="submit" value="장비 아이템 정보">
                </form>
                <form action="<%=request.getContextPath()%>Erp5_consumption_item.jsp" method="post">
                    <input class="button-group-button" type="submit" value="소비 아이템 정보">
                </form>
                <form action="<%=request.getContextPath()%>Erp6_probability_item.jsp" method="post">
                    <input class="button-group-button" type="submit" value="확률 아이템 정보">
                </form>
                <form action="<%=request.getContextPath()%>Erp7_pet_item.jsp" method="post">
                    <input class="button-group-button" type="submit" value="펫 아이템 정보">
                </form>
			</div>
			<div class="table-container">
				<table class="user-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>닉네임</th>
							<th>레벨</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>전화번호</th>
							<th>재화</th>
							<th>최종접속시간</th>
							<th>수정</th>
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
						System.out.println(sk + "<-- sk Erp2.jsp");
						System.out.println(sv + "<-- sv Erp2.jsp");

						try {
							String ORCL = "jdbc:oracle:thin:@localhost:1521/orcl";
							String dbUser = "scott";
							String dbPass = "tiger";
							conn = DriverManager.getConnection(ORCL, dbUser, dbPass);
							if (sk == null & sv == null) {

								pstmt = conn.prepareStatement(
								"select * from users A left join ingame_money B on A.user_no = B.user_no join time_log C on A.user_no = C.user_no join character D on A.user_no = D.user_no");
							} else if (sk != null & sv.equals("")) {

								pstmt = conn.prepareStatement(
								"select * from users A left join ingame_money B on A.user_no = B.user_no join time_log C on A.user_no = C.user_no join character D on A.user_no = D.user_no");
							} else if (sk != null & sv != null) {

								if (sk.equals("user_no")) {
							pstmt = conn.prepareStatement(
									"select *  from users A left join ingame_money B on A.user_no = B.user_no join time_log C on A.user_no = C.user_no join character D on A.user_no = D.user_no where A.user_no=?");
								} else if (sk.equals("email")) {
							pstmt = conn.prepareStatement(
									"select *  from users A left join ingame_money B on A.user_no = B.user_no join time_log C on A.user_no = C.user_no join character D on A.user_no = D.user_no where email=?");
								} else if (sk.equals("nickname")) {
							pstmt = conn.prepareStatement(
									"select *  from users A left join ingame_money B on A.user_no = B.user_no join time_log C on A.user_no = C.user_no join character D on A.user_no = D.user_no  where password=?");
								} else if (sk.equals("char_lvl")) {
							pstmt = conn.prepareStatement(
									"select *  from users A left join ingame_money B on A.user_no = B.user_no join time_log C on A.user_no = C.user_no join character D on A.user_no = D.user_no  where name=?");
								} else if (sk.equals("birth")) {
							pstmt = conn.prepareStatement(
									"select *  from users A left join ingame_money B on A.user_no = B.user_no join time_log C on A.user_no = C.user_no join character D on A.user_no = D.user_no  where birth=?");
								} else if (sk.equals("tel")) {
							pstmt = conn.prepareStatement(
									"select *  from users A left join ingame_money B on A.user_no = B.user_no join time_log C on A.user_no = C.user_no join character D on A.user_no = D.user_no  where tel=?");
								} else if (sk.equals("money")) {
							pstmt = conn.prepareStatement(
									"select *  from users A left join ingame_money B on A.user_no = B.user_no join time_log C on A.user_no = C.user_no join character D on A.user_no = D.user_no  where money=?");
								}
								pstmt.setString(1, sv);
							}

							
							rs = pstmt.executeQuery();
							System.out.println(rs + "<-- rs Erp2.jsp");
							while (rs.next()) {
						%>

						<tr>
							<td><%=rs.getInt("user_no")%></td>
							<td><%=rs.getString("nickname")%></td>
							<td><%=rs.getString("char_lvl")%></td>
							<td><%=rs.getString("name")%></td>
							<td><%=rs.getDate("birth")%></td>
							<td><%=rs.getInt("tel")%></td>
							<td><%=rs.getInt("money")%></td>
							<td><%=rs.getTimestamp("last_login")%></td>
							<td><a
								href="">상태변경</a>
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