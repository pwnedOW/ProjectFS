package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public UsersDTO getUsersByEmail(String email) {

		UsersDTO user = null;

		try {

			conn = DBConnectionManager.connectDB();

			String query = "select * from users where email = ?";

			psmt = conn.prepareStatement(query);
			psmt.setString(1, email);
			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			if (rs.next()) {

				int rsUser_no = rs.getInt("user_no");
				String rsEmail = rs.getString("email");
				String rsPassword = rs.getString("password");
				String rsName = rs.getString("name");
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

	public int signUp(String email, String password, String name, String birth, String tel) {
		
		int result = 0;
		
		try {
			conn = DBConnectionManager.connectDB();

			String query = "INSERT INTO users(user_no, email, password, name, birth, tel) "
					+ "VALUES((SELECT MAX(user_no)+1 FROM users), ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, email);
			psmt.setString(2, password);
			psmt.setString(3, name);
			psmt.setString(4, birth);
			psmt.setString(5, tel);

			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return result;
	}
	
	public int modifyEmail(String email, String email2) {

		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " UPDATE users " +
							" SET email = ? " +
							" WHERE email = ? ";
			
			psmt = conn.prepareStatement(query);
			
			psmt.setString(1, email);	//수정 후 이메일
			psmt.setString(2, email2);	//기존 이메일

			int result = psmt.executeUpdate();
			return result;

		}  catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		
		return 0;
	}
	
	public int modifyPassword(String modifyingPassword, String loginEmail, String loginPassword) {
		
		int result = 0;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " UPDATE users " +
							" SET password = ? " +
							" WHERE email = ? AND password = ? ";
			
			psmt = conn.prepareStatement(query);
			
			psmt.setString(1, modifyingPassword);	//수정할 비밀번호
			psmt.setString(2, loginEmail);		//로그인 정보에 저장된 이메일
			psmt.setString(3, loginPassword);	//로그인 정보에 저장된 비밀번호

			result = psmt.executeUpdate();

		}  catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		
		return result;
	}
	
	public boolean checkPassword(String loginEmail, String loginPassword) {
		try {
			conn = DBConnectionManager.connectDB();

			String query = "SELECT * FROM users WHERE email = ? AND password = ?";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, loginEmail);
			psmt.setString(2, loginPassword);

			rs = psmt.executeQuery();

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
	
	public int getUser_noByEmail(String email) {
		int user_no=0;
		try {
			conn = DBConnectionManager.connectDB();

			String query = "SELECT user_no FROM users WHERE email = ?";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, email);

			rs = psmt.executeQuery();

			if(rs.next()) {
				int rsUser_no = rs.getInt("user_no");
				
				user_no = rsUser_no;
			}
		}  catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		
		return user_no;
	}
	
	public int deleteUserByUser_no(int user_no) {
		int result = 0;
		try {
			conn = DBConnectionManager.connectDB();

			String query = "DELETE FROM users WHERE user_no = ?";
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, user_no);

			rs = psmt.executeQuery();

			if(rs.next()) {
				result = 1;
			}
			result = 0;


		}  catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		
		return result;
	}
	
}