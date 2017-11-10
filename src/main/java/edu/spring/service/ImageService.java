package edu.spring.service;

import java.util.List;

import edu.spring.vo.ProductImageVO;
import edu.spring.vo.UserImageVO;

public interface ImageService {

	int insertProductImage(ProductImageVO vo);
	List<String> selectProductImage(int product_code);
	
	int insertUserImage(UserImageVO vo);
	List<String> selectUserImage(String user_id);
}
