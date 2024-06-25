package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import db.dto.Time_logDTO;
import db.util.DBConnectionManager;

public class Time_logDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public Time_logDTO getTime_logByUser_no( int user_no ) {

		Time_logDTO time_log = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = "select * from time_log where user_no = ?";

			psmt = conn.prepareStatement(query);
			psmt.setInt(1, user_no);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			if (rs.next()) { 
				int rsUser_no = rs.getInt("user_no");		
				Timestamp rsLast_login = rs.getTimestamp("last_login");	

				time_log = new Time_logDTO(rsUser_no, rsLast_login);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return time_log;	//객체 or null
	}

	public List<Time_logDTO> getTime_logList() {

		List<Time_logDTO> time_logList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = "SELECT DISTINCT(u.name)"
						 + " FROM users u, storage s"
						 + " WHERE u.user_no = s.user_no";
			//"select * from time_log" users ingame_money;

			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행



			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~

				if(time_logList == null)
					time_logList = new ArrayList<Time_logDTO>();
					
					Time_logDTO time_log = new Time_logDTO(
							rs.getInt("user_no"),
							rs.getTimestamp("last_login")
							);

					time_logList.add(time_log);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);	//conn psmt rs
		}

		return time_logList;

	}

}
