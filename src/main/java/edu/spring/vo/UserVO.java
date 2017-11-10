package edu.spring.vo;

public class UserVO {

	 private String id;
	   private String pw;
	   private String name;
	   private String phone;
	   private String email;
	   private String address;
	   private String denial; // 구매거부(1회,2회,3회)
	   private String grade; // 만족도 => 한사람이 최대5점  => 총인원 x 점수 / 5 => %로 환산
	   private String status; // 유저상태 (정상 = Y,정지 = N)
	   
	   //////////////////////////////////////////////////////////////
	   public UserVO() {}

	   public UserVO(String id, String pw, String name, String phone, String email, String address, String denial,
	         String grade, String status) {
	      super();
	      this.id = id;
	      this.pw = pw;
	      this.name = name;
	      this.phone = phone;
	      this.email = email;
	      this.address = address;
	      this.denial = denial;
	      this.grade = grade;
	      this.status = status;
	   }
	   
	   //////////////////////////////////////////////////////////////

	   public String getId() {
	      return id;
	   }

	   public void setId(String id) {
	      this.id = id;
	   }

	   public String getPw() {
	      return pw;
	   }

	   public void setPw(String pw) {
	      this.pw = pw;
	   }

	   public String getName() {
	      return name;
	   }

	   public void setName(String name) {
	      this.name = name;
	   }

	   public String getPhone() {
	      return phone;
	   }

	   public void setPhone(String phone) {
	      this.phone = phone;
	   }

	   public String getEmail() {
	      return email;
	   }

	   public void setEmail(String email) {
	      this.email = email;
	   }

	   public String getAddress() {
	      return address;
	   }

	   public void setAddress(String address) {
	      this.address = address;
	   }

	   public String getDenial() {
	      return denial;
	   }

	   public void setDenial(String denial) {
	      this.denial = denial;
	   }

	   public String getGrade() {
	      return grade;
	   }

	   public void setGrade(String grade) {
	      this.grade = grade;
	   }

	   public String getStatus() {
	      return status;
	   }

	   public void setStatus(String status) {
	      this.status = status;
	   }

}
