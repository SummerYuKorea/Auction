package edu.spring.vo;

import java.util.Date;

public class ProductVO {
	/*
CODE	NUMBER	No		1	시퀀스 사용됨
CATEGORY	VARCHAR2(20 BYTE)	No		2	카테고리
NAME	VARCHAR2(50 BYTE)	No		3	이름
CLOSED_TIME	TIMESTAMP(6)	No		4	경매 마감 시간 (고정)
QUANTITY	NUMBER	No	1 	5	입찰 수량 (변경)  //->VARCHAR2(20 BYTE)로 바뀜~
SELLER	VARCHAR2(20 BYTE)	No		6	판매자
BUYER	VARCHAR2(20 BYTE)	Yes		7	구매자
IMMEDIATE_PRICE	NUMBER	No	0 	8	즉구가 (고정)
DETAIL	VARCHAR2(1500 BYTE)	Yes		9	상품상세 (고정 or 변경) 
BIDDERS	NUMBER	No	0 	10	입찰자 수 (변경)
UPDATE_TIME	TIMESTAMP(6)	No	sysdate 	11	입찰 or 낙찰 시간 (변경)
START_PRICE	NUMBER	No	0 	12	시작가 (고정)
CONTRACT_PRICE	NUMBER	No	0 	13	낙찰가 (변경)
IMG	VARCHAR2(200 BYTE)	Yes		14	상품 이미지 (고정 or 변경) 
TOTAL_QUANTITY	NUMBER	No	1 	15	총 상품 수량 (고정)
PROCESS	VARCHAR2(15 BYTE)	No	'bidding' 	16	bidding입찰중/contract낙찰된(경매완료)/배송중(지불완료)/delivered배송완료

	 * */
	
	private int code; //pk
	private String category;
	private String name;
//	private int price;
	private Date closed_time;
	private String quantity;
	public Date getUpdate_time() {
		return update_time;
	}

	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}

	private String seller; //id
	private String buyer;//id
	private int immediate_price; 
	private String detail;
	private int bidders;
	
	private Date update_time;
	private int start_price;
	private int contract_price;
	private String img;
	private int total_quantity; // 안씀
	
	private String process;
	private int delivery;
	////////////////////////////////////////////////

	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public ProductVO(int code, String category, String name, Date closed_time, String quantity, String seller,
			String buyer, int immediate_price, String detail, int bidders, Date update_time, int start_price,
			int contract_price, String img, int total_quantity, String process, int delivery) {
		super();
		this.code = code;
		this.category = category;
		this.name = name;
		this.closed_time = closed_time;
		this.quantity = quantity;
		this.seller = seller;
		this.buyer = buyer;
		this.immediate_price = immediate_price;
		this.detail = detail;
		this.bidders = bidders;
		this.update_time = update_time;
		this.start_price = start_price;
		this.contract_price = contract_price;
		this.img = img;
		this.total_quantity = total_quantity;
		this.process=process;
		this.delivery=delivery;
	}
	public ProductVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	//////////////////////////////////////////////
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
//	public int getPrice() {
//		return price;
//	}
//	public void setPrice(int price) {
//		this.price = price;
//	}
	public Date getClosed_time() {
		return closed_time;
	}
	public void setClosed_time(Date closed_time) {
		this.closed_time = closed_time;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
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
	public int getImmediate_price() {
		return immediate_price;
	}
	public void setImmediate_price(int immediate_price) {
		this.immediate_price = immediate_price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getBidders() {
		return bidders;
	}
	public void setBidders(int bidders) {
		this.bidders = bidders;
	}
	
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	public int getStart_price() {
		return start_price;
	}
	public void setStart_price(int start_price) {
		this.start_price = start_price;
	}
	public int getContract_price() {
		return contract_price;
	}
	public void setContract_price(int contract_price) {
		this.contract_price = contract_price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getTotal_quantity() {
		return total_quantity;
	}
	public void setTotal_quantity(int total_quantity) {
		this.total_quantity = total_quantity;
	}
	
	

}
