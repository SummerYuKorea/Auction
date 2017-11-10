<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../resources/css/mystyle2_1.css"/> 



<!-- 
<nav>: 링크, 메뉴
 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    ul,ol,menu,li {
   list-style:none;
   }
   ul{
           padding: 0 10px;
    }
    a{
    font-size: 12px;
    color: #333333;
    }
   li {
      float : left;
      padding:30px;
      width:300px;
     
      
    }   
   .item_sell{
      padding-top:5px;
      font-size: 20px;
      font-weight:bold;
   }
    .item_tit{
       overflow: hidden;
       height: 32px;
       margin-top: 13px;
       font-family: dotum;
       font-size: 12px;
       color: #333333;
       line-height: 17px;
   }  
   
 .productlist{
    background:white;
      width:1100px;
      padding:30px;
      margin:auto;
      float:left;
   }   
 
.main{
width:1400px;
}


</style>


</head>
<body>





<div class="main"><!-- class="list"> -->

      <%-- header 파일(jspf)을 include --%>
         <%@ include file="header.jspf" %>
          <%@ include file= "nav.jspf" %>
<section id="main">
<div class="productlist"><!-- div 1번째 줄  -->

    
    
  
   <ul> <!-- product list ul 입니다. -->
        
    <li><!--1번 째 상품입니다. -->
    <div>
         <a href="">
                <img alt="RYN 마사이워킹화 화이트 220 보관 새상품/구제신발가게" src="http://image.auction.co.kr/itemimage/11/bd/7b/11bd7b3bd7.jpg" style="height:300px;width:300px;"></a> 
         <img class="icon_auction" alt="경매" src="http://pics.auction.co.kr/listing/used/2014/icon_auc.png">
      </div>
      
      <div>
         <a href="" onclick="" >입찰하기</a>
         <a href="" onclick="" >구매하기</a>        
      </div>
      
      <div class="item_tit">
         <a href="">RYN 마사이워킹화 화이트 220 보관 새상품/구제신발가게</a>
      </div>
      
            <div class="item_sell">
              <span class="tit">현재가</span> 
              <span class="cost"><strong>20,000</strong>원 </span>
            </div>
            
            <div>
             <div>입찰자0</div>
             <div>6/10 20:01</div>
          </div>

      
      <div><a href="">구재신발가게6</a></div>
   </li><!-- 1번 째 상품입니다. -->
    
   
     
        
    <li>  <!-- 2번 째 상품입니다. -->     
      <div class="item_img">
         <a href="">
                <img alt="국산 모비스 정품 TEC-7000 3구 매립형 후방감지기 (은색)" src="http://image.auction.co.kr/itemimage/11/bd/7b/11bd7b3247.jpg" style="height:300px;width:300px;"></a> 
         
         <img class="icon_auction" alt="경매" src="http://pics.auction.co.kr/listing/used/2014/icon_auc.png">
      </div>
      <div>
         <a href="" onclick="">관심상품담기</a>
         <a href="" onclick="">미리보기</a>
          
      </div>
      <div class="item_tit">
         <a href="">[현대모비스]국산 모비스 정품 TEC-7000 3구 매립형 후방감지기 (은색)</a>
      </div>
      
        
            <div class="item_sell">
              <span class="tit">현재가</span> 
              <span class="cost"><strong>20,000</strong>원 </span>
            </div>
            
            
             <div>입찰자0</div>
             <div>6/8 10:21</div>
          
   </li><!-- 2번 째 상품입니다. -->
    
   
          
    <li>   
      <div>
         <a href="">
                <img alt="일본 카멜 둥근앞코 플랫  245  보관 새상품 /구제신발가게" src="resources/images/forest.jpg" style="height:300px;width:300px;"></a> 
         <img class="icon_auction" alt="경매" src="http://pics.auction.co.kr/listing/used/2014/icon_auc.png">
      </div>
      <div>
         <a href="" onclick="">관심상품담기</a>
         <a href="" onclick="">미리보기</a>
          
      </div>
      <div class="item_tit">
         <a href="">일본 카멜 둥근앞코 플랫  245  보관 새상품 /구제신발가게</a>
      </div>
      
      
            <div class="item_sell">
              <span>현재가</span> 
              <span><strong>5,000</strong>원 </span>
            </div>
            
            <div>
             <span>입찰자</span><span>0</span>
             <span>6/8 20:01</span>
          </div>
       
      <div><a href="">구재신발가게6</a></div>
   </li>
      
  </ul>
   
 </div> <!-- div 상품리스트 1번째 줄  -->
 
 
 <div class="productlist"><!-- div 2번째 줄  -->

    
    
  
   <ul> <!-- product list ul 입니다. -->
        
    <li><!--1번 째 상품입니다. -->
    <div>
         <a href="">
                <img alt="RYN 마사이워킹화 화이트 220 보관 새상품/구제신발가게" src="http://image.auction.co.kr/itemimage/11/bd/7b/11bd7b3bd7.jpg" style="height:300px;width:300px;"></a> 
         <img class="icon_auction" alt="경매" src="http://pics.auction.co.kr/listing/used/2014/icon_auc.png">
      </div>
      
      <div>
         <a href="" onclick="" >입찰하기</a>
         <a href="" onclick="" >구매하기</a>        
      </div>
      
      <div class="item_tit">
         <a href="">RYN 마사이워킹화 화이트 220 보관 새상품/구제신발가게</a>
      </div>
      
            <div class="item_sell">
              <span class="tit">현재가</span> 
              <span class="cost"><strong>20,000</strong>원 </span>
            </div>
            
            <div>
             <div>입찰자0</div>
             <div>6/10 20:01</div>
          </div>

      <div><a href="">구재신발가게6</a></div>
   </li><!-- 1번 째 상품입니다. -->
    
   
     
        
    <li>  <!-- 2번 째 상품입니다. -->     
      <div class="item_img">
         <a href="">
                <img alt="국산 모비스 정품 TEC-7000 3구 매립형 후방감지기 (은색)" src="http://image.auction.co.kr/itemimage/11/bd/7b/11bd7b3247.jpg" style="height:300px;width:300px;"></a> 
         
         <img class="icon_auction" alt="경매" src="http://pics.auction.co.kr/listing/used/2014/icon_auc.png">
      </div>
      <div>
         <a href="" onclick="">관심상품담기</a>
         <a href="" onclick="">미리보기</a>
          
      </div>
      <div class="item_tit">
         <a href="">[현대모비스]국산 모비스 정품 TEC-7000 3구 매립형 후방감지기 (은색)</a>
      </div>
      
        
            <div class="item_sell">
              <span class="tit">현재가</span> 
              <span class="cost"><strong>20,000</strong>원 </span>
            </div>
            
            <div>
             <div>입찰자0</div>
             <div>6/8 10:21<div>
          </div>
   </li><!-- 2번 째 상품입니다. -->
    
   
          
    <li>  <!-- 3번 째 상품입니다. -->    
      <div>
         <a href="">
                <img alt="일본 카멜 둥근앞코 플랫  245  보관 새상품 /구제신발가게" src="resources/images/forest.jpg" style="height:300px;width:300px;"></a> 
         <img class="icon_auction" alt="경매" src="http://pics.auction.co.kr/listing/used/2014/icon_auc.png">
      </div>
      <div>
         <a href="" onclick="">관심상품담기</a>
         <a href="" onclick="">미리보기</a>
          
      </div>
      <div class="item_tit">
         <a href="">일본 카멜 둥근앞코 플랫  245  보관 새상품 /구제신발가게</a>
      </div>
      
      
            <div class="item_sell">
              <span>현재가</span> 
              <span><strong>5,000</strong>원 </span>
            </div>
            
            
             <div>입찰자0</div>
             <div>6/8 20:01</div>
          
       
      <div class="item_seller"><a href="">구재신발가게6</a></div>
   </li> <!-- 3번 째 상품입니다. --> 
  </ul>

 </div> <!-- div 상품리스트2번째 줄  -->
 
</section>

      <%-- footer 파일(jspf)을 include --%>
   <%@ include file="footer.jsp" %>
   

</div> <!-- div id=list -->

</body>
</html>