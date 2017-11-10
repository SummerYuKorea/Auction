package edu.spring.vo;

public class ProductImageVO {
	private int image_key;
	private String image_name;
	
	public ProductImageVO(){}

	public ProductImageVO(int image_key, String image_name) {
		super();
		this.image_key = image_key;
		this.image_name = image_name;
	}

	public int getImage_key() {
		return image_key;
	}

	public void setImage_key(int image_key) {
		this.image_key = image_key;
	}

	public String getImage_name() {
		return image_name;
	}

	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	
	

}
