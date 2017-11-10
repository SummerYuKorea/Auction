package edu.spring.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.vo.ReviewVO;

@Repository
public class ReviewDAOImple implements ReviewDAO{

	private static final String NAMESPACE="edu.spring.ReviewMapper";
	private static final Logger logger=LoggerFactory.getLogger(ReviewDAOImple.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int registerReview(ReviewVO vo) {
		return sqlSession.insert(NAMESPACE+".insert", vo);
	}

	@Override
	public int updateReview(ReviewVO vo) {
		return sqlSession.update(NAMESPACE+".update", vo);
	}

	@Override
	public List<ReviewVO> selectListBySeller(String seller) {
		return sqlSession.selectList(NAMESPACE+".select_by_seller", seller);
	}
	@Override
	public List<ReviewVO> selectListByBuyer(String buyer) {
		return sqlSession.selectList(NAMESPACE+".select_by_buyer",buyer);
	}

	@Override
	public int deleteReview(int rno) {
		return sqlSession.delete(NAMESPACE+".delete",rno);
	}
	
}
