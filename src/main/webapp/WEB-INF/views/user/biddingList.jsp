<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Cart</title>
<style>
#menu {
	list-style-type: none;
}
#main {
	display: inline-block;
	margin: 20px;
	position: relative;
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
<!-- Bootstrap 최신 버전의 css 파일들을 링크 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

</head>


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
	<h1>입찰 목록</h1>
	<table>
		<thead>
			<tr>
			    <td> <label><input id="cb_all" type="checkbox" /></label></td>
				<td> 상품이미지</td>
				<td> 상품정보( 이름 / 현재가 / 시작가 )</td>
				<td> 수량</td>
				<td> 상품금액</td>
				<td> 판매자</td>
				<td> 배송비</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${userBiddingList}" varStatus="status">
				
				<tr>
				    <td><input class="cb" id="${vo.contract_price}" name="${vo.delivery}" type="checkBox" />${vo.code}</td>
				    <td><img alt="파리saaass" src="${vo.img }"
            width="150px" height="100px" /></td>
					<td>${vo.name} / ${vo.contract_price} / ${vo.start_price}</td>
					<td><a class="goToDetail" href="#">${vo.quantity}</a></td>
					<td>${vo.contract_price}</td>
					<td>${vo.seller}</td>
					<td>${vo.delivery}</td>
				</tr>
				
			</c:forEach>
			
		</tbody>	
	</table>
	</div>
	<br/>
</div>	
	<!--
	<div>
		<div>
			<p>
			상품금액 : <b id="price">0</b>원 <span class="glyphicon glyphicon-plus-sign"></span>
	 		배송비: <b id="deliver_price">0</b>원  <br/>
	  		결제금액 :<b id="total_price">0</b>원
	  		</p>
	  	</div>
   	
		<br/>
		
		<div class="btn">
			<button class="btn_buy">구매하기</button>
		</div>
  	</div>
	
	 3자릿수마다 콤마 넣는 JSTL 코드 
	<br/><br/>
	<c:set var = "balance" value = "12312313213" />
	<p>
	<fmt:formatNumber type = "number" 
         pattern = "#,###" value = "${balance }" />
    </p> -->
    
	<hr>
	<a href="login">로그인</a>
	
	<script>
		$(document).ready(function() {
			$('.btn_buy').click(function(){
				// 구매하기 버튼 클릭시 결제페이지로 결제금액 데이터를 넘겨야 함
				
			});
				
			$('#cb_all').click(function(){
				
				if ($('#cb_all').prop('checked')) {
					$('.cb').prop('checked', true);
				} else {
					$('.cb').prop('checked', false);
				}
				
				func1();
			});//all이 클릭되었을때
			$('.cb').click(func1);
		
			
			function func1(){
				
					var num=1;
			        var price=0;
			        var deliver_price =0;
			        var price_text="";
			        $('.cb').each(function(index){
			                             
			               if($(this).prop('checked')==false){
			                  num=0;
			                 // break;
			               }
			               
			               if($(this).prop('checked')){
			            	   price+=(parseInt)($(this).attr('id'));
			            	   deliver_price+=(parseInt)($(this).attr('name'));
			               }
			            
			         });
			             if(num==1){
			               $('#cb_all').prop('checked', true);
			             } else {
			            	 
			                $('#cb_all').prop('checked', false);
			             }
			             
			             //console.log(price + "")
			             //console.log(deliver_price + "")
			             
			         $('#price').text(price);                       // 상품금액
			         $('#deliver_price').text(deliver_price);       // 배송비
			         $('#total_price').text(price + deliver_price); // 결제금액
			     				
			}
		});
	</script>
</body>
</html>