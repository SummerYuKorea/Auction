package edu.spring.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.vo.BiddingVO;
import edu.spring.vo.ProductVO;

@Repository
public class ProductDAOImple implements ProductDAO {

	private static final String NAMESPACE="edu.spring.ProductMapper";
	private static final Logger logger=LoggerFactory.getLogger(ProductDAOImple.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int registerProduct(ProductVO vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
	
	@Override
	public List<Integer> selectProductCode(ProductVO vo) {
		return sqlSession.selectList(NAMESPACE+".select_product_code",vo);
	}

	



	// 검색///////////////////////////////////////////////////////////////////////
	@Override
	public List<ProductVO> selectListByCategory(String category) {
	
		return sqlSession.selectList(NAMESPACE+".select_by_category",category);
	}
	
	@Override
	public List<ProductVO> selectListByName(String name) {
		return sqlSession.selectList(NAMESPACE+".select_by_name", "%"+name+"%");
	}
	
	@Override
	public List<ProductVO> selectListByNameNCategory(ProductVO vo) {
		vo.setName("%"+vo.getName()+"%");
		return sqlSession.selectList(NAMESPACE+".select_by_name_and_category",vo);
	}
	
	@Override
	public List<ProductVO> selectListBySeller(String seller) {
		return sqlSession.selectList(NAMESPACE+".select_by_seller", seller);
	}
	
	
	
	////////////////////////////////////////////////////////////////////////////

	@Override
	public ProductVO selectProduct(int code) {
		return sqlSession.selectOne(NAMESPACE+".select_by_code", code);
	}




/////////////////////////////////////bidding//////////////////////////////////////////////
	@Override
	public List<BiddingVO> selectBiddingList(int product_code) {
		return sqlSession.selectList(NAMESPACE+".select_biddinglist", product_code);
	}
	
	
	//여기부터 4개가 insertBidding에 쓰일것.
	@Override
	public int updateBiddingMaxN(int product_code){
		// 모든 biddingList의 Max 'N'로 전환
		return sqlSession.update(NAMESPACE+".update_bidding_max", product_code); 
	}


	@Override
	public int insertBidding(BiddingVO vo) {
//		logger.info("product_code:"+vo.getProduct_code());
//		logger.info("user_id:"+vo.getUser_id());
//		logger.info("price:"+vo.getPrice());
		
		// bidding테이블에 insert
		int result= sqlSession.insert(NAMESPACE+".insert_bidding",vo);
		return result;
	}
	
	
	@Override
	public int updateBiddersCnt(int product_code, int amount) {
		// product테이블에 bidders 1증가
		Map<String, Integer> map= new HashMap<>();
		map.put("code", product_code);
		map.put("amount", amount); // 추가시 1, 입찰 취소 시 -1이 넘어올 것.
		return sqlSession.update(NAMESPACE+".update_bidders_cnt", map);
	}
	
	@Override
	public int updatePrice(ProductVO vo) {
		return sqlSession.update(NAMESPACE+".update_price", vo);
	}





	@Override
	public Integer selectMaxPrice(int product_code) {  //Integer 아니라 int로 하면 Integer null이 넘어올시 int로 자동 형변환이 안됨
		int max= sqlSession.selectOne(NAMESPACE+".select_contract_price", product_code);
		if(max==0) max= sqlSession.selectOne(NAMESPACE+".select_start_price", product_code);
		logger.info("max:"+max);
		return max;
	}
	
	///////////////////////////////////////////////////////////////////////////
	
////카트  /////////////////////////////////////////////////////////////////
	@Override
	public List<ProductVO> selectListByCart(String userid) {
		 
		return sqlSession.selectList(NAMESPACE+".select_by_cart", userid);
	}
	
	// 구매목록
	@Override
	public List<ProductVO> selectListByBuyed(String userid) {
		
		return sqlSession.selectList(NAMESPACE+".select_by_buyed", userid);
	}
	// 입찰중인 목록
	@Override
	public List<ProductVO> selectListByBidding(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".select_by_bidding", userid);
	}
	
	
	

		
	
	

}
