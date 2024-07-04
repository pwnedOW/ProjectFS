package db.dto;

public class Cash_itemDTO {
int item_no; 			//아이템 고유번호
String item_name; 		//아이템 이름
int item_price; 		//아이템 가격
int item_sort_no;  //아이템 판매상태 1활성화 2비활성화

public Cash_itemDTO() {}


public Cash_itemDTO(int item_no, String item_name, int item_price, int item_sort_no) {
	super();
	this.item_no = item_no;
	this.item_name = item_name;
	this.item_price = item_price;
	this.item_sort_no = item_sort_no;
}

public int getItem_no() {
	return item_no;
}
public void setItem_no(int item_no) {
	this.item_no = item_no;
}
public String getItem_name() {
	return item_name;
}
public void setItem_name(String item_name) {
	this.item_name = item_name;
}
public int getItem_price() {
	return item_price;
}
public void setItem_price(int item_price) {
	this.item_price = item_price;
}
public int getItem_sort_no() {
	return item_sort_no;
}
public void setItem_sort_no(int item_sort_no) {
	this.item_sort_no = item_sort_no;
}

}