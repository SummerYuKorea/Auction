<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="../resources/css/productListstyle2.css"/>

<!-- 
<nav>: 링크, 메뉴
 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#main {
   padding: 20px;
   /*
   margin-left: 210px;
    margin-right: 210px;
    */
    margin: 130px 40px; /* top & bottom: 0px, right & left: 210px */
}

.prdtop{
    font-size: 15px; 
    font-weight: bold;
    text-decoration:none;
      padding-left:30px;
     margin:5px;
    }
.p{
   padding-left:10px;
}       

</style>







</head>
<body>





<div class="list"><!-- class="list"> -->

      <%-- header 파일(jspf)을 include --%>
         <%@ include file="header.jspf" %>
          <%@ include file= "nav.jspf" %>

<section id="main" style="margin: 130px 20px;">

<%-- <c:set var="productList" value="<%=list %>" /> --%>
<%-- <c:set var="productNum" value="<%=list.size() %>" /> --%>
<c:set var="lines" value="${(productNum-1)/3 }"/> <!-- 1,2,3일때 1줄(0)// 4,5,6일때 2줄(1) ...  -->

<c:forEach begin="0" end="${lines}" var="line_var"> <!-- 0,1,2,3,4...(1번째줄에서 var은 0) -->
   

   <div class="productlist"><!-- div 1번째 줄  -->

  
   <ul class="prdul"> <!-- product list ul 입니다. -->
      <%--     <c:set var="orders" value="2"/>
      <c:if test="${lines==line_var && productNum%3!=0}"><!-- 마지막 줄이면 && 프로덕트갯수가 3으로 나누어 떨어지지 않으면-->
      <c:set var="orders" value="${productNum%3 -1} "/> <!-- orders는 보통은 2(0,1,2 //3개되어야하니까) //마지막줄에선 나머지 -->
      </c:if> --%>
    <c:forEach begin="0" end="2" var="order_var"> <!-- 3개씩놓을꺼니까 0,1,2까지만.  -->
    <c:set var="product" value="${productList[(line_var*3)+order_var] }"/>
   
      <c:if test="${product!=null}">
    <li class="prd" ><!--1번 째 상품입니다. -->
    <div onmouseover="mouseOver(this)" style="display:inline-block">
       <div class="item_img">
       <a href="#" class="prd" onclick="clickPrd(this,${product.code})">
        <img alt="${product.name}" src="displayProductImg1?user_id=${product.seller}&product_code=${product.code}&index=0" 
        style="height:300px;width:300px;" id="img">    
         <img class="icon_auction" alt="경매" src="http://pics.auction.co.kr/listing/used/2014/icon_auc.png">
         
        </a> 
      </div>
      
     <!--  <div>
         <a href="" onclick="" >입찰하기</a>
         <a href="" onclick="" >구매하기</a>        
      </div> -->
     
      <div class="item_tit">
         <%-- <a href="" class="prd" onclick="clickPrd(this,${product.code})">${product.name }</a> --%>
      </div>
      
            <div class="item_sell">
            <a href="" class="prdtop"  style="color:#800000" onclick="clickPrd(this,${product.code})">${product.name }</a>
            <a href="#" class="prd" onclick="clickPrd(this,${product.code})">
  
            <p class="p">
            <c:if test="${product.contract_price==0 }"></c:if>
              <span class="tit">현재가</span> 
              <span class="cost"><strong style="margin:3px; text-indent: 10px; font-size:15px">${product.contract_price }원 </strong></span>
              </p>
         
             <p class="p"><span>입찰수: ${product.bidders}</span></p>
             <p class="p"><span class="remain_time">${product.closed_time }</span></p></a>
             
            <div><p class="p"><a href=""  class="prd" style="margin-bottom:5px; margin-left: 5px;">즉시판매가 : ${product.immediate_price} 원</a>
          </div>
          
          </div>

      
      </div>
   </li><!-- 1번 째 상품입니다. -->
  
   </c:if>
   </c:forEach>
     
  </ul>
   
 </div> <!-- div 상품리스트 1번째 줄  -->
 
 </c:forEach>

 
</section>

  

</div>
<div id="main2" style="height:10px;"></div>


	<%-- footer 파일(jspf)을 include --%>
	<%@ include file="footer.jsp" %>
   

<script>

$(document).ready(function(){
	var height = Number($('.logo').height());
	var height2 = ${lines+1}*570;
	console.log(${lines+1}+"lines");
	if (height2 < 660) {
	   height2 = 660;
	}
	$('#footer .footer_company').css('position', 'relative');
	$('#footer').css('position', 'absolute');
	$('#footer').css('top', (250+height2)+ 'px');
	$('#footer').css('left', 0+ 'px');
	$('#footer').css('margin', 0+'px');
	//$('#footer').css('height',164+'px');
	

});

</script>
<script>

	$(document).ready(function(){
		console.log("봐방"+$('#img').attr('src'));
	});
      
       function mouseOver(prd){
          //prd.style.background="black"; 
         // cursor:"move";
          
       }
       function clickPrd(prd, product_code){
          /* var frm= $('#frm');
          $('#frm input').value(product_code);
          console.log("---");
          frm.submit(); */
          
          prd.href='productDetail?code='+product_code;
          
          
       }

</script>

</body>
</html>