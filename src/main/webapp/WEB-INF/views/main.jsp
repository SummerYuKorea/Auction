<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@   taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">

<!--  Bootstrap 최신 버전의 CSS 파일들을 링크 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- jQuery CDN 포함: 라이브러리 포함  -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/headerstyle1.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/gstyle1.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/gstyle2.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/gstyle3.css"/> 
<style>


   #search, h1{
         text-align: center;
   }
 
 #header ul li{
 list-style:none;
}
  

.logosection ul li{
 list-style:none;
}

.top{
   font-family: '돋움','Dotum';
    font-size: 13px;
    
    
}

.gnb{
 float:left; padding-left:300px;
}

.logosection{
   position: relative;
   top: 80px;
}

h1{
   text-align:center
}



</style>
</head>
<body>
<header id="top">
<div id="hdWrap">
   <div id="header">
        <div class="util">
            <div class="wrapper">
                <ul>
               <li class="first"><a href="/auc"><img src="resources/images/icon_home.png" style="margin-top: 9px;"></a></li>
               <li><a href="user/login">log-in</a></li>
               <li class="join"><a href="user/registerUser">join us</a></li>
               <li><a href="user/cart">cart</a></li>
                    <li><a href="user/buyList">order</a></li>
                    <li><a href="user/mypage">my page</a></li>
                    
                    
                    <li class="search">               
                        <div class="sch">
                            <form action="" method="post" ><fieldset>
                                    <a href=""><input type="image" src="resources/images/btn_search.png" class="btn-sch" alt="상품 검색" title="상품 검색" style="width:25px; height:25px"></a>
                                    <input name="search" onkeydown="CheckKey_search();" value="" class="MS_search_word keyword">
                                </fieldset>
                             </form> 
                        </div>
               </li>
                </ul>
            </div>
        </div>
</div>
</div>
</header>


    
            <div class="logosection">
              <h1><a href="/"><img src="resources/images/Logo.png" alt="로고"></a></h1>     
            </div>
    
   


   <br/><br/><br/><br/><br/><br/><br/><br/>
   <div class="container">
<form id="search" action="product/productList"><!-- 상품 판매 "이름" 시작  -->
             
                     <div class="block1">
                        <div class="row">
                     
                           <label for="user_id" class="col-sm-2 control-label lable-title">
                           
                           <select id = "category" name ="category" style="width:150px; height:33px; border-width:1px; border-radius:5px; border-color:#800000; background-color: #ffffff; 
                               box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);">
                             <option value="all" >========전체=======</option>
                              <option value="fresh" >쌀/과일/농수축산물</option>
                           <option value="drink" >커피/음료</option>
                             <option value="healthy" >건강/다이어트</option>
                           <option value="instant" >즉석/가공식품</option>
                      </select></label>
                           <div class="col-sm-8">
                              <input type="text" class="form-control" id="usrId" name="name" placeholder="상품이름을 입력하세요" value="" required>
                           </div>
                           <button type="submit" class="btn btn-primary btn-block btn-login"  id="login_btn" style="width:150px; background-color: #800000; border-color: #800000;">검색하기</button>
                            
 </div>
 
 </div>
 </form>
 </div>
                      
 
   
   <form action="user/login" style="display: none" id="loginFrm"></form>
   <form action="product/productList" style="display: none" id="categoryFrm"></form>
   <form action="product/registerProduct" style="display: none" id="regisPrFrm"></form>
   
 
    <button type="button" id="categoryBtn">카테고리</button>
   
   <button type="button" id="regisPrBtn">상품 등록</button>
   <button type="button" id="loginBtn" class="btn btn-primary btn-sm">로그인</button>
   
    <!-- about User -->
   <c:if test="${not empty login_id }">
   not empty: not null && 빈 문자열("") 아님
   ${login_id }님, 환영합니다!<br/>
   <button id="btn_logout" type="button">로그아웃</button>
   </c:if>
   
   <c:if test="${empty login_id }">
      <form action="user/login-post" method="post">
         <input type="text" name="id" placeholder="USER ID" required autofocus />
         <input type="password" name="pw" placeholder="PASSWORD" required />
         <input type="submit" value="로그인"/>
      </form>
   </c:if> 
 
 <!--
<table style="margin:20px; width:350px;">
   <tr>
                     <th>
                           <button type="submit" class="btn btn-primary btn-block btn-login" id="categoryBtn" style="width:150px; background-color: #800000;border-color: #800000;">카테고리</button>
                           </th>
                           <th>
                           <button type="submit" class="btn btn-primary btn-block btn-login" id="regisPrBtn" style="width:150px; background-color: #800000; border-color: #800000;">상품 등록</button>
                           </th>
</table>   
    <button type="button" id="loginBtn" class="btn btn-primary btn-sm">로그인</button> -->
   
   <hr/>

   
   <script>
   $(document).ready(function(){
         
         $('#categoryBtn').click(function(){
            $('#categoryFrm').submit();
         });
         
         $('#loginBtn').click(function(){
         
            $('#loginFrm').submit();
         });
         
         $('#regisPrBtn').click(function(){
            
            $('#regisPrFrm').submit();
         });
      });
   
   
   if ('${login_fail}' === 'fail') {  //controller의 loginPost메소드를 interceptor에서 낚아채서 select결과 null일 경우 fail삽입
      // 로그인 실패 정보가 서버로부터 전달됨
   //   alert('아이디 또는 비밀번호가 일치하지 않습니다!');
   }
   
   $('#btn_logout').click(function() {
      // 콘트롤러 메소드에 매핑된 URL 호출
      location = 'user/logout';
   });
   </script>
   
</body>

</html>