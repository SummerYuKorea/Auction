<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<style>
btn{

   display: inline-block;
    vertical-align: top;
    pading: 10px;
}


ul,ol,menu,li {
list-style:none;
}

  

.goodDetail_Area{margin:20px;width:400px; position:absolute; top:200px; left:800px}

   .goodtitleArea{width:500px;border-bottom:1px solid #ddd;float:left;padding-bottom:5px;}
      .goods_tit_txt1{font-size: 19px;line-height: 21px;margin-bottom: 0px; width:460px; color:#800000;}
      .goods_tit_txt1 a{color: #b56818;}
      .goods_tit_txt1 a:hover{text-decoration:underline;}
      

#goods_pic_main{
text-align:center;
vertical-align:center;
}



.goodImg_Area{position:relative; width:500px;float:left; top:150px; left:-80px;}
   .goods_pic{width:500px; height:500px; border:solid 1px #ccc; display:block;position:relative; overflow:hidden;background:#fff}
   .goods_pic img{position:absolute;top:0;right:0;bottom:0;left:0;margin:auto;max-height:100%;max-width:100%;}
   .goods_pic_btn{width:100%; margin-top:20px; text-align:center;}

   #s_goods{margin-top:10px; text-align:center;}
   .s_goods_pic{float:left; width:80px; height:80px; margin-left:5px; margin-right:5px; border:solid 1px #ccc; display:block; position:relative; overflow:hidden;}
   .s_goods_pic img{position:absolute;top:0;right:0;bottom:0;left:0;margin:auto;max-height:100%;max-width:100%;}
   .s_goods_pic_btn{float:left; margin-top:31px;}
   .thumImg{margin-top:10px; text-align:center;}


.goodGreadInfor{margin:20px; float:left; width:100%}
   .goodGreadInfor li{font-size:14px; fontcolor:#666;line-height: 16px;padding:4px 0; }
   .goodGreadInfor .strong{color:#000}
   .goodGreadInfor .deadtime{color:;}
   .goodGreadInfor .deadtimeShort{color:#e43137;}
   .goodGreadInfor .doogst{color:#e43137}
   .goodGreadInfor .pass{font-size: 12px;color:#888}

.goodSeller{
   width:300px;display: inline-block; border-left:1px solid #ddd; padding:10px; margin-top:10px; position:absolute; top:200px; left:1250px
}

.goodtitleArea2
   {border-bottom:1px solid #ddd;  display: inline-block;padding-bottom:5px;width:100%}

.goods_tit_txt2{font-size: 19px;line-height: 21px;margin-bottom: 0px; width:460px; color:#800000;}   


.star {
    display: inline-block;
    width: 75px;
    height: 13px;
    background: url(../resources/images/sp_star.gif) no-repeat 0 -37px;
    text-align: left;
    vertical-align: middle;
}


.star em {

    display: block;
    background: url(../resources/images/sp_star.gif) no-repeat 0 -59px;
    text-indent: -9999px;
}

.detailTitle {
    margin: 0 0 17px;
    border-bottom: 1px solid #e0e0e0;
    font-size: 22px;
    font-size: 20px;
    line-height: 50px;
    letter-spacing: -0.5px; 
}

.detailSection{
   position:relative;
   top: -101px;
   left: 480px;
   width: 700px;
   border: 1px solid #ccc;
   display: inline-block;
   padding: 20px;
   margin: 30px;
    
}
.box{
   height: 350px;
   width: 700px;
    
}

.detailFont{
   color:#f00;
   font-size: 120%;
         
}


</style>


<!-- 
<nav>: 링크, 메뉴
 -->
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>

         <%@ include file="header.jspf" %>
          <%@ include file= "nav.jspf" %>



<div class="goodTotal">
<section class="goodImg_Area">
     <p class="goods_pic" id="goods_pic_main" style="position: relative;"><img width="80%" src="displayProductImg1?user_id=${product.seller}&product_code=${product.code}&index=0"  id="IMG_DETAIL" name="IMG_DETAIL" data-zoom-image="http://i.ebayimg.com/00/s/MTAwMFgxMDAw/z/l-4AAOSwGIRXYikX/$_1.JPG?set_id=880000500F" onclick="viewFullImage();" style="top: 50px; left: 50px;">
     <img style="display: none; top: 50px; left: 50px;" src="displayProductImg1?user_id=${product.seller}&product_code=${product.code}&index=0"  width="null" height="null"></p>
  <!-- 썸네일 이미지 -->
    <!-- todo : http://dev.ebay.auction.co.kr/?dir=shop&itemID=161747155826 -->
    <div class="thumImg">
        <table >
            <tbody><tr>
                <td width="10" align="left"><img name="img_thumbnail_left" src="http://pics3.wsbind.com/global/ns_lft01.png" style="cursor: pointer;"></td>
                <td><div style="width:460px;height:90px;overflow:hidden;border:red 1px none" id="id_thumbnail_frame"><table style="margin-left: 0px;">
                            <tbody><tr>
                            
                            <c:forEach end="${fileNum-1 }" begin="0" var="i">
                            	  <td align="center" height="90">
                                   	<a href="#" data-image="displayProductImg1?user_id=${product.seller}&product_code=${product.code}&index=${i}" data-zoom-image="displayProductImg1?user_id=${product.seller}&product_code=${product.code}&index=${i}">
                                    	<img src="displayProductImg1?user_id=${product.seller}&product_code=${product.code}&index=${i}"  onclick="document.getElementById('IMG_DETAIL').src='displayProductImg1?user_id=${product.seller}&product_code=${product.code}&index=${i}'" width="80" height="80" style="margin-top: 0px;">
                                    </a>
                                   </td>
                            </c:forEach>
                                  
                                   </tr>
                            <tr>
                            </tr>
                        </tbody></table></div></td>
                <td width="10" align="right"><img name="img_thumbnail_right" src="http://pics3.wsbind.com/global/ns_right02.png" style="cursor: pointer;"></td>
            </tr>
        </tbody></table>
    </div>
  
</section>
  </div>
<section class="goodDetail_Area">

<ul class="goodtitleArea">
    <li class="goods_tit_txt1"><strong>${product.name }</strong></li>
</ul>

<ul class="goodGreadInfor">
 <c:set value="${product.category}" var="cate"/>
   <li class= "mainFont"><strong>상품 코드:</strong> p_${cate}${product.code }</li>
   <li class= "mainFont"><strong>상품 종류:</strong> <c:if test="${cate=='fresh'}">쌀/과일/농수축산물</c:if>
               <c:if test="${cate=='drink'}">커피/음료</c:if>
               <c:if test="${cate=='healthy'}">건강/다이어트</c:if>
               <c:if test="${cate=='instant'}">즉석/가공식품</c:if> </li>
    <li class= "mainFont"><div><strong>제품상태:</strong> <span class="detailFont">상</span></div></li>
    <li class= "mainFont"><strong>상품 시작가 :</strong> ${product.start_price } 원 </li>
    <li class= "mainFont"><strong>현재 입찰가 :</strong> <span class="detailFont">${product.contract_price }</span>원</li>     
    <li class= "mainFont"><strong>남은 시간:</strong> <span id="lefttime" class="detailFont">종료된 경매입니다</span></li>
    <li class= "mainFont"><strong>판매종료:</strong> <span id="deadtime">${product.closed_time }</span></li>
    <li class= "mainFont"><a href=""><strong>입찰 수</strong> : ${product.bidders} 명</a></li>  
    <li class= "mainFont"><input type="text" style="height:33px" placeholder="가격을 입력하세요"><a id="" href=""><img src="http://pics.auction.co.kr/listing/used/2014/btn_bidding.gif" alt=""></a>&nbsp;<a id="" href=""><img src="http://pics.auction.co.kr/listing/used/2014/btn_buy.gif" alt=""></a></li>
    <li class= "mainFont"><a href="biddingList?code=${product.code }"><img src="../resources/images/history2.png" height="30px;" width="30px;" margin-bottom="3px;"alt=""><button type="button"  id="biddingList" style="font-size:16px;"><strong>입찰 기록</strong></button></a></li>
    
    
    
</ul>
</section>
<section class="goodSeller">
<ul class="goodtitleArea2">
   <li class="goods_tit_txt2"><strong>판매자  정보</strong></li>
</ul>
<ul class="goodGreadInfor">  
   <li><img src="../resources/images/seriouslytired.png" style="width:150px; height:150px"></li>
   <li>판매자 아이디 : ${product.seller }</li>
   
   <li>판매자 별점/리뷰 :                      
                                <span class="star"><em style="width:${grade*100}%">평점</em></span>
                                <span id="topPointTotalNumber"><strong>${grade }</strong></span>
                                <span class="pointTotalPerson">(참여 <em>${review_cnt }</em>)</span>
                            
   </li>
   <li><a id="" href="">판매자의 다른 상품들</a></li>
</ul>
</section>

<section class="detailSection">
   <h3 class="detailTitle">상세정보</h3>
   <div class="box">${product.detail }</div>
   <h3 class="detailTitle" >추가구성상품</h3>
   <div class="box"></div>
   <h3 class="detailTitle" >기  타</h3>
   <div class="box"></div>
   </section>
   
   <%-- footer 파일(jspf)을 include --%>
   <%@ include file="footer.jsp" %>
<script>
//푸터
var height = Number($('.detailSection').height());
if (height < 1300) {
   height = 320;
}
console.log(height+'');
$('#footer').css('position', 'relative');
$('#footer').css('top', (height + 250) + 'px');
</script>

 


<script>
   
	  var year=${product.closed_time.year};
      var month=${product.closed_time.month}+1;
      var date=${product.closed_time.date};
      var hour=${product.closed_time.hours};
      var min=${product.closed_time.minutes};
      
      var closed_time_ms= ${product.closed_time.time};
      
      $('#deadtime').html(month+'월 '+date+'일 '+hour+'시 '+min+'분'); 
      
      function countDown(){
         
         
         var timeNow = new Date();
      
         var secLeft = (parseInt)((  closed_time_ms- timeNow.getTime()) /1000);
         var timerOver='N';
         
         if(secLeft <=0) {
            timerOver='Y';
         }else{
            $('#lefttime').html(secLeft+'초 남음'); 
            console.log(secLeft+'초 남음');   
         }
         
         var minLeft =parseInt(secLeft/60);
         if(minLeft>=1){
            secLeft= secLeft-minLeft*60;      
            $('#lefttime').html(minLeft+'분 '+secLeft+'초 남음'); 
         }
      
         
         var hourLeft = parseInt(minLeft/60);
         if(hourLeft >= 1){
            minLeft=minLeft-hourLeft*60;
            $('#lefttime').html(hourLeft+'시간 '+minLeft+'분 '+secLeft+'초 남음'); 
         }
         
            var dayLeft = parseInt(hourLeft/24);
            if(dayLeft>=1){
               hourLeft = hourLeft- dayLeft*24;
               $('#lefttime').html(dayLeft+'일 '+hourLeft+'시간 '+minLeft+'분 '+secLeft+'초 남음'); 
            }
            
            if(timerOver='N'){
                setTimeout("countDown()", 1000) ;
                console.log('countDown!');
            }
         
         }//function countDown()
      
      //카운트다운실행
      countDown();
      
</script>


</body>
</html>