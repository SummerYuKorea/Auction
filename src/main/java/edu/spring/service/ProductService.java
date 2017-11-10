package edu.spring.service;

import java.util.List;

import edu.spring.vo.BiddingVO;
import edu.spring.vo.ProductVO;

public interface ProductService {
	
	int registerProduct(ProductVO vo);
	List<ProductVO> selectListByCategory(String category);
	List<ProductVO> selectListByName(String name);
	ProductVO selectProduct(int code); 
	
	List<Integer> selectProductCode(ProductVO vo);

	////////////////////////////////////////////////////////////////////
	//bidding
	
	List<BiddingVO> selectBiddingList(int product_code);
	int insertBidding(BiddingVO vo); //여기서 4가지 쿼리문 한방에 실행하자

	///////////////////////////////////////////////////////////////////
	List<ProductVO> selectListBySeller(String seller);
	
	List<ProductVO> selectListByCart(String userid);
	List<ProductVO> selectListByBuyed(String userid);
	List<ProductVO> selectListByBidding(String userid);
}
