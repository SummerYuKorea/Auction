package edu.spring.persistence;

import java.util.List;

import edu.spring.vo.ProductImageVO;
import edu.spring.vo.UserImageVO;

public interface ImageDAO {

	int insertProductImage(ProductImageVO vo);
	List<String> selectProductImage(int product_code);
	
	int insertUserImage(UserImageVO vo);
	List<String> selectUserImage(String user_id);
}
