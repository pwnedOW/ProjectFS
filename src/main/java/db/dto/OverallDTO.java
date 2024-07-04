package db.dto;

import java.sql.Timestamp;

public class OverallDTO {

	int user_no; // 유저 고유번호, PK
	String email; // 로그인 이메일
	String password; // 로그인 비밀번호
	String name; // 본명
	String birth; // 생년월일
	String tel; // 전화번호
	int money; // 재화 = 골드로 설정
	Timestamp last_login; // 최종접속시간
	int store_no; // 창고 칸 별 고유번호
	int  item_no; // 아이템 고유번호 
	int storage_item_count; // 창고 아이템 갯수
	int log_no; // 로그 넘버, PK
	int chrg_cash; // 충전 캐쉬(충전액)
	int use_cash; // 사용 캐쉬(소모액)
	int balance; // 남은 캐쉬(잔액)
	Timestamp chrg_cash_time; // 캐쉬 충전 시간
	Timestamp item_purchase_time; // 아이템 구매 시간
	int item_count; // 아이템 갯수
	String  nickname; //  닉네임
	int class_no; //  직업 고유번호
	int char_lvl; //  캐릭터 레벨
	
	public OverallDTO() {}
	
	public OverallDTO(int user_no, String email, String password, String name, String birth, String tel, int money,
			Timestamp last_login, int store_no, int item_no, int storage_item_count, int log_no, int chrg_cash,
			int use_cash, int balance, Timestamp chrg_cash_time, Timestamp item_purchase_time, int item_count,
			String nickname, int class_no, int char_lvl) {
		super();
		this.user_no = user_no;
		this.email = email;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.tel = tel;
		this.money = money;
		this.last_login = last_login;
		this.store_no = store_no;
		this.item_no = item_no;
		this.storage_item_count = storage_item_count;
		this.log_no = log_no;
		this.chrg_cash = chrg_cash;
		this.use_cash = use_cash;
		this.balance = balance;
		this.chrg_cash_time = chrg_cash_time;
		this.item_purchase_time = item_purchase_time;
		this.item_count = item_count;
		this.nickname = nickname;
		this.class_no = class_no;
		this.char_lvl = char_lvl;
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
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public Timestamp getLast_login() {
		return last_login;
	}
	public void setLast_login(Timestamp last_login) {
		this.last_login = last_login;
	}
	public int getStore_no() {
		return store_no;
	}
	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public int getStorage_item_count() {
		return storage_item_count;
	}
	public void setStorage_item_count(int storage_item_count) {
		this.storage_item_count = storage_item_count;
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
	public Timestamp getChrg_cash_time() {
		return chrg_cash_time;
	}
	public void setChrg_cash_time(Timestamp chrg_cash_time) {
		this.chrg_cash_time = chrg_cash_time;
	}
	public Timestamp getItem_purchase_time() {
		return item_purchase_time;
	}
	public void setItem_purchase_time(Timestamp item_purchase_time) {
		this.item_purchase_time = item_purchase_time;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getClass_no() {
		return class_no;
	}
	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	public int getChar_lvl() {
		return char_lvl;
	}
	public void setChar_lvl(int char_lvl) {
		this.char_lvl = char_lvl;
	}
}
