<%@ page import="java.sql.DriverManager, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ERP 시스템</title>
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
            <form action="<%= request.getContextPath() %>/Erp.jsp" method="post">
                <select name="sk">
                    <option value="user_no">유저(고유번호)</option>
                    <option value="email">이메일</option>
                    <option value="name">이름</option>
                    <option value="birth">생일</option>
                    <option value="tel">전화번호</option>
                    <option value="money">재화</option>
                </select>
                <input type="text" class="list" id="searchInput" name="sv">
                <input type="submit" value="확인" class="user-controls-button">
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
                            <th>이메일</th>
                            <th>비밀번호</th>
                            <th>이름</th>
                            <th>생년월일</th>
                            <th>전화번호</th>
                            <th>재화</th>
                            <th>최종접속시간</th>
                        </tr>
                    </thead>
                    <tbody id="userTableBody">
                        <%
                            request.setCharacterEncoding("UTF-8");
                            Connection conn = null;
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;

                            String sk = request.getParameter("sk");
                            String sv = request.getParameter("sv");

                            try {
                                Class.forName("oracle.jdbc.driver.OracleDriver");
                                String ORCL = "jdbc:oracle:thin:@localhost:1521:orcl";
                                String dbUser = "scott";
                                String dbPass = "tiger";
                                conn = DriverManager.getConnection(ORCL, dbUser, dbPass);

                                String query = "SELECT * FROM users A LEFT JOIN ingame_money B ON A.user_no = B.user_no JOIN time_log C ON A.user_no = C.user_no";
                                if (sk != null && sv != null && !sv.isEmpty()) {
                                    query += " WHERE " + sk + " = ?";
                                }
                                query += " ORDER BY A.user_no ASC";
                                pstmt = conn.prepareStatement(query);

                                if (sk != null && sv != null && !sv.isEmpty()) {
                                    pstmt.setString(1, sv);
                                }

                                rs = pstmt.executeQuery();

                                while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt("user_no") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("password") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getDate("birth") %></td>
                            <td><%= rs.getString("tel") %></td>
                            <td><%= rs.getInt("money") %></td>
                            <td><%= rs.getTimestamp("last_login") %></td>
                        </tr>
                        <%
                                }
                            } catch (SQLException | ClassNotFoundException ex) {
                                ex.printStackTrace();
                                out.println("데이터를 불러오는 중 오류가 발생했습니다.");
                            } finally {
                                if (rs != null) try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                                if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                                if (conn != null) try { conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    <footer class="footer"></footer>
    <script src="mainpage.js"></script>
</body>
</html>
