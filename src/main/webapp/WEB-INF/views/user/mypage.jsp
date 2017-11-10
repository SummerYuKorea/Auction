<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<style>
#a{
border: 1px solid black;
}

.s1, .s2 {
   width: 10px;
   height: 60px;
}
.s3, .s4 {
   width: 10px;
   height: 60px;
}
#a {
    border: 1px solid #964b4b;
    background: #964b4b; 
}
.sub_title_dep{
   image-align: center;
}

#contents{

}

#menu {
   list-style-type: none;
}
/* 부모요소 자식요소 */
#menu li {
   display: inline-block;
   margin-left: 50px;
   width: 500px;
   height: 150px;
   text-align: left;
   background: white;
   color: darkgrey;
   
}
/* #menu li:hover {
   background: lightpink;
}
#menu li:active {
   background: green;
   color: red;
} */


 .sub_title_dep{
float: left;
position: relative;
left: 40%
}

#contents {

	float: left;
position: relative;
left: 20%
}
</style>

<body>

   
   <div id="contents" >
            
   <div class="s1"></div>
   <div class="sub_title_dep"><img src="../resources/images/title_mypage.gif" alt="상단 타이틀" width="140%" style="margin:0px"></div>
   <div class="s2"></div>
   <hr/>

   <ul id="menu">
      <a href="cart"><li><br/><spen id="a"><b> 장바구니 </b></spen><br/><br/><h5>고객님께서 낙찰 받으신 상품이 담겨있습니다.<br/><br/>상품선택후 구매하기 버튼으로 결제를 하시면 상품배송이 시작됩니다.</h5></li></a>
      <a href="myInfo"><li><br/><spen id="a"><b> 회원 정보 </b></spen><br/><br/><h5>고객님의 개인정보를 관리하는 공간입니다.<br/><br/>개인정보를 최신 정보로 유지하시면 보다 간편히 경매를 즐기실 수 있습니다.</h5></li></a>
   </ul>
   <div class="s3"></div>
   
   <ul id="menu">
      <a href="biddingList"><li><br/><spen><b id="a"> 입찰 목록  </b></spen><br/><br/><h5>고객님께서 입찰하신 목록을 한눈에 살펴볼 수 있어요.<br/><br/>현재 진행중인 경매에 입찰중인 상품들을 볼 수 있습니다.</h5></li></a>
      <a href="buyList"><li><br/><spen><b id="a"> 구매 목록  </b></spen><br/><br/><h5>고객님께서 작성하신 게시물을 한눈에 관리하실 수 있습니다 살펴볼 수 있어요.<br/><br/>구매가 완료된 상품들은 상품평을 작성하실 수 있습니다.</h5></li></a>
   </ul>
   <div class="s4"></div>
   
   <ul id="menu">
      <a href="../product/registerProduct"><li><br/><spen><b id="a"> 상품 등록  </b></spen><br/><br/><h5>고객님께서 경매에 상품을 등록하실 수 있습니다.</h5></li></a>
      <a href="productList"><li><br/><spen><b id="a"> 내 상품 보기  </b></spen><br/><br/><h5>고객님께서 경매에 등록하신 상품들을  관리하실 수 있습니다.</h5></li></a>
   </ul>
   <div class="s4"></div>
      
   <ul id="menu">
      <a href="#none"><li><br/><spen><b id="a"> 관심 상품 </b></spen><br/><br/><h5>고객님께서 관심상품으로 등록한 상품들을 한눈에 살펴볼 수 있습니다.</h5></li></a>
      <a href="registerReview"><li><br/><spen><b id="a"> 마이 리뷰 </b></spen><br/><br/><h5>고객님께서 작성하신 게시물을 한눈에 살펴볼 수 있습니다.</h5></li></a>
   </ul>
   <div class="s4"></div>
   </div>

      
   
</body>
</html>