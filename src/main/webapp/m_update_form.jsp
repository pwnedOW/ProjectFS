<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 수정</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
    <header class="header">
        <div class="header-container">
            <h1 class="header-title">사용자 정보 수정</h1>
            <button class="header-close-btn">x</button>
        </div>
    </header>
    <main class="main">
        <h2 class="main-title">사용자 정보 수정</h2>
        <div class="form-container">
            <%
            String item_no = request.getParameter("send_id");
            out.println("고유번호: " + item_no);
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                String ORCL = "jdbc:oracle:thin:@localhost:1521/orcl";
                String dbUser = "scott";
                String dbPass = "tiger";
                conn = DriverManager.getConnection(ORCL, dbUser, dbPass);
                
                // SELECT 쿼리 작성
                String sql = "select * from equipment_item where item_no = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(item_no));
                rs = pstmt.executeQuery();
                
                if (rs.next()) {
            %>
            <form action="updateUserInfo.jsp" method="post"> <!-- 수정 폼 추가 -->
                <input type="hidden" name="item_no" value="<%=rs.getInt("item_no")%>">
                <label for="item_name">아이템이름:</label>
                <input type="text" name="item_name" value="<%=rs.getString("item_name")%>"><br>
                <label for="item_price">아이템가격:</label>
                <input type="text" name="item_price" value="<%=rs.getString("item_price")%>"><br>
                <label for="item_sales_status">아이템분류번호:</label>
                <input type="text" name="item_sort_no" value="<%=rs.getString("item_sort_no")%>"><br>          
                <input type="submit" value="저장">
            </form>
            <%
                } else {
                    out.println("해당 사용자의 정보를 찾을 수 없습니다.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ex) { }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { }
                if (conn != null) try { conn.close(); } catch (SQLException ex) { }
            }
            %>
        </div>
    </main>
    <footer class="footer"></footer>
    <script src="mainpage.js"></script>
</body>
</html>
