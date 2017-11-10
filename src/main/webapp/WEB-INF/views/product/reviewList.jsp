
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt"
   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="../resources/css/common1.css">
<link rel="stylesheet" type="text/css" href="../resources/css/view1.css">
<title>reviewList</title>

<style>

   #table, #table thead{
      border: 2px solid grey;
      padding: 5px;
   }
   #table tr, #table tr td{
      margin:5px;   
      padding:5px;
   }

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
      .goods_tit_txt1{font-size: 19px;line-height: 21px;margin-bottom: 0px; width:460px;}
      .goods_tit_txt1 a{color: #b56818;}
      .goods_tit_txt1 a:hover{text-decoration:underline;}
      

#goods_pic_main{
text-align:center;
vertical-align:center;
}



.goodImg_Area{position:relative; width:500px;float:left; top:200px; left:300px}
   .goods_pic{width:500px; height:500px; border:solid 1px #ccc; display:block;position:relative; overflow:hidden;background:#fff}
   .goods_pic img{position:absolute;top:0;right:0;bottom:0;left:0;margin:auto;max-height:100%;max-width:100%;}
   .goods_pic_btn{width:100%; margin-top:20px; text-align:center;}

   #s_goods{margin-top:10px; text-align:center;}
   .s_goods_pic{float:left; width:80px; height:80px; margin-left:5px; margin-right:5px; border:solid 1px #ccc; display:block; position:relative; overflow:hidden;}
   .s_goods_pic img{position:absolute;top:0;right:0;bottom:0;left:0;margin:auto;max-height:100%;max-width:100%;}
   .s_goods_pic_btn{float:left; margin-top:31px;}
   .thumImg{margin-top:10px; text-align:center;}


.goodGreadInfor{margin:20px; float:left; width:100%}
   .goodGreadInfor li{font-size:14px;color:#666;line-height: 16px;padding:4px 0}
   .goodGreadInfor .strong{color:#000}
   .goodGreadInfor .deadtime{color:;}
   .goodGreadInfor .deadtimeShort{color:#e43137;}
   .goodGreadInfor .doogst{color:#e43137}
   .goodGreadInfor .pass{font-size: 12px;color:#888}

.goodSeller{
   width:300px;display: inline-block; border-left:1px solid #ddd; padding:10px; margin-top:10px; position:relative;
}

.goodtitleArea2
   {border-bottom:1px solid #ddd;  display: inline-block;padding-bottom:5px;width:100%}

.goods_tit_txt2{font-size: 19px;line-height: 21px;margin-bottom: 0px; width:460px;}   

.star {
    display: inline-block;
    width: 75px;
    height: 13px;
    background: url(http://static.comic.naver.net/staticImages/COMICWEB/NAVER/img/common/sp_star.gif) no-repeat 0 -37px;
    text-align: left;
    vertical-align: middle;
}


.star em {

    display: block;
    background: url(http://static.comic.naver.net/staticImages/COMICWEB/NAVER/img/common/sp_star.gif) no-repeat 0 -59px;
    text-indent: -9999px;
}

</style>

</head>
<body>
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

<div class= "profile" >
<c:forEach items="${ reviewList}" var="vo">
   <ul style="float:left; height:100px; width: 100px">
   
      <li style = "padding: 30px">사진</li>
      <li style = "padding-left: 30px"><input type="hidden" name="" value=""/>${vo.buyer }</li>
   </ul>
   <ul >
      <li><div class="vote_lst" style="display:inline-block" >
      
         <dl class="lt">
         <dt id="topStarLabel"></dt>
            <dd id="topStarSelectbox">
               <div class="pointSelect fl">
                     <a onclick="clickSelector()" href="#" class="default" id="starScoreMenu_1"><span class="star_type4"><span id="topTargetMask" class="mask" style="width:${vo.grade*10}%"><img src="http://static.comic.naver.net/staticImages/COMICWEB/NAVER/img/common/ico_star_n.gif" width="60" height="12" alt="점수선택" class="starscore_star_pic"></span></span></a>
                   
              
                  
                </div>
               <!--  <a href="#" class="btn_bx fl" id="topStarScoreSubmitButton" onclick="clickcr(this,'bdt.starok','','');"  ><span>확인</span></a> -->
            </dd>
            <dd><span><input type="hidden" name=""value=""/>${vo.regdate }</span></dd>
        </dl>       
   
     
        
        <br><br><br>
        
        <!-- grade와 detail값을 넘겨줌 -->
            <textarea rows="4" cols="60" name="detail">${vo.detail }</textarea> 
           <br>                  
          
         
    
   
   </div></li>
   </ul>
   
  </c:forEach>
</div>

   
   <script>
         
    function clickSelector(){
       var display = $('#pointSelectOption').css('display');
               
        if(display=='none'){
           $('#pointSelectOption').css('display','inline-table');
        }else {
           $('#pointSelectOption').css('display','none');
        }
   }//function clickSelector()
            
   function clickcr(p,num){
      var wid=num*10;
   
      $('#pointSelectOption').css('display','none');//drop-down-list 접는다
      $('#topTargetMask').css('width', wid+'%');
      
      $('#grade').val(num);
   }
            

   </script>
</body>
</html>