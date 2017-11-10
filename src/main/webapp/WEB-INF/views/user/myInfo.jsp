<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<title>Cart</title>
<style>
ul[class="nav nav-tabs"],div[class="tab-content"]{
	width: 650px;
}

#menu {
	list-style-type: none;
}
#main {
	display: inline-block;
	margin: 20px;
	width: 700px;
}
.side {
	
	width: 200px;
	margin: 20px;
	float:left;	
}

.btn {
	text-align: center;
}

thead {
	font-weight: bold;
	font-style:italic;
}

td {
	border-bottom: 1px solid gray;
	border-collapse: collapse;
	text-align: center;
}

table {
	width: 100%;
}

.btn_buy {
  display: inline-block;
  padding: 15px 25px;
  font-size: 20px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.btn_buy:hover {background-color: #3e8e41}

.btn_buy:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

</style>

<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script> -->
<!-- Bootstrap 최신 버전의 css 파일들을 링크 -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head> --> 


<body>

<div class="container">
  <h3>Inline List</h3>
  <ul class="list-inline">
    <li><a href="#">Home</a></li>
    <li><a href="cart1">Menu 1</a></li>
    <li><a href="cart2">Menu 2</a></li>
    <li><a href="myInfo">My INFO</a></li>
  </ul>
</div>


<div class="side">
  <h2>Panels with Contextual Classes</h2>
  <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading">Panel with panel-default class</div>
      <div class="panel-body"><b><a href="cart">장바구니</a></b></div>
    </div>

    <div class="panel panel-primary">
      <div class="panel-heading">Panel with panel-primary class</div>
      <div class="panel-body"><b><a href="buyList">구매 목록</a></b></div>
      <div class="panel-body"><b><a href="biddingList">입찰 목록</a></b></div>
    </div>

    <div class="panel panel-success">
      <div class="panel-heading">Panel with panel-success class</div>
      <div class="panel-body"><b><a href="#">상품평</a></b></div>
    </div>

    <div class="panel panel-info">
      <div class="panel-heading">Panel with panel-info class</div>
      <div class="panel-body"><b><a href="#">상품 등록</a></b></div>
    </div>

    <div class="panel panel-warning">
      <div class="panel-heading">Panel with panel-warning class</div>
      <div class="panel-body"><b><a href="#">배송지 변경</a></b></div>
    </div>

    <div class="panel panel-danger">
      <div class="panel-heading">Panel with panel-danger class</div>
      <div class="panel-body"><b><a href="myInfo">회원정보</a></b></div>
    </div>
  </div>
</div>



<div id="main">
<div>
 <h1>회원 정보 </h1>
 <div class="container">
  <ul class="nav nav-tabs">
    <li ><a data-toggle="tab" href="#home">회원정보 수정</a></li>
    <li ><a data-toggle="tab" href="#menu1">회원 상태</a></li>
    <li ><a data-toggle="tab" href="#menu2">회원 탈퇴</a></li>
  </ul>

  <div class="tab-content"> 
    
      <!--회원정보 - 회원정보 탭  -->
      <div id="home" class="tab-pane fade in active">
      <h3>회원정보 수정</h3>
      <br/>
 	  <form id="frm" >
 	  <input type ="hidden" id="id" name="id" value="${vo.id}" />
 	  <label for ="name">회원 이름</label>
      <input type ="text" id="name"  value="${vo.name}" readonly/>
      <br/>
      <label for ="pw">비밀번호 변경</label>
      <input type ="text" name = "pw"  id="pw"  value="${vo.pw}" required autofocus/>
      <br/>
      <label for ="email">e-mail</label>
      <input type ="email" name = "email"  id="email" value="${vo.email}" />
      <br/>
      <label for ="phone">휴대전화 번호</label>
      <input type = "text" name = "phone"  id="phone" value="${vo.phone}" autofocus/>
      <br/>
      <label for ="address">배달 받을 주소</label>
      <br/>
      <input type ="text" name="address" id="address" value="${vo.address}" autofocus/>
      
      <br/>
      </form>
      <button id="btn_update" type = "submit">수정</button>
    </div> 
    
    <!--회원정보 - 회원상태 탭  -->
    <div id="menu1" class="tab-pane fade">
      <h3>회원 상태</h3>
      <br/>
      
      <c:if test="${vo.status == 'Y' }">
	  	<%-- not empty: not null && 빈 문자열("") 아님 --%>
	  	<p>${login_id }님, 회원상태는 정상입니다!</p><br/>
	  </c:if>
      
      <c:if test="${vo.status == 'N' }">
	
	    <p>${login_id }님, 회원상태는 정지상태 입니다!</p><br/>
	  </c:if>
      
    </div>
    
    <!--회원정보 - 회원탈퇴 탭  -->
    <div id="menu2" class="tab-pane fade">
      <h3>회원 탈퇴</h3>
      <br/>
      <p>탈퇴를 원하시려면 탈퇴하기 버튼을 클릭하세요.</p>
      <form id="fomout" action="auctionOut" method="get">
      
      </form>
      <button id="btn_out" onclick="test1()" type="button">탈퇴하기</button>
     </div>
    
    </div>
   </div>
   
  </div>
 </div>
   
 
	<script>
	
		$(function(){
			var frm = $('#frm');
			
			$('#btn_update').click(function(){
 				frm.attr('action','myInfo');
				frm.attr('method','post'); 
				frm.submit();
			});
		});
	
	function test1() {
		var result =confirm('탈퇴 하시겠습니까?');
		
		if (result == true) {
			alert('탈퇴!!');
			$('#fomout').submit();
			//location = '/user/logout';
			location = 'auctionOut';
			
			
		} else {
			alert('탈퇴 취소...');
			location = 'cart';
		}
	}
	
	</script>

</body>
</html>