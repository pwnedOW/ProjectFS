package db.dto;

public class UsersDTO {
	int user_no; 		//유저 고유번호, PK
	String email;		//로그인 이메일
	String password; 	//로그인 비밀번호
	String name; 		//본명
	//LocalDateTime birth;//생년월일
	String birth;//생년월일
	String tel; 		//전화번호
	
	public UsersDTO() {}
	
	public UsersDTO(String email, String password, String name, String birth, String tel) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.tel = tel;
	}

	public UsersDTO(int user_no, String email, String password, String name, String birth, String tel) {
		super();
		this.user_no = user_no;
		this.email = email;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.tel = tel;
	}

	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}

}
