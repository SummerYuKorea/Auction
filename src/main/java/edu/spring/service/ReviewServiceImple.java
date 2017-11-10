package edu.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.persistence.ReviewDAO;
import edu.spring.vo.ReviewVO;

@Service
public class ReviewServiceImple implements ReviewService {
	
	@Autowired
	private ReviewDAO dao;

	@Override
	public int registerReview(ReviewVO vo) {
		return dao.registerReview(vo);
	}

	@Override
	public int updateReview(ReviewVO vo) {
		return dao.updateReview(vo);
	}

	@Override
	public List<ReviewVO> selectListBySeller(String seller) {
		return dao.selectListBySeller(seller);
	}

	@Override
	public List<ReviewVO> selectListByBuyer(String buyer) {
		return dao.selectListByBuyer(buyer);
	}

	@Override
	public int deleteReview(int rno) {
		return dao.deleteReview(rno);
	}

}
