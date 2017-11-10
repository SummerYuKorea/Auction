package edu.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import edu.spring.vo.UserVO;


public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("===== preHandle 호출");
		// targetUrl이 요청 매개변수(request parameter)가 있는 경우는
		// 세션에 그 정보를 저장
		String url = request.getParameter("targetUrl");
		if (url != null && url != "") {
			request.getSession()
				.setAttribute("dest", url);
		}
		return true;
	}
	
	@Override //TODO: 여기 희석님이 로그인 완성하시면 이 인터셉트 사용하여 로그인 정보를 session에 넣는다. // servlet-context가서 mapping필수
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("===postHandle호출");
		
		//모델 객체의 login_result 속성을 확인 (아까 컨트롤러의 메소드에서 넣은)
		// null이아니면 로그인 성공-> Session객체에 login_id 속성 추가
		// null이면 메인페이지로 이동
		UserVO vo = (UserVO)(modelAndView.getModel().get("login_result"));
		
		if(vo!=null){// controller메소드에서 form에서 넘어온 id, pw로 UserVO select해옴. 로그인오류면 null오겠지
			HttpSession session=request.getSession();
			session.setAttribute("login_id", vo.getId()); //user정보 세션에 넣는ㄴ 중 
			session.removeAttribute("login_fail");
			
			
			String dest = (String) 
					session.getAttribute("dest");
			if (dest != null) {
				response.sendRedirect(dest);
			} else {
				response.sendRedirect("/auc"); //그냥 메인으로 가는 중인가봄?
				
			}
			
		} else {
			logger.info("로그인 실패");
			HttpSession session = request.getSession();
			session.setAttribute("login_fail", "fail");
			System.out.println("/auc로 가야하는데: 로그인 실패");
			response.sendRedirect("/auc");
		}
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

}
