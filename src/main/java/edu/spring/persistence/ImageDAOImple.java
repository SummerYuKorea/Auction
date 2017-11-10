package edu.spring.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.vo.ProductImageVO;
import edu.spring.vo.UserImageVO;

@Repository
public class ImageDAOImple implements ImageDAO {

	private static final String NAMESPACE="edu.spring.ImageMapper";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertProductImage(ProductImageVO vo) {
		return sqlSession.insert(NAMESPACE+".insert_product_image",vo);
	}

	@Override
	public List<String> selectProductImage(int product_code) {
		return sqlSession.selectList(NAMESPACE+".select_product_image", product_code+"%");
	}

	@Override
	public int insertUserImage(UserImageVO vo) {
		return sqlSession.insert(NAMESPACE+".insert_user_image", vo);
	}

	@Override
	public List<String> selectUserImage(String user_id) {
		return sqlSession.selectOne(NAMESPACE+".select_user_image", user_id);
	}

}
