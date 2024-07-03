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
            <%
            
            request.setCharacterEncoding("UTF-8"); // 한글 처리 추가
            
            String user_no = request.getParameter("user_no");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String birth = request.getParameter("birth");
            String tel = request.getParameter("tel");
            String money = request.getParameter("money");
            String last_login = request.getParameter("last_login");
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                String ORCL = "jdbc:oracle:thin:@localhost:1521:orcl?useUnicode=true&characterEncoding=UTF-8";
                String dbUser = "scott";
                String dbPass = "tiger";
                conn = DriverManager.getConnection(ORCL, dbUser, dbPass);
                
                // UPDATE 쿼리 작성
                String sql = "UPDATE users SET email=?, password=?, name=?, birth=?, tel=? WHERE user_no=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, email);
                pstmt.setString(2, password);
                pstmt.setString(3, name);
                pstmt.setDate(4, java.sql.Date.valueOf(birth)); // birth는 String 형식으로 입력되므로 Date로 변환
                pstmt.setString(5, tel);
                pstmt.setInt(6, Integer.parseInt(user_no));
                
                // 쿼리 실행
                int rowsUpdated = pstmt.executeUpdate();
                
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
