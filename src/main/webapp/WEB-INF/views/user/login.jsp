<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>


<head>
<link rel="stylesheet" type="text/css" href="../resources/css/gstyle1.css"/> 
<link rel="stylesheet" type="text/css" href="../resources/css/gstyle2.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/gstyle3.css"/>

<meta charset="UTF-8"/>
<title>판매 정보</title>
<!-- jQuery CDN 포함: 라이브러리 포함 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>





<style>


#container {
float: left;
position: relative;
left: 40%
}

.file-drop{
   width: 100%;
   height: 200px;
   border: 1px solid grey;
}



</style>





</head>
<body>


      
         <div id="container">
      
         <div class="login">
        <h2><img src="../resources/images/A_login_01.gif"></h2>
        <p><img src="../resources/images/A_login_02.gif"></p>
        
   <!--    <legend>회원로그인</legend> -->
            <form id="form">
            <label class="id"><input name="id" class="form-control" id="member_id" onfocus="this.style.backgroundImage='';" style="background-repeat: no-repeat; background-position: 8px 12px; width: 346px; height: 40px;"  fw-filter="isFill" fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="ID" value="" type="text"></label></br>
            <label class="password"><input name="pw" class="form-control" id="member_passwd" onfocus="this.style.backgroundImage='';" style="background-image:url('#');background-repeat:no-repeat;background-position:8px 11px; width: 346px; height: 40px;"  fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="패스워드" placeholder="PASSWORD" fw-msg="" value="" type="password"></label></br>
            </form></br>
            
            <a href="#none" id="btn_login" type="button" onclick="auctionLogin()"><img src="../resources/images/D_login_button.gif" alt="로그인"></br></a></br>
            <a href="../user/registerUser"><img src="../resources/images/E_register.gif" alt="회원가입"></br></a></br>
            
            <div class="fblogin pdt10">
                <a href="#none" onclick="FBLogin('member_form_7349115596');"><img src="../resources/images/F_facebook.gif" alt="페이스북 로그인"></br></a></br>
            </div>
            
            <div class="fblogin pdt10">
                <a href="#none" onclick="window.open('/Api/Member/Oauth2ClientLogin/naver/', '', 'toolbar=no location=no scrollbars=yes resizable=yes width=800 height=500'); return false;"><img src="../resources/images/login_naver.jpg" alt="네이버 로그인"></br></a></br>
            </div>
            
            <div class="fblogin pdt10">
                <a href="#none" onclick="window.open('/Api/Member/Oauth2ClientLogin/kakao/', '', 'toolbar=no location=no scrollbars=yes resizable=yes width=800 height=500'); return false;"><img src="../resources/images/login_kakao.jpg" alt="카카오 로그인"></br></a>
            </div>
            
            <ul>
            <li><a href="/member/id/find_id.html"><img src="../resources/images/G_id_search.gif" alt="아이디찾기"></a></li>
               <li><a href="/member/passwd/find_passwd_info.html"><img src="../resources/images/H_password_search.gif" alt="비밀번호찾기"></a></li>
            </ul>
         
         <p class="security">
                                <img src="//img.echosting.cafe24.com/design/skin/default/member/ico_access.gif" alt="보안접속"> 보안접속 </p>
            <p class="sns displaynone">
                <a href="#none" onclick=""><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_google_login.gif" alt="구글 로그인"></a>
            </p>
            
                     

      </div>
        </div>
 
      
      <script>
    /*   $(function(){
         
         
      }); */
      
         function auctionLogin(){
         var frm = $('#form');
         
        
            frm.attr('action','login-post');
            frm.attr('method','post'); 
            frm.submit();
         }
      </script>
      
</body>
</html>