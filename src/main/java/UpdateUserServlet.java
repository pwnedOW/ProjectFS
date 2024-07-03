import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set content type
        response.setContentType("text/html;charset=UTF-8");
        
        // Get parameters from the form
        String user_no = request.getParameter("user_no");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String birth = request.getParameter("birth");
        String tel = request.getParameter("tel");
        String money = request.getParameter("money");
        String last_login = request.getParameter("last_login");
        
        // Database connection variables
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // Database connection setup
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String ORCL = "jdbc:oracle:thin:@localhost:1521:orcl";
            String dbUser = "scott";
            String dbPass = "tiger";
            conn = DriverManager.getConnection(ORCL, dbUser, dbPass);
            
            // SQL query to update user information
            String sql = "UPDATE users SET email=?, password=?, name=?, birth=?, tel=?, money=?, last_login=? WHERE user_no=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            pstmt.setString(3, name);
            pstmt.setString(4, birth);
            pstmt.setString(5, tel);
            pstmt.setInt(6, Integer.parseInt(money));
            pstmt.setTimestamp(7, Timestamp.valueOf(last_login));
            pstmt.setInt(8, Integer.parseInt(user_no));
            
            // Execute update
            int rowsAffected = pstmt.executeUpdate();
            
            // Check if update was successful
            if (rowsAffected > 0) {
                // Display success message or redirect to a success page
                response.sendRedirect(request.getContextPath() + "/success.jsp");
            } else {
                // Display error message or redirect to an error page
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } catch (Exception e) {
            // Handle exceptions
            e.printStackTrace();
            // Redirect to an error page
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        } finally {
            // Close resources
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
    }
}
