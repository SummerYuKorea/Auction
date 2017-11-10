package edu.spring.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.persistence.ImageDAO;
import edu.spring.persistence.ProductDAO;
import edu.spring.persistence.ProductDAOImple;
import edu.spring.vo.BiddingVO;
import edu.spring.vo.ProductVO;

@Service
public class ProductServiceImple implements ProductService {
	
	private static final Logger logger=LoggerFactory.getLogger(ProductServiceImple.class);

	@Autowired
	private ProductDAO dao;
	
	@Override
	public int registerProduct(ProductVO vo) {
		
		return dao.registerProduct(vo);
	}

	@Override
	public List<ProductVO> selectListByCategory(String category) {
		return dao.selectListByCategory(category);
	}

	@Override
	public List<ProductVO> selectListByName(String name) {
		return dao.selectListByName(name);
	}

	@Override
	public ProductVO selectProduct(int code) {
		return dao.selectProduct(code);
	}
	
	@Override
	public List<Integer> selectProductCode(ProductVO vo) {
		return dao.selectProductCode(vo);
	}

	
/////////////////////////////////////bidding//////////////////////////////////////////////
	
	@Override
	public List<BiddingVO> selectBiddingList(int product_code) {
		return dao.selectBiddingList(product_code);
	}

	@Override
	public int insertBidding(BiddingVO vo) {
		int result=0;
		int max= dao.selectMaxPrice(vo.getProduct_code());
		if(max< vo.getPrice()){ 	//기존 최고입찰가보다 높을 경우만 insert 진행
			dao.updateBiddingMaxN(vo.getProduct_code());
			dao.updateBiddersCnt(vo.getProduct_code(), 1);
			ProductVO pvo=new ProductVO();
			pvo.setCode(vo.getProduct_code());
			pvo.setContract_price(vo.getPrice());
			dao.updatePrice(pvo); //사실 쿼리문에 #{}변수값만 맞춰줘도 될 것 같지만 구지 이렇게 했다.
			result=dao.insertBidding(vo);
			logger.info("인서트문 result:"+result);
		}else{
			//더 높은 입찰가 입력하세요
			logger.info("더높은 입찰가 입력하세요. insert취소");
		}
	
		return result;//1이면 성공 0이면 실패(입찰 진행 x //   alert창)
	}
	
	
////////////////////////////////////////cart  ///////////////////////////////////////
@Override
public List<ProductVO> selectListByCart(String userid) {
// TODO Auto-generated method stub
return dao.selectListByCart(userid);
}
// 구매목록
@Override
public List<ProductVO> selectListByBuyed(String userid) {
// TODO Auto-generated method stub
return dao.selectListByBuyed(userid);
}
// 입찰중인 목록
@Override
public List<ProductVO> selectListByBidding(String userid) {
// TODO Auto-generated method stub
return dao.selectListByBidding(userid);
}

//내가 등록한 상품보기
@Override
public List<ProductVO> selectListBySeller(String seller) {
	return dao.selectListBySeller(seller);
}



}
