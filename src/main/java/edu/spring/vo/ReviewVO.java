package edu.spring.vo;

import java.util.Date;

//"RNO" VARCHAR2(20 BYTE), 
//"SELLER" VARCHAR2(20 BYTE), 
//	"BUYER" VARCHAR2(20 BYTE), 
//	"PRODUCT_CODE" NUMBER, 
//	"GRADE" NUMBER DEFAULT 10, 
//	"DETAIL" VARCHAR2(150 BYTE), 
//	
//	"REGDATE" TIMESTAMP (6)

public class ReviewVO {
	
	private int rno;
	private String seller;
	private String buyer;
	private int product_code;
	private int grade;
	private String detail;
	private Date regdate; //리뷰 작성/수정 시간

	
	
	
	
	public ReviewVO() {
	
	}

	public ReviewVO(int rno, String seller, String buyer, int product_code, int grade, String detail, Date regdate) {
		super();
		this.rno = rno;
		this.seller = seller;
		this.buyer = buyer;
		this.product_code = product_code;
		this.grade = grade;
		this.detail = detail;
		this.regdate = regdate;
	}






	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public int getProduct_code() {
		return product_code;
	}
	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	

}
