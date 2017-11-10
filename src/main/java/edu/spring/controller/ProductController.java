package edu.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.spring.service.ImageService;
import edu.spring.service.ProductService;
import edu.spring.service.ReviewService;
import edu.spring.util.MediaUtil;
import edu.spring.vo.BiddingVO;
import edu.spring.vo.ProductImageVO;
import edu.spring.vo.ProductVO;
import edu.spring.vo.ReviewVO;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

	private static final Logger logger=LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService service;
	
	@Resource(name = "uploadPath") // 서블릿-컨텍스트에서 설정해준 id
	   private String uploadPath;
	
	@RequestMapping(value = "/registerProduct", method = RequestMethod.GET)
	public void registerProductGET(){
		logger.info("registerProductGET()");
		// product/registerProduct.jsp로 이동
	}
	
	
	@Autowired
	private ImageService imageService;
	
	@RequestMapping(value = "/registerProduct", method = RequestMethod.POST)
	public String registerProductPOST(ProductVO vo, String dead_line, HttpServletRequest req, Model model){
		logger.info("registerProductPOST()");
		//1. filter나딴거 적용해서 login으로 뺄것
		//2. 왔던 페이지 기억해놨다가 거기로 리턴할 것
		
		logger.info(vo.getCategory());
	
		logger.info(dead_line);
		//vo.setClosed_time(new Date(2017,8,11,0,0));//2017년7월11일0시0분
		int year= Integer.parseInt(dead_line.substring(0, 4));
		logger.info(year+"");
		int month= Integer.parseInt(dead_line.substring(5, 7))-1;
		int date= Integer.parseInt(dead_line.substring(8, 10));
		int hour= Integer.parseInt(dead_line.substring(11, 13));
		int min= Integer.parseInt(dead_line.substring(14, 16));
		logger.info("month->"+ month+date+hour+min);
		vo.setClosed_time(new Date(year,month,date,hour,min)); //Date타입을 그대로 못받아와서 String으로받아서 하나하나 변환.
		
		//seller
		String seller=(String)(req.getSession().getAttribute("login_id"));
		logger.info("seller: "+seller);
		vo.setSeller(seller);
		
/*	 	<!-- 상품등록. registerProduct -->
	  	<insert id="insert">
	  	insert into ${product}(${category},${name},${start_price}, ${closed_time}, ${quantity}, ${seller}, ${immediate_price}, ${detail}) 
	  	values(#{category},#{name},#{start_price}, #{closed_time}, #{quantity}, #{seller}, #{immediate_price}, #{detail})</insert>*/
		String returnPath="main";
		int result= service.registerProduct(vo);
		if(result==1){
			logger.info("register success~");
			
			List<Integer> product_code_list= service.selectProductCode(vo); //1개 일 것이다.
			logger.info("list길이:"+ product_code_list.size());
		//	if(product_code_list.size()==1){ //1개 정상적으로 왓단얘기
				
				int product_code=product_code_list.get(0);
				// temp폴더 이름 바꾸기~~ 
				new File(uploadPath+File.separator+seller+File.separator+"temp")
				.renameTo(new File(uploadPath+File.separator+seller+File.separator+product_code));
								
				ProductVO product = service.selectProduct(product_code);
				if(product!=null){
					model.addAttribute("product", product);
					returnPath="/product/productDetail";
					System.out.println("img->"+product.getImg());
					
					// 받아온 img String
					//(*d6f8b2d9-b95b-4754-aacd-bd8c127c273f_fish2.jpg*0d259907-c388-47a7-b961-340cc017641a_fish1.jpg)
					//으로 실제 img파일이름 db에 저장
					String [] images = product.getImg().split("=");
					
					for(int i=1; i<images.length; i++){ //i가 0일땐빼고
						
						ProductImageVO pivo=new ProductImageVO(product_code*100+(i),  images[i]);
						imageService.insertProductImage(pivo);
					}
				}
		//	}
		
			
		}else{
			// temp폴더 삭제
			new File(uploadPath+File.separator+seller+File.separator+"temp").delete();
			
			returnPath="/product/registerProduct";
		}
		
		
		
		return returnPath;
	}
	
	
	@RequestMapping(value="/displayProductImg1", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayProductImg(String user_id, int product_code, int index) throws IOException {
	      
	      // 리턴 타입
	      ResponseEntity<byte[]> entity = null;
	      // 저장된 파일 스트림
	      InputStream in = null;
	      
	  	List<String> filenames=imageService.selectProductImage(product_code);
	  	 String filename= filenames.get(index);
	  	String Full=uploadPath+File.separator+user_id+File.separator+product_code+File.separator+filename;
		//근데 이거가 될런지..
	  	
	      in = new FileInputStream(Full);
	      
	      // 파일 확장자
	      String extension =filename.substring(filename.lastIndexOf(".") + 1);
	      // 응답 해더(response header)에 Content-Type을 설정해야 하기 때문에
	      HttpHeaders httpHeaders = new HttpHeaders();
	      httpHeaders.setContentType(MediaUtil.getMediaType(extension));
	      
	      // ResponseEntity 객체에
	      entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),// 파일에서 읽은 데이
	    		   httpHeaders, // 응답 헤더
	    		   HttpStatus.OK); // 응답 코드
	      
	      return entity;
	}

	
	@RequestMapping(value="/productList", method=RequestMethod.GET)
	public String productListGET(ProductVO vo, Model model){
		logger.info("productListGET() ");
		
		// 일단 카테고리 기준으로 리스트 받아오기 해보좌
		List<ProductVO> list;
		//일단 vo는 무조건 생성됨. 널이아님.(그래서조건에서뺌)  //주지않으면 category는 널이 맞구나 (당연한걸 가지고 왜 진을 뺌_)
		if(vo.getCategory()!=null){
			if(!vo.getCategory().equals("all")){  //all이 아니면 해당 카테고리로 select문
				logger.info("카테고리:"+vo.getCategory());
				list = service.selectListByCategory(vo.getCategory());  //일단은 category만 가지고
				
				//Contract_price넣을때 start_price로 넣어야하는데(bids 0일때는 db작업으로해줘야하지만 일단은 넣어주자)
				for(ProductVO vo1: list)	{
					if(vo1.getContract_price()==0)vo1.setContract_price(vo1.getStart_price());
				}
				model.addAttribute("productList", list);
				model.addAttribute("productNum",list.size());
			
		

			}else if(vo.getCategory().equals("all")){
				list = service.selectListByName(vo.getName());
			}
			
			
		}//category가 null이 아님
		
		
		return "product/productList";
	}
	
	@RequestMapping(value="/productDetail", method=RequestMethod.GET)
	public void productDetailGET(Model model, ProductVO product){
		product = service.selectProduct(product.getCode());
	
		long time=product.getClosed_time().getTime();
		long timeNow=(new Date()).getTime();
		logger.info(new Date()+"");
		logger.info(new Date(0)+"");
		logger.info(product.getClosed_time()+"");
		long mon=(time-timeNow)/1000/60/60/24/30;
		logger.info(mon+"달");
		logger.info("y->"+product.getClosed_time().getYear());
		logger.info("y->"+new Date().getYear());
		logger.info(""+product.getClosed_time().getTime());
//		Calendar cal = new GregorianCalendar(year, month, dayOfMonth, hourOfDay, minute, second);
//		Date date = cal.getTime();
		//model.addAttribute("month", (product.getClosed_time().getMonth() + 1));
		
		 int year=product.getClosed_time().getYear();
		 int month=(product.getClosed_time()).getMonth();
		 int date=product.getClosed_time().getDate();
		 int hour=product.getClosed_time().getHours();
		 int min=product.getClosed_time().getMinutes();
		 System.out.println("봐바:"+product.getClosed_time().getYear());
		 if(year>1000){  //이유?? 나도 모름 Date 클래스가 이상함. getYear도 만료된 메소드라 그런지 실제값과(2017년일때 117출력)다르게 출력하고? 하여튼 2017을 생성자 매개변수로
	    	  Date closed_time= new Date(year-1900, month, date, hour, min);
	    	  product.setClosed_time(closed_time);
	    	 logger.info(product.getClosed_time().getYear()+"year...");
	    	 logger.info(product.getClosed_time()+"마감시간...");
	      }
		 System.out.println("봐바:"+	product.getClosed_time().getYear());
		 
			model.addAttribute("product", product);
			model.addAttribute("grade", 7.4);
			model.addAttribute("review_cnt", 17);
			
			List<String> filenames=imageService.selectProductImage(product.getCode());
			model.addAttribute("fileNum", filenames.size());
	}
	
	
	/////////////////////////////bidding
	@RequestMapping(value="/biddingList", method=RequestMethod.GET)
	public void biddingList(BiddingVO vo, Model model, HttpServletRequest req){
		
		if(vo.getProduct_code()==0){// 이게 0이면 bidding에서 리다이렉트로 넘어왔다고 보는거임
			BiddingVO bvo=(BiddingVO)req.getSession().getAttribute("biddingVO");
			if(bvo!=null) vo.setProduct_code(bvo.getProduct_code());
			logger.info("코드 다시:"+bvo.getProduct_code());
		}
		List<BiddingVO>list=service.selectBiddingList(vo.getProduct_code());
		model.addAttribute("biddingList", list);
		
		
		// biddingList에 제품간략정보 띄우기 위한
		ProductVO productVO= service.selectProduct(vo.getProduct_code());
		logger.info("코드:"+vo.getProduct_code());
		model.addAttribute("product", productVO);
		logger.info("네임: "+productVO.getName());
		
	}
	
	@RequestMapping(value="/bidding", method=RequestMethod.POST)
	public void bidding(@ModelAttribute("vo") BiddingVO vo, HttpServletResponse res, HttpServletRequest req){

		logger.info("bidding중");
		
		logger.info(vo.getProduct_code()+"");
		logger.info(vo.getPrice()+"");
		vo.setUser_id("nt500");
		logger.info(vo.getUser_id());
		service.insertBidding(vo);
		
		// 리다이렉트???
		/*ProductVO pvo=new ProductVO();
		pvo.setCode(vo.getProduct_code());
		return biddingList(pvo, model);*/
		
		//세션에 내용 넣기
		HttpSession session= req.getSession();
		session.setAttribute("biddingVO", vo);
		
		try {
			res.sendRedirect("biddingList"); //리다이렉트 하니까 Model클래스가 유지가 안돼
			//req.getRequestDispatcher("biddingList").forward(req, res);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////
	// review
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="reviewList", method=RequestMethod.GET)
	private void reviewList(Model model){
		String seller="summer";
		List<ReviewVO> list = reviewService.selectListBySeller(seller);
		logger.info("dd->"+list.get(0).getDetail());
		model.addAttribute("reviewList", list);
	}
	
}
