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
            String user_no = request.getParameter("send_id");
            out.println("고유번호: " + user_no);
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
                String sql = "SELECT * FROM users A LEFT JOIN ingame_money B ON A.user_no = B.user_no JOIN time_log C ON A.user_no = C.user_no WHERE A.user_no = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(user_no));
                rs = pstmt.executeQuery();
                
                if (rs.next()) {
            %>
            <form action="updateUserInfo.jsp" method="post"> <!-- 수정 폼 추가 -->
                <input type="hidden" name="user_no" value="<%=rs.getInt("user_no")%>">
                <label for="email">이메일:</label>
                <input type="text" name="email" value="<%=rs.getString("email")%>"><br>
                <label for="password">비밀번호:</label>
                <input type="text" name="password" value="<%=rs.getString("password")%>"><br>
                <label for="name">이름:</label>
                <input type="text"maxlength="15" name="name" value="<%=rs.getString("name")%>"><br>
                <label for="birth">생년월일:</label>
                <input type="text" name="birth" value="<%=rs.getDate("birth")%>"><br>
                <label for="tel">전화번호:</label>
                <input type="text" name="tel" value="<%=rs.getString("tel")%>"><br>
                <label for="money">재화:</label>
                <input type="text" name="money" value="<%=rs.getInt("money")%>"><br>
                <label for="last_login">최종접속시간:</label>
                <input type="text" name="last_login" value="<%=rs.getTimestamp("last_login")%>"><br>
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
