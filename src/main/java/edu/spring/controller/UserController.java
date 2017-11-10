package edu.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.service.ProductService;
import edu.spring.service.ReviewService;
import edu.spring.service.UserService;
import edu.spring.vo.ProductVO;
import edu.spring.vo.ReviewVO;
import edu.spring.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService service;
	
	   @RequestMapping(value = "/cart", method = RequestMethod.GET)
	   public void cart(Model model) {
		   /* System.out.println("cart에옴");
	      //List<UserVO> list = userService.read();
	      List<ProductVO> list = new ArrayList<ProductVO>();
	      ProductVO vo1 = new ProductVO(1, "fresh", "호주산 오렌지 1kg", null, "1개", "summer", null, 0, null, 0, null, 25000, 26000, null, 0,null.0);
	      ProductVO vo2 = new ProductVO(2, "fresh", "호주산 양고기 1kg", null, "1개", "summer", null, 0, null, 0, null, 25000, 26000, null, 0,null);
	      ProductVO vo3 = new ProductVO(3, "fresh", "호주산 소고기 1kg", null, "1개", "summer", null, 0, null, 0, null, 25000, 26000, null, 0,null);
	      ProductVO vo4 = new ProductVO(4, "fresh", "호주산 파인애플 1kg", null, 1, "summer", null, 0, null, 0, null, 25000, 26000, null, 0,null);
	      list.add(vo1);
	      list.add(vo2);
	      list.add(vo3);
	      list.add(vo4);
	      model.addAttribute("productList", list);*/
	   }

	
	@RequestMapping(value = "/login", method = RequestMethod.GET )
	public void loginGET() {
		logger.info("login");
	}
	
	@RequestMapping(value = "/login-post", method = RequestMethod.POST ) //끝나면 낚아채서 main이든 어디로 보내야지
	public void loginPOST(UserVO vo, Model model) {
		logger.info(vo.getId() + ","
				+ vo.getPw());
		UserVO result = userService.loginCheck(vo);
		model.addAttribute("login_result", result);
		logger.info("result : " + result);
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest req, HttpServletResponse res) {
		logger.info("logout() 호출");
		
		HttpSession session = req.getSession();
		session.removeAttribute("login_id");
		session.invalidate();
		
		try {
			res.sendRedirect("/auc");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/registerUser", method = RequestMethod.GET )
	public void registerUserGET() {
		
	}
	
	@RequestMapping(value = "/registerUser", method = RequestMethod.POST )
	public String registerUserPOST(UserVO vo) {
//		int result = userService.create(vo);
		return "/user/thankyou";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET )
	public String mainGET() {
		return "/main";
	}
	
	@RequestMapping(value = "/checking-id", method = RequestMethod.POST )
	public void isExitingId(String id, UserVO vo, HttpServletResponse res) {
		
				
		if (userService.isExitingId(id)) {
			// DB에 아이디가 존재하는 경우
			try {
				res.getWriter().write("invalid");
			} catch (Exception e) {
				e.printStackTrace();
			}
			logger.info("invalid");
			
		} else {
			// DB에 아이디가 없는 경우
			try {
				res.getWriter().write("valid");
			} catch (Exception e) {
				e.printStackTrace();
			}
			logger.info("valid");

		}

	}
	

	
		
		// 구매 목록 (결제완료하고 배송중인 물건리스트 or 배송완료된 물건의 리스트)
		// 상품평을 줄수있음	
		@RequestMapping(value = "/buyList", method = RequestMethod.GET)
		public void buyList(HttpSession session, Model model) {
			System.out.println("buyList에옴");
					
			String userid=(String) session.getAttribute("login_id"); 
			List<ProductVO> list = service.selectListByBuyed(userid);
			logger.info("buy list:"+list.size());
			model.addAttribute("buyList", list);
			
		}
		
		@RequestMapping(value="/mypage", method=RequestMethod.GET)
		public static void mypageGET(){
			
		}
		
		// 입찰중인 목록
		@RequestMapping(value = "/biddingList", method = RequestMethod.GET)
		public void biddingList(HttpSession session, Model model) {
			System.out.println("userBiddingList에옴");
					
			String userid= (String) session.getAttribute("login_id"); 
			List<ProductVO> list = service.selectListByBidding(userid);
			logger.info("bidding list:"+list.size());
			model.addAttribute("userBiddingList", list);
			
		}
		
		// 내 상품보기 목록
		@RequestMapping(value = "/productList", method = RequestMethod.GET)
		public void productList(HttpSession session, Model model) {
			System.out.println("productList에옴");
					
			String userid= (String) session.getAttribute("login_id"); 
			List<ProductVO> list = service.selectListBySeller(userid);
			logger.info("productList:"+list.size());
			model.addAttribute("productList", list);
		}
		
		// 전체 회원 리스트	
		@RequestMapping(value="/list", method= RequestMethod.GET)
		public void list(Model model) {
			logger.info("list() 호출");
			List<UserVO> list = userService.read();
			model.addAttribute("userList", list);
			
		}
		
		// 회원정보 탭
		// 회원정보 탭, 회원상태 탭, 회원탈퇴 탭
		@RequestMapping(value = "/myInfo", method = RequestMethod.GET )
		public void myinfo(HttpSession session, Model model) {
//			UserVO vo=new UserVO("", "", "", "", "", "", null, null, null);
//			HttpSession session =  request.getSession();

			String userid= (String) session.getAttribute("login_id");
			logger.info("userid: " + userid);
	 
			UserVO vo = userService.read(userid);
			model.addAttribute("vo", vo);
			logger.info("myinfo");
		}
		
		// 회원정보 수정 확인
		@RequestMapping(value = "/myInfo", method = RequestMethod.POST )
		public void update(UserVO vo) {
			logger.info("updatePOST() 호출: userid = " + vo.getId());
			logger.info(vo.getPw()+","+ vo.getPhone()+","+ vo.getEmail() +","+vo.getAddress() +"");
			
			int result = userService.update(vo);
			if (result == 1) {
				logger.info("testUpdate 성공");
			} else {
				logger.info("testUpdate 실패");
			}
		}
			
		// 회원탈퇴  세션삭제-유저삭제
		@RequestMapping(value = "/auctionOut", method = RequestMethod.GET )
		public void deleteGET(HttpServletRequest req) {
			HttpSession session=req.getSession();
			String userid= (String) session.getAttribute("login_id");
			logger.info("deleteGET() 호출: userid = " + userid);
			
			session.removeAttribute("login_id");
			session.invalidate();
			int result = userService.delete(userid);
			if (result == 1) {
				logger.info("testDelete 성공");
				
			} else {
				logger.info("testDelete 실패");
			}
		}
		
		// 주문리스트 폼
		@RequestMapping(value = "/orderList", method = RequestMethod.GET )
		public void orderListGET() {
			
		}
		
		// 나의 상품평 폼
		@RequestMapping(value = "/registerReview", method = RequestMethod.GET )
		public void registerReviewGET() {
			
		}
	
	/////////////////////////////////////////////////////////////////////////////////////////
	// review
	
	@Autowired
	private ReviewService reviewService;
	
/*	@RequestMapping(value="registerReview", method=RequestMethod.GET)
	public void registerReviewGET(Model model){
		ProductVO vo=new ProductVO();
		vo.setName("아사이베리");
		vo.setSeller("summer");
		vo.setCode(5);
		vo.setContract_price(25000);
		model.addAttribute("product", vo);
		
	}
	*/
	@RequestMapping(value="registerReview", method=RequestMethod.POST)
	public void registerReviewPOST(ReviewVO vo, HttpServletRequest req){
		/*try {    //이거왜 안먹힘 질뭄★★★  //대신 web.xml에 filter설치함~
			req.setCharacterEncoding("UTF-8");
			logger.info("되었당");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		logger.info("registerReview POST");
		logger.info("grade: "+vo.getGrade());
		logger.info("detail: "+vo.getDetail());
		System.out.println("이것도>? "+req.getAttribute("detail"));
		
		logger.info(vo.getProduct_code()+"");
		logger.info(vo.getSeller()+"");
		
		//userid가 널이어선 안됨
		String userid=(String)req.getSession().getAttribute("login_id");
		vo.setBuyer(userid);
		reviewService.registerReview(vo);
		
	}

}
