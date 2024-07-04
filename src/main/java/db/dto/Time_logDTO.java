package db.dto;

import java.sql.Timestamp;

public class Time_logDTO {
	int user_no;
	Timestamp last_login;
	
	public Time_logDTO(int user_no, Timestamp last_login) {
		super();
		this.user_no = user_no;
		this.last_login = last_login;
	}
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public Timestamp getLast_login() {
		return last_login;
	}
	public void setLast_login(Timestamp last_login) {
		this.last_login = last_login;
	}
	
	
}
