package db.dto;

import java.sql.Timestamp;

public class Cash_logDTO {
	int user_no;
	int log_no;
	int chrg_cash;
	int use_cash;
	int balance;
	String chrg_cash_time;
	String item_purchase_time;
	int item_no;
	int item_count;
	
	public Cash_logDTO(int user_no, int log_no, int chrg_cash, int use_cash, int balance, String chrg_cash_time,
			String item_purchase_time, int item_no, int item_count) {
		super();
		this.user_no = user_no;
		this.log_no = log_no;
		this.chrg_cash = chrg_cash;
		this.use_cash = use_cash;
		this.balance = balance;
		this.chrg_cash_time = chrg_cash_time;
		this.item_purchase_time = item_purchase_time;
		this.item_no = item_no;
		this.item_count = item_count;
	}
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getLog_no() {
		return log_no;
	}
	public void setLog_no(int log_no) {
		this.log_no = log_no;
	}
	public int getChrg_cash() {
		return chrg_cash;
	}
	public void setChrg_cash(int chrg_cash) {
		this.chrg_cash = chrg_cash;
	}
	public int getUse_cash() {
		return use_cash;
	}
	public void setUse_cash(int use_cash) {
		this.use_cash = use_cash;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getChrg_cash_time() {
		return chrg_cash_time;
	}
	public void setChrg_cash_time(String chrg_cash_time) {
		this.chrg_cash_time = chrg_cash_time;
	}
	public String getItem_purchase_time() {
		return item_purchase_time;
	}
	public void setItem_purchase_time(String item_purchase_time) {
		this.item_purchase_time = item_purchase_time;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
}
