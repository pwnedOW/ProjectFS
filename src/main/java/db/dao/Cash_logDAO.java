package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.Cash_logDTO;
import db.util.DBConnectionManager;


public class Cash_logDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public List<Cash_logDTO> getCash_logByUser_no( int user_no ) {

		List<Cash_logDTO> cash_logList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = "select user_no, log_no, chrg_cash, use_cash, balance,"
					+ "chrg_cash_time, item_purchase_time, item_no, item_count"
					+ " from cash_log where user_no = ?";

			psmt = conn.prepareStatement(query);
			psmt.setInt(1, user_no);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) { 
				
				if(cash_logList == null)
					cash_logList = new ArrayList<Cash_logDTO>();
				
					Cash_logDTO cash_log = new Cash_logDTO(
							rs.getInt("user_no"),
							rs.getInt("log_no"),
							rs.getInt("chrg_cash"),
							rs.getInt("use_cash"),
							rs.getInt("balance"),
							rs.getString("chrg_cash_time"),
							rs.getString("item_purchase_time"),
							rs.getInt("item_no"),
							rs.getInt("item_count")
							);

					cash_logList.add(cash_log);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return cash_logList;	//객체 or null
	}
}
