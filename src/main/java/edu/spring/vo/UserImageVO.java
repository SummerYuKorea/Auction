package edu.spring.vo;

public class UserImageVO {
	
	private String user_id;
	private String image_name;
	
	public UserImageVO(){}
	public UserImageVO(String user_id, String image_name) {
		super();
		this.user_id = user_id;
		this.image_name = image_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	
	

}
