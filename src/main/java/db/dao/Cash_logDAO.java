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

			rs = psmt.executeQuery();

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
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return cash_logList;
	}

	public List<Cash_logDTO> chargeCashByUser_no( int user_no, int amount) {

		List<Cash_logDTO> cash_logList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = "INSERT INTO cash_log (user_no, log_no, chrg_cash, use_cash, balance, "
					+ "                     chrg_cash_time, item_purchase_time, item_no, item_count) "
					+ "		VALUES (?, cash_log_seq.nextval, ?, null, "
					+ "        (SELECT NVL(MAX(balance), 0) + ?"
					+ "   	FROM cash_log"
					+ "    	WHERE user_no = ?"
					+ "     AND log_no = ("
					+ "                    SELECT MAX(log_no) FROM cash_log"
					+ "                    WHERE user_no = ?)), "
					+ "        SYSDATE, null, null, null)";

			psmt = conn.prepareStatement(query);
			psmt.setInt(1, user_no);
			psmt.setInt(2, amount);
			psmt.setInt(3, amount);
			psmt.setInt(4, user_no);
			psmt.setInt(5, user_no);

			psmt.executeUpdate();


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return cash_logList;
	}
	
	public List<Cash_logDTO> buyItem(int user_no, int item_price, int item_no) {

		List<Cash_logDTO> cash_logList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = "INSERT INTO cash_log (user_no, log_no, chrg_cash, use_cash, balance, "
					+ "                    chrg_cash_time, item_purchase_time, item_no, item_count) "
					+ "		VALUES (?, cash_log_seq.nextval, null, ?, "
					+ "        (SELECT NVL(MAX(balance) - ? , 0)"
					+ "     FROM cash_log"
					+ "     WHERE user_no = ?"
					+ "     AND log_no = ("
					+ "                    SELECT MAX(log_no) FROM cash_log"
					+ "                    WHERE user_no = ?)), "
					+ "        null, SYSDATE, ?, 1)";

			psmt = conn.prepareStatement(query);
			psmt.setInt(1, user_no);
			psmt.setInt(2, item_price);
			psmt.setInt(3, item_price);
			psmt.setInt(4, user_no);
			psmt.setInt(5, user_no);
			psmt.setInt(6, item_no);

			psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}
		return cash_logList;
	}
}
