package db.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dto.UsersDTO;
import db.util.DBConnectionManager;


public class UsersDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public UsersDTO getUsersByUser_no(int user_no) {

		UsersDTO user = null;

		try {

			conn = DBConnectionManager.connectDB();

			String query = "select * from users where user_no = ?";

			psmt = conn.prepareStatement(query);

			psmt.setInt(1, user_no);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			if (rs.next()) {

				int rsUser_no = rs.getInt("user_no");

				String rsEmail = rs.getString("email");

				String rsPassword = rs.getString("password");

				String rsName = rs.getString("name");

				//LocalDateTime rsBirth = ConvertDateUtil.convertStringToLocalDateTime(rs.getString("birth"));

				String rsBirth = rs.getString("birth");

				String rsTel = rs.getString("tel");

				user = new UsersDTO(rsUser_no, rsEmail, rsPassword,rsName,rsBirth,rsTel);

			}

		} catch (SQLException e) {

			// **TODO** Auto-generated catch block

			e.printStackTrace();

		} finally {

			DBConnectionManager.disconnectDB(conn, psmt, rs);

		}

		return user;	//객체 or null

	}

	public List<UsersDTO> getUsersList() {

		List<UsersDTO> usersList = null;

		try {

			conn = DBConnectionManager.connectDB();

			String query = " select user_no, email, password, name, TO_CHAR(birth, 'YYYY-MM-DD') birth ,tel from users";

			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~

				if(usersList == null)

					usersList = new ArrayList<UsersDTO>();

				UsersDTO user = new UsersDTO(

						rs.getInt("user_no"),

						rs.getString("email"),

						rs.getString("password"),

						rs.getString("name"),

						rs.getString("birth"),

						rs.getString("tel")

						);

				usersList.add(user);

			}

		} catch (SQLException e) {

			// **TODO** Auto-generated catch block

			e.printStackTrace();

		} finally {

			DBConnectionManager.disconnectDB(conn, psmt, rs);	//conn psmt rs

		}

		return usersList;

	}

	public boolean login(String email, String password) {
		try {
			conn = DBConnectionManager.connectDB();

			String query = "select * from users where email=? and password =?";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, email);
			psmt.setString(2, password);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			if(rs.next()) {
				return true;
			}
			return false;


		}  catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return false;
	}

	public void signUp(UsersDTO user) {
		try {
			conn = DBConnectionManager.connectDB();

			String query = "INSERT INTO users(user_no, email, password, name, birth, tel) "
					+ "VALUES(users_seq.NEXTVAL, ?, ?, ?, ?, ?)";
			
			psmt = conn.prepareStatement(query);
			psmt.setString(1, user.getEmail());
			psmt.setString(2, user.getPassword());
			psmt.setString(3, user.getName());
			psmt.setString(4, user.getBirth());
			psmt.setString(5, user.getTel());

			psmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("join SQL문 오류");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
	}
	
	public class CheckEmailServlet extends HttpServlet {
	    private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String email = request.getParameter("email");
	        boolean isDuplicate = false;

	        Connection conn = null;
	 PreparedStatement psmt = null;
	        ResultSet rs = null;

	        try {
	            conn = DBConnectionManager.connectDB();
	            String query = "SELECT COUNT(*) FROM users WHERE email = ?";
	            psmt = conn.prepareStatement(query);
	            psmt.setString(1, email);
	            rs = psmt.executeQuery();

	            if (rs.next() && rs.getInt(1) > 0) {
	                isDuplicate = true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DBConnectionManager.disconnectDB(conn, psmt, rs);
	        }

	        response.setContentType("text/plain");
	        PrintWriter out = response.getWriter();
	        out.write(isDuplicate ? "duplicate" : "ok");
	        out.close();
	    }
	}
}