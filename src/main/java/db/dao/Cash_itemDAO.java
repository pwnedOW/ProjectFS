package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.Cash_itemDTO;
import db.util.DBConnectionManager;

public class Cash_itemDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public Cash_itemDTO getCash_itemByitem_no(int item_no) {

		Cash_itemDTO cash_item = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = "select * from cash_item where item_no = ?";

			psmt = conn.prepareStatement(query);
			psmt.setInt(1, item_no);

			rs = psmt.executeQuery(); 

			if (rs.next()) {
				int rsItem_no = rs.getInt("item_no");
				String rsItem_name = rs.getString("item_name");
				int rsItem_price = rs.getInt("item_price");
				int rsItem_sales_status = rs.getInt("item_sales_status");

				cash_item = new Cash_itemDTO(rsItem_no, rsItem_name, rsItem_price, rsItem_sales_status);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return cash_item;	
	}

	public List<Cash_itemDTO> getEquipment_itemList() {

		List<Cash_itemDTO> equipment_itemList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT * FROM equipment_item ";

			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery();

			while (rs.next()) {

				if(equipment_itemList == null)
					equipment_itemList = new ArrayList<Cash_itemDTO>();

					Cash_itemDTO cash_item = new Cash_itemDTO(
							rs.getInt("item_no"),
							rs.getString("item_name"),
							rs.getInt("item_price"),
							rs.getInt("item_sales_status")
							);

					equipment_itemList.add(cash_item);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return equipment_itemList;
	}
	
	public List<Cash_itemDTO> getConsumption_itemList() {

		List<Cash_itemDTO> consumption_itemList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT * FROM consumption_item ";

			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery();

			while (rs.next()) {

				if(consumption_itemList == null)
					consumption_itemList = new ArrayList<Cash_itemDTO>();

					Cash_itemDTO cash_item = new Cash_itemDTO(
							rs.getInt("item_no"),
							rs.getString("item_name"),
							rs.getInt("item_price"),
							rs.getInt("item_sales_status")
							);

					consumption_itemList.add(cash_item);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return consumption_itemList;
	}
	
	public List<Cash_itemDTO> getProbability_itemList() {

		List<Cash_itemDTO> probability_itemList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT * FROM probability_item ";

			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery();

			while (rs.next()) {

				if(probability_itemList == null)
					probability_itemList = new ArrayList<Cash_itemDTO>();

					Cash_itemDTO cash_item = new Cash_itemDTO(
							rs.getInt("item_no"),
							rs.getString("item_name"),
							rs.getInt("item_price"),
							rs.getInt("item_sales_status")
							);

					probability_itemList.add(cash_item);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return probability_itemList;
	}
	
	public List<Cash_itemDTO> getPet_itemList() {

		List<Cash_itemDTO> pet_itemList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT * FROM pet_item ";

			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery();

			while (rs.next()) {

				if(pet_itemList == null)
					pet_itemList = new ArrayList<Cash_itemDTO>();

					Cash_itemDTO cash_item = new Cash_itemDTO(
							rs.getInt("item_no"),
							rs.getString("item_name"),
							rs.getInt("item_price"),
							rs.getInt("item_sales_status")
							);

					pet_itemList.add(cash_item);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return pet_itemList;
	}

	public int modifyCash_item(Cash_itemDTO cash_item) {

		try {
			conn = DBConnectionManager.connectDB();

			String query = " UPDATE cash_item " +
					" SET item_name = ? " +
					" , item_price = ? " +
					" , item_sales_status = ? " +
					" WHERE item_no = ? ";

			psmt = conn.prepareStatement(query);

			psmt.setString(1, cash_item.getItem_name());
			psmt.setInt(2, cash_item.getItem_price() );
			psmt.setInt(3, cash_item.getItem_sales_status() );
			psmt.setInt(4, cash_item.getItem_no() );

			int result = psmt.executeUpdate();	

			return result;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}

		return 0;
	}

	public int saveCash_item(Cash_itemDTO cash_item) {

		int result = 0;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " INSERT INTO cash_item VALUES ( ?, ?, ? ,? )";

			psmt = conn.prepareStatement(query);

			psmt.setInt(1, cash_item.getItem_no());
			psmt.setString(2, cash_item.getItem_name() );
			psmt.setInt(3, cash_item.getItem_price() );
			psmt.setInt(4, cash_item.getItem_sales_status() );

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}

		return result;
	}
	
	public int getItem_priceByItem_no(int item_no) {

		int item_price = 0;

		try {
			conn = DBConnectionManager.connectDB();

			String query = "select item_price from cash_item where item_no = ?";

			psmt = conn.prepareStatement(query);
			psmt.setInt(1, item_no);

			rs = psmt.executeQuery(); 
			
			if (rs.next()) {
				int rsItem_price = rs.getInt("item_price");

				item_price = rsItem_price;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return item_price;	
	}
	
	public int getItem_noByItem_name(String item_name) {

		int item_no = 0;

		try {
			conn = DBConnectionManager.connectDB();

			String query = "SELECT item_no FROM equipment_item WHERE item_name = ? "
		             + "UNION "
		             + "SELECT item_no FROM consumption_item WHERE item_name = ? "
		             + "UNION "
		             + "SELECT item_no FROM probability_item WHERE item_name = ? "
		             + "UNION "
		             + "SELECT item_no FROM pet_item WHERE item_name = ?";

			psmt = conn.prepareStatement(query);
			psmt.setString(1, item_name);
			psmt.setString(2, item_name);
			psmt.setString(3, item_name);
			psmt.setString(4, item_name);

			rs = psmt.executeQuery(); 
			
			if (rs.next()) {
				int rsItem_no = rs.getInt("item_no");

				item_no = rsItem_no;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return item_no;	
	}
	
	
	
}