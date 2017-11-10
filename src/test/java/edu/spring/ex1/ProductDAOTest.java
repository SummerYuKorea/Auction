package edu.spring.ex1;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.persistence.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ProductDAOTest {
	
private static final Logger logger= LoggerFactory.getLogger(ProductDAOTest.class);
	
	@Autowired
	private ProductDAO dao;  //스프링프레임웤이 생성해야해 <- 그래서 root.xml에 package-scan그거 설정한거야 생성한애 찾아오려고? (근데 servlet-context.xml에있어서원래되긴
	
	@Test
	public void testDAO(){
//		selectByCategory();
		selectMaxPrice();
	}
	
	private void selectByCategory(){
		dao.selectListByCategory("fresh");
	}
	
	private void selectMaxPrice(){
		if(dao.selectMaxPrice(1)==null)System.out.println("널일세");
		else{ System.out.println("과연널?: "+dao.selectMaxPrice(1));}
	}
	
	

}
