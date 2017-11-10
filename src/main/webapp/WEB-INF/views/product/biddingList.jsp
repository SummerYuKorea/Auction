<%@page import="java.util.Date"%>
<%@page import="edu.spring.vo.BiddingVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.spring.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt"
   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>


ul,li {
list-style:none;
}

   .form-login{
      background:white;
      width:60%;
      padding:20px;
      margin:auto;  /*마진을 자동으로 줘서 가운데정렬됨(?)*/
   }
   
   
   .goodDetail_Area{margin:20px;width:500px;float:left; position:relative; top:200px; left:300px;}

   .goodtitleArea{width:800px;border-bottom:1px solid #ddd;float:left;padding-bottom:5px; margin-bottom:10px; padding-left:15px;}
      .goods_tit_txt1{font-size: 19px;line-height: 21px; width:460px; font-family: Tahoma; font-weight: bold; }
      .goods_tit_txt1 a{color: #b56818;}
/*       .goods_tit_txt1 a:hover{text-decoration:underline;} */
      
   .goodGreadInfor{margin:20px;float:left;}
   .goodGreadInfor li{font-size:14px;color:#666;line-height: 16px;padding:4px 0; font-family: Tahoma;}
   .goodGreadInfor .strong{color:#000}
   .goodGreadInfor .deadtime{color:;}
   .goodGreadInfor .deadtimeShort{color:#e43137;}
   .goodGreadInfor .doogst{color:#e43137}
   .goodGreadInfor .pass{font-size: 12px;color:#888}

.goodSeller{
   width:300px;display: inline-block; border-left:1px solid #ddd; padding:10px; margin-top:15px; position:absolute; top:200px; left:800px
}

.goodtitleArea2
   {border-bottom:1px solid #ddd;  float:left; width:100%;  padding-left:15px;}

.goods_tit_txt2{font-size: 19px;line-height: 21px;margin:9px; width:460px; font-family: Tahoma; font-weight: bold;}

.goodBidding{
   padding-left:45px; margin-top:10px;
}   

.goodBidding td{font-size:14px;color:#666;  font-family: Tahoma;
   
}
.biddingTable{
text-align:left; width:500px;
}

.biddingTable tr th {
padding:2px; font-size:16px;color:#666;line-height: 16px;padding:4px 0; font-family: Tahoma; font-weight:bold;
}
.biddingTable tr td{
padding:2px; font-size:14px;color:#666;line-height: 16px;padding:4px 0; font-family: Tahoma;
} 


.remain_time{
   display: inline-block;
    height: 16px;
    padding-bottom: 5px;
    padding-left: 17px;
    background: url(//pics.auction.co.kr/listing/used/2014/txt2_watch.gif) 0 3px no-repeat;
    font-family: Tahoma;
    font-size: 14px;
    color: #666666;
    vertical-align: top;
   
}

#div2{
   position:absolute;
}
   
</style>
<script>
  function onLoad() {
      div2.style.top  = parseInt(div1.style.top)+500;
  }
  </script>
</head>
<body>

<% List<BiddingVO> list = new ArrayList<>();
   BiddingVO vo=new BiddingVO();
   vo.setUser_id("hoyoung");
   vo.setPrice(25000);
   vo.setRegdate(new Date());
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   list.add(vo);
   request.setAttribute("biddingList", list);
   
   
   %>

   <%@ include file="header.jspf" %>
          <%@ include file= "nav.jspf" %>


<h1>bidding history</h1>

<section class="goodDetail_Area">

<ul class="goodtitleArea">
    <li class="goods_tit_txt1">입찰자수 : 0명 / 입찰건수 : 0건</li>
</ul>
<form action="bidding" method="post">
<div id="div1" style="position:relative; top:0px">
<ul class="goodGreadInfor">


      <table class="biddingTable">    
            <tr>   
              <th>아이디</th>
               <th>수량</th>
               <th>가격</th>
               <th>작성시간</th>   
            </tr>
         
         <c:forEach items="${ biddingList}" var="vo" >
            <tr>
                 <td><input type="hidden" name="" value=""/>${vo.user_id }</td>
                 <td><input type="hidden" name="" value=""/>5개</td>
                 <td><input type="hidden" name=""value=""/>${vo.price }</td>
                 <td><input type="hidden" name=""value=""/>${vo.regdate }</td>
             </tr>
         </c:forEach>
         
         </table> 
</ul>
</div>
</form>
</section>

<section class="goodSeller">
<ul class="goodtitleArea2">
   <li class="goods_tit_txt2">상품 정보</li>
</ul>
<ul class="goodGreadInfor">
   <li><img alt="파리saaass" src="../resources/images/paris.jpg"
            width="300px" height="200px" /></li>
   <li>상품 이름 : ${product.name }</li>
   <li>상품 수량 : ${product.quantity }</li>
   <li>입찰가 : ${product.contract_price }</li>
   <li><span class="remain_time">마감시간: ${product.closed_time }<font id="id_left_time">8일 15시간 27분 52초 남음</font></span></li>
   
<li>   
   <form>
      <table class="goodBidding" >
         <tr>
            <td><input style="height: 35px; margin-right:5px;width:220px" 
               type="text" name="price" placeholder="입찰 가격을 입력하세요" /><input type="hidden" name="product_code" value="${product.code}"/></td>
            <td><img src="http://pics.auction.co.kr/listing/used/2014/btn_bidding.gif" alt=""></td>
            
          
            </tr>
      </table>
   </form>
   
</li>
</ul>

</section>

 <%@ include file="footer.jsp" %>
<script>
var height = Number($('.goodDetail_Area').height());
if (height < 660) {
   height = 660;
}
$('#footer').css('position', 'relative');
$('#footer').css('top', (height + 250) + 'px');
</script>
</body>
</html>