package edu.spring.vo;

import java.util.Date;

public class BiddingVO {

	private int product_code;
	private String user_id;
	private Date regdate;
	private int price;
	private String max; //Y, N
	
	/////////////////////////////////////////
	
	
	public BiddingVO(int product_code, String user_id, Date regdate, int price, String max) {
		super();
		this.product_code = product_code;
		this.user_id = user_id;
		this.regdate = regdate;
		this.price = price;
		this.max = max;
	}
	
	public BiddingVO() {
		super();
	}

	/////////////////////////////////////////
	public int getProduct_code() {
		return product_code;
	}
	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMax() {
		return max;
	}
	public void setMax(String max) {
		this.max = max;
	}
	
}
