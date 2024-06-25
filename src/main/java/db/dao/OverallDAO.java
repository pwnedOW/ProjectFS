package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import db.util.DBConnectionManager;

public class OverallDAO {
   
    Connection conn = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;

    public String getEmailByUser_no(int user_no) {
    	
        String email = null;

        try {
            conn = DBConnectionManager.connectDB();
            
            String query = "SELECT email FROM users WHERE user_no = ?";
            
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, user_no);
            
            rs = psmt.executeQuery();

            if (rs.next()) {
            	String rsEmail = rs.getString("email");
            	
            	email = rsEmail;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBConnectionManager.disconnectDB(conn, psmt, rs);
        }

        return email;
    }


    public String getPasswordByUser_no(int user_no) {
        String password = null;

        try {
            conn = DBConnectionManager.connectDB();
            String query = "SELECT password FROM users WHERE user_no = ?";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, user_no);
            rs = psmt.executeQuery();

            if (rs.next()) {
            	String rsPassword = rs.getString("password");
            	
            	password = rsPassword;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBConnectionManager.disconnectDB(conn, psmt, rs);
        }

        return password;
    }

    public String getNameByUser_no(int user_no) {
        String name = null;

        try {
            conn = DBConnectionManager.connectDB();
            String query = "SELECT name FROM users WHERE user_no = ?";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, user_no);
            rs = psmt.executeQuery();

            if (rs.next()) {
                String rsName = rs.getString("name");
                name = rsName;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBConnectionManager.disconnectDB(conn, psmt, rs);
        }

        return name;
    }

    public String getBirthByUser_no(int user_no) {
        String birth = null;

        try {
            conn = DBConnectionManager.connectDB();
            String query = "SELECT TO_CHAR(birth, 'YYYY-MM-DD') AS birth FROM users WHERE user_no = ?";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, user_no);
            rs = psmt.executeQuery();

            if (rs.next()) {
            	String rsBirth = rs.getString("birth");
            	birth = rsBirth;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBConnectionManager.disconnectDB(conn, psmt, rs);
        }

        return birth;
    }

    public String getTelByUser_no(int user_no) {
        String tel = null;

        try {
            conn = DBConnectionManager.connectDB();
            String query = "SELECT tel FROM users WHERE user_no = ?";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, user_no);
            rs = psmt.executeQuery();

            if (rs.next()) {
                String rsTel = rs.getString("tel");
                tel = rsTel;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBConnectionManager.disconnectDB(conn, psmt, rs);
        }

        return tel;
    }

    public String getMoneyByUser_no(int user_no) {
        String money = null;

        try {
            conn = DBConnectionManager.connectDB();
            String query = "SELECT TO_CHAR(money, '999,999,999') AS money FROM ingame_money WHERE user_no = ?";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, user_no);
            rs = psmt.executeQuery();

            if (rs.next()) {
            	String rsMoney = rs.getString("money");
            	money = rsMoney;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBConnectionManager.disconnectDB(conn, psmt, rs);
        }

        return money;
    }

    public Timestamp getLast_loginByUser_no(int user_no) {
        Timestamp lastlogin = null;

        try {
            conn = DBConnectionManager.connectDB();
            String query = "SELECT last_login FROM time_log WHERE user_no = ?";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, user_no);
            rs = psmt.executeQuery();

            if (rs.next()) {
            	Timestamp rsLast_login = rs.getTimestamp("last_login");
            	lastlogin = rsLast_login;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBConnectionManager.disconnectDB(conn, psmt, rs);
        }

        return lastlogin;
    }

    public int getLog_noByUser_no(int user_no) {
        int log_no = 0;

        try {
            conn = DBConnectionManager.connectDB();
            String query = "SELECT log_no FROM cash_log WHERE user_no = ?";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, user_no);
            rs = psmt.executeQuery();

            if (rs.next()) {
                int rsLog_no = rs.getInt("log_no");
                
                log_no = rsLog_no;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBConnectionManager.disconnectDB(conn, psmt, rs);
        }

        return log_no;
    }

    public int getChrg_cashByUser_no(int user_no) {
        int chrg_cash = 0;

        try {
            conn = DBConnectionManager.connectDB();
            String query = "SELECT chrg_cash FROM cash_log WHERE user_no = ?";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, user_no);
            rs = psmt.executeQuery();

            if (rs.next()) {
            	int rsChrg_cash = rs.getInt("chrg_cash");
            	chrg_cash = rsChrg_cash;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBConnectionManager.disconnectDB(conn, psmt, rs);
        }

        return chrg_cash;
    }

    public int getUse_cashByUser_no(int user_no) {
        int use_cash = 0;

        try {
            conn = DBConnectionManager.connectDB();
            String query = "SELECT use_cash FROM cash_log WHERE user_no = ?";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, user_no);
            rs = psmt.executeQuery();

            if (rs.next()) {
            	int rsUse_cash = rs.getInt("use_cash");
                use_cash = rsUse_cash;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBConnectionManager.disconnectDB(conn, psmt, rs);
        }

        return use_cash;
    }

    public int getBalanceByUser_no(int user_no) {
        int balance = 0;

        try {
            conn = DBConnectionManager.connectDB();
            String query = "SELECT balance FROM cash_log WHERE user_no = ?";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, user_no);
            rs = psmt.executeQuery();

            if (rs.next()) {
            	int rsBalance = rs.getInt("balance");
                balance = rsBalance;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBConnectionManager.disconnectDB(conn, psmt, rs);
        }

        return balance;
    }

    public Timestamp getChrg_cash_timeByUser_no(int user_no) {
        Timestamp chrg_cash_time = null;

        try {
            conn = DBConnectionManager.connectDB();
            String query = "SELECT chrg_cash_time FROM cash_log WHERE user_no = ?";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, user_no);
            rs = psmt.executeQuery();

            if (rs.next()) {
            	Timestamp rsChrg_cash_time = rs.getTimestamp("chrg_cash_time");
                chrg_cash_time = rsChrg_cash_time;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBConnectionManager.disconnectDB(conn, psmt, rs);
        }

        return chrg_cash_time;
    }

    public Timestamp getItem_purchase_timeByUser_no(int user_no) {
        Timestamp item_purchase_time = null;

        try {
            conn = DBConnectionManager.connectDB();
            String query = "SELECT item_purchase_time FROM cash_log WHERE user_no = ?";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, user_no);
            rs = psmt.executeQuery();

            if (rs.next()) {
            	Timestamp rsItem_purchase_time = rs.getTimestamp("item_purchase_time");
                item_purchase_time = rsItem_purchase_time;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBConnectionManager.disconnectDB(conn, psmt, rs);
        }

        return item_purchase_time;
    }

    public String getNicknameByUser_no(int user_no) {
        String nickname = null;

        try {
            conn = DBConnectionManager.connectDB();
            String query = "SELECT nickname FROM character WHERE user_no = ?";
            psmt = conn.prepareStatement(query);
            psmt.setInt(1, user_no);
            rs = psmt.executeQuery();

            if (rs.next()) {
            	String rsNickname = rs.getString("nickname");
            	nickname = rsNickname;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBConnectionManager.disconnectDB(conn, psmt, rs);
        }

        return nickname;
    }

}
