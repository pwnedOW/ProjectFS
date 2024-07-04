<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 업데이트</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
    <header class="header">
        <div class="header-container">
            <h1 class="header-title">사용자 정보 업데이트</h1>
            <button class="header-close-btn">x</button>
        </div>
    </header>
    <main class="main">
        <h2 class="main-title">사용자 정보 업데이트</h2>
        <div class="form-container">
            <%  // Java code begins
            
            request.setCharacterEncoding("UTF-8"); // Setting character encoding
            
            // Retrieving parameters from the request
            String item_no = request.getParameter("item_no");
            String item_name = request.getParameter("item_name");
            String item_price = request.getParameter("item_price");
            String item_sort_no = request.getParameter("item_sort_no");
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            
            try {
                // Establishing database connection
                Class.forName("oracle.jdbc.driver.OracleDriver");
                String ORCL = "jdbc:oracle:thin:@localhost:1521:orcl?useUnicode=true&characterEncoding=UTF-8";
                String dbUser = "scott";
                String dbPass = "tiger";
                conn = DriverManager.getConnection(ORCL, dbUser, dbPass);
                
                // UPDATE SQL query
                String sql = "UPDATE equipment_item SET item_no=?, item_name=?, item_price=?, item_sort_no=? WHERE item_no=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, item_no);
                pstmt.setString(2, item_name);
                pstmt.setString(3, item_price);
                pstmt.setString(4, item_sort_no);
                pstmt.setInt(5, Integer.parseInt(item_no)); // Setting WHERE condition
                
                // Executing the query
                int rowsUpdated = pstmt.executeUpdate();
                
                // Checking if update was successful
                if (rowsUpdated > 0) {
            %>
            <p>사용자 정보가 성공적으로 업데이트되었습니다.</p>
            <%
                } else {
            %>
            <p>사용자 정보 업데이트에 실패했습니다.</p>
            <%
                }
            } catch (Exception e) {
                out.println("<p>오류가 발생했습니다: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                // Closing resources in finally block
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { }
                if (conn != null) try { conn.close(); } catch (SQLException ex) { }
            }
            %>
            <a href="index.jsp">홈으로 돌아가기</a>
        </div>
    </main>
    <footer class="footer"></footer>
    <script src="mainpage.js"></script>
</body>
</html>
