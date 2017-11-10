package edu.spring.persistence;

import java.util.List;

import edu.spring.vo.BiddingVO;
import edu.spring.vo.ProductVO;

public interface ProductDAO {
	int registerProduct(ProductVO vo);
	List<ProductVO> selectListByCategory(String category);
	List<ProductVO> selectListByName(String name);
	List<ProductVO> selectListByNameNCategory(ProductVO vo);
	ProductVO selectProduct(int code); 
	
	List<Integer> selectProductCode(ProductVO vo);
	
	////////////////////////////////////////////////////////////////////
	//bidding
	
	List<BiddingVO> selectBiddingList(int product_code);
	
	int updateBiddingMaxN(int product_code);
	int insertBidding(BiddingVO vo); //여기서 4가지 쿼리문 한방에 실행하자 (서비스에서 trasmission으로묶기)
	int updateBiddersCnt(int product_code, int amount);
	int updatePrice(ProductVO vo);
	
	Integer selectMaxPrice(int product_code);
	
	//////////////////////////////////////////////////////////////////////
	
	List<ProductVO> selectListBySeller(String seller);
	
	List<ProductVO> selectListByCart(String userid);
	List<ProductVO> selectListByBuyed(String userid);
	List<ProductVO> selectListByBidding(String userid);
}
