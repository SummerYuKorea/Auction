package edu.spring.service;

import java.util.List;

import edu.spring.vo.ReviewVO;

public interface ReviewService {
	
	
	int registerReview(ReviewVO vo);
	int updateReview(ReviewVO vo);
	List<ReviewVO> selectListBySeller(String seller);
	List<ReviewVO> selectListByBuyer(String buyer);
	int deleteReview(int rno);

}
