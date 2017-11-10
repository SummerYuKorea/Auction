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

   
.productphoto{
   float:left;
   margin:5px;
   border: 2px solid grey;
   width : 300px;
   height : 200px; 
}

.productphoto:hover{
   border: 4px solid black;
}

.list {
   margin:50px;
   text-align: center;
}
.contents {
    float: left;
    width: 940px;
    position: relative;
}





</style>




</head>
<body>





<div ><!-- class="list"> -->

		<%-- header 파일(jspf)을 include --%>
  	 	<%@ include file="header.jspf" %>
   	    <%@ include file= "nav.jspf" %>

<section id="main">

<h2>카테고리</h2>




<table border="1">
<tr>
   <th>상품 이미지</th>
     <th>상품명</th>
     <th>카테고리</th>
     <th>가격</th>
     <th>상품정보</th>
</tr>
<c:forEach items="${productList}" var="product">

<form action="productDetail" method="get">
	<input type="hidden" name="code" value="${product.code}"/>
	<%-- <input type="hidden" name="closed_time" value="${product.closed_time}"/> --%>  <!-- ★★★ 질문//Spring03에 ReplyRESTController보면 되는데// 얘때문에 그냥 code로 다시 ProductVO select해오기로.-->
	<input type="hidden" name="name"  value="${product.name }"/>
	<input type="hidden" name="category" value="${product.category}"/>
	<input type="hidden" name="contract_price" value="${product.contract_price}"/>
	<input type="hidden" name="detail" value="dd"/>
	<input type="hidden" name="start_price" value="${product.start_price}"/>
   <tr>
      <td>
         <img alt="파리" src="/auc/resources/images/paris.jpg"
            width="300px" height="200px" /></td>
        <td>${product.name }</td>
        <td>${product.category}</td>
        <td> ${product.contract_price }</td>
        <td>${product.detail }</td>
        <td><input type="submit" value="구매" /></td>
    </tr>
 </form>
</c:forEach>
</table>

</section>



      <%-- footer 파일(jspf)을 include --%>
   <%@ include file="footer.jsp" %>
   

</div> <!-- div id=list -->

</body>
</html>