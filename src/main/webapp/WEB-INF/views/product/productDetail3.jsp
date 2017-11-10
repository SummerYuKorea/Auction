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
   .form-login{
      background:white;
      width:60%;
      padding:20px;
      margin:auto;  /*마진을 자동으로 줘서 가운데정렬됨(?)*/
   }
</style>
</head>
<body>
<%-- header 파일(jspf)을 include --%>
	<%@ include file="header.jspf" %>

<h1>즉시 구매하기</h1>
      
  <div>
  <a href="biddingList?code=${product.code }"><button type="button"  id="biddingList">입찰 기록</button></a><br/><br/>
  
     <table border="1">
      <tr>
         <th colspan="5">상품 정보</th>
    
      </tr>
            <tr>
         <th>상품 사진</th>
         <th>상품 코드</th>
         <th>상품 이름</th>
         <th>상품 상태</th>
         <th>시작가</th>
         <th>입찰가</th>
         <th>입찰자수</th>
         <th>수량</th>
         
                
      </tr>

      <tr>
     <!--  <form> -->
             <td>
         <img alt="상품" src="/auc/resources/images/images.jpg"
            width="300px" height="200px" /></td>
            <td><input type="hidden" name="code"/>${product.code }</td>
              <td><input type="hidden" name="name" />${product.name }</td>
              <td><input type="hidden" name="detail"/>${product.detail}</td>
              <td><input type="hidden" name="start_price"/>${product.start_price }</td>
              <td><input type="hidden" name="contract_price"/>${product.contract_price }</td>
              <td><input type="hidden" name="bidders"/>${product.bidders}</td>
              <td>
<%--               <input type="hidden" name="quantity"value="${quantity }"/><select id = "category" name ="category">
         <!--   </form> -->
         <option>1개</option>
         <option>2개</option>
         <option>3개</option>
         <option>4개</option>
         <option>5개</option>
         <option>6개</option>
         <option>7개</option>
         <option>8개</option>
         <option>9개</option>
         <option>10개</option>
         
      </select> --%>
              </td>
                      
       </tr>
 

   </table>

  </div>

  <input type = "submit" value ="구매"/>
  <input type = "submit" value ="찜하기"/>
  <input type = "submit" value ="장바구니"/>
  
   <form action="bidding" method="post">
   		<input type="hidden" name="product_code"  value="${product.code }"/>
   		<%-- <input type="hidden"  name="user_id" value="${login_id }"/> --%>
           <input type="text" name="price"  placeholder="입찰 가격을 입력하세요" />
           <input type="submit" id="btn_add" value="입찰하기"/> 
    </form>
  
  <%-- footer 파일(jspf)을 include --%>
	<%@ include file="footer.jsp" %>
  
  <script>
  	$(document).ready(function(){
  		$('#biddingList').click(function(){
  			
  		});
  	});
  </script>

</body>
</html>