package edu.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.persistence.ImageDAO;
import edu.spring.vo.ProductImageVO;
import edu.spring.vo.UserImageVO;

@Service
public class ImageServiceImple implements ImageService {

	@Autowired
	private ImageDAO dao;
	
	@Override
	public int insertProductImage(ProductImageVO vo) {
		return dao.insertProductImage(vo);
	}

	@Override
	public List<String> selectProductImage(int product_code) {
		return dao.selectProductImage(product_code);
	}

	@Override
	public int insertUserImage(UserImageVO vo) {
		return dao.insertUserImage(vo);
	}

	@Override
	public List<String> selectUserImage(String user_id) {
		return dao.selectUserImage(user_id);
	}

}
