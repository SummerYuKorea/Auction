
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>


<head>
<link rel="stylesheet" type="text/css" href="../resources/css/gstyle1.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/gstyle2.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/gstyle3.css"/>

<meta charset="UTF-8"/>
<title>판매 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>





<style>

.file-drop{
   width: 593px;
   height: 200px;
   border: 1px solid grey;
   overflow:scroll;
   /* overflow-x:hidden; */
}

.forImg{
	border:2px dotted grey; 
	border-radius: 5px; 
	margin:30px; 
	height:140px; 
	width:140px;
	display: inline-block;
}


</style>



</head>
<body>





<!-- /// 상품 등록시작 세션  /// -->
      <section class="login-section">
         <div class="container">
            <div class="cont-title"><!-- 타이틀 시작 -->
               <h2>상품 판매 등록</h2>
               <ul class="list-unstyled">
                  <li><span class="list-icon-line">-</span>아래 항목을 충실히 작성해 주세요. 공란이 있을 경우 상품등록을 할 수 없습니다..</li>
               </ul>
            </div><!-- 타이틀 끝 -->

             <form  action="registerProduct" method="post"><!-- 상품 판매 "이름" 시작  -->
               <div class="login-cont-all">
                  <article class="login-cont"><!-- article 시작 -->
                     <div class="block1">
                        <div class="row">
                           <label for="user_id" class="col-sm-2 control-label lable-title">상품이름 &nbsp;<span style="color: red; font-weight:bold">(*)</span></label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control" id="usrId" name="name" placeholder="상품이름을 입력하세요"  required/>
                           </div>
                        </div>
                     </div><!-- 상품 판매 "이름" 끝  -->
                     
              <!--        <div class="block1">상품 "코드" 시작 
                        <div class="row">
                           <label for="user_pw" class="col-sm-2 control-label lable-title">사진코드</label>
                           <div class="col-sm-9">
                              <input type="text" id="pswd" name="pswd" placeholder="코드 8자리 입력하세요">
                           </div>
                        </div>
                     </div>상품 판매 "코드" 끝 
                      -->
                      
                     <div class="block1"><!-- 상품 판매 "카테고리" 시작 -->
                        <div class="row">
                           <label for="user_pw" class="col-sm-2 control-label lable-title">카테고리 &nbsp;<span style="color: red; font-weight:bold">(*)</span></label>
                           <div class="col-sm-10">
                               <label for ="category"></label>   
                                    <select id = "category" name ="category">
                                       <option value="fresh">쌀/과일/농수축산물</option>
                                       <option value="drink">커피/음료</option>
                                       <option value="healthy">건강/다이어트</option>
                                       <option value="instant">즉석/가공식품</option>
                                    </select>
                              
                           </div>
                        </div>
                     </div><!-- 상품 판매 "카테고리" 끝  -->
                     
                     <div class="block1"><!-- 상품 판매 "수량" 시작  -->
                        <div class="row">
                           <label for="quantity" class="col-sm-2 control-label lable-title">수량 &nbsp;<span style="color: red; font-weight:bold">(*)</span></label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control" id="pswd" name="quantity" placeholder="개수, 무게 등" required>
                           </div>
                        </div>
                     </div><!-- 상품 판매 "수량" 끝  -->
               
                     <div class="block1"><!-- 상품 판매 "사진" 시작 -->
                        <div class="row">
                           <label for="user_pw" class="col-sm-2 control-label lable-title">상품 사진 등록 &nbsp;<span style="color: red; font-weight:bold">(*)</span></label>
                           <div class="col-sm-8">
                              
                      <!-- Ajax를 이용한 파일 업로드 -->
                            <div class="form-control file-drop" id="pswd">
                            
                            	<div class="forImg picImg" >
                            		<!-- 사진검색 우측 하단 버튼 -->
									<img alt="사진 등록"  src="../resources/images/pic.png" width="50px" style="margin:43px;">
								</div>
								
								<!-- <div class="forImg">
                            		<img alt="한결" src="../resources/images/paris.jpg" width="137px" height="137px" >
                            	</div> -->
                            
                            </div>
                           </div>
                        </div>
                     </div><!-- 상품 판매 "사진" 끝  -->
                     <div id="di"></div>
                     
                   
                   <div class="block1"><!-- 상품 판매 "시작가" 시작  -->
                        <div class="row">
                           <label for="start_price" class="col-sm-2 control-label lable-title">시작가 &nbsp;<span style="color: red; font-weight:bold">(*)</span></label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control" id="pswd" name="start_price" placeholder="입찰 시작 가격을 입력하세요." required>
                           </div>
                        </div>
                     </div><!-- 상품 판매 "시작가" 끝  -->
                     
                   
                     
                     <div class="block1"><!-- 상품 판매 "즉시판매가" 시작  -->
                        <div class="row">
                           <label for="user_pw" class="col-sm-2 control-label lable-title">즉시판매가 &nbsp;<span style="color: red; font-weight:bold">(*)</span></label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control" id="pswd" name="immediate_price" placeholder="즉시판매 가격을 입력하세요." required>
                           </div>
                        </div>
                     </div><!-- 상품 판매 "즉시판매가" 끝  -->
                     
                     
                    <div class="block1"><!-- 상품 판매 "입찰시작시간" 시작  -->
                        <div class="row">
                           <label for="" class="col-sm-2 control-label lable-title">입찰시작시간</label>
                           <div class="col-sm-10">
                              <input type="datetime-local" id="pswd" name="" placeholder="입찰 시작 시간 입력. 공란일 경우 상품등록과 함께 입찰 시작">
                           </div>
                           
                        </div>
                     </div><!-- 상품 판매 "제품등록날짜" 끝  -->
                     
                     
                     <div class="block1"><!-- 상품 판매 "마감날짜" 시작  -->
                        <div class="row">
                           <label for="closed_time" class="col-sm-2 control-label lable-title">입찰마감시간</label>
                           <div class="col-sm-10">
                              <input type="datetime-local" id="pswd" name="dead_line" placeholder="입찰 마감 시간 입력">
                              	<!-- 원래 closed_time으로 넘겨주는데 그렇게하면 못받아들임 Date타입 property에 set을 못함  ㅉㅉ-->
                           </div>
                           
                           
                        </div>
                     </div><!-- 상품 판매 "마감날짜" 끝  -->            
                  
             
                     
                      <div class="block1"><!-- 상품 판매 "상세정보" 시작  -->
                        <div class="row">
                           <label for="user_pw" class="col-sm-2 control-label lable-title">상세정보</label>
                           <div class="col-sm-10">
                              <textarea  id="pswd" name="detail" placeholder="상품의 상태, 상품의 출처 등(200자 미만)" style="width:600px; height:250px"></textarea>
                           </div>
                        </div>
                     </div><!-- 상품 판매 "상세정보" 끝  -->      
                     
                       
                  </article><!-- article 끝 -->
               </div>
               
               
               <div class="btn-area"><!-- 등록하기 버튼 -->
                  <button type="submit" class="btn btn-primary btn-block btn-login" id="login_btn">등록하기</button>
               </div><!-- 등록하기 버튼  요까이~ -->
               
               
               <input type="hidden" name="img" id="img" />
            </form>
            </div>
      </section>
         
      <!-- /// 상품 등록 세션 끝 /// -->
      
 
      
      
            


<script>

// 그림올라오면 효과주기



 $(document).ready(function(){
	 
		var picImg=$('.picImg');
		$('.picImg').on('dragenter mouseenter', function() {
			picImg.css('border','3px dotted blue');
	    });
		$('.picImg').on('mouseout dragleave', function() {
			picImg.css('border','2px dotted grey');
	    });
	
	 
	 
    // 파일을 끌어다 놓을 때 (drag & drop)
    // 브라우저가 파일을 자동으로 열어주는 기능을 막음 (기본적으로 브라우저가 동작을 한다.)
     
    $('.file-drop').on('dragenter dragover', function(event) {
       event.preventDefault();       
    });
    
    //drop 부분에서 한 가지 동작을 더 추가할 것이다. ajax 방식으로 파일을 업로드 하는 기능까지 추가!
    $('.file-drop').on('drop', function(event){
       
       // drop 이벤트의 기본 동작을 막음
       event.preventDefault();
       
       // Ajax를 이용해서 서버로 파일을 업로드
       // multipart/form-data 타입으로 파일을 업로드하기 위해서 
       var formData = new FormData();
       
       // drop한 파일들에 대한 정보 가져오기.
       var files = event.originalEvent.dataTransfer.files;  //event라는객체내에 originalEvent객체내에 dataTranfer객체내에 files라는 배열객체..?
       var i = 0;
       for (i = 0; i < files.length; i++){
          console.log("잉->"+files[i]);
          console.log("잉2->"+files[i].originalFileName);
       
          // 이제 이 파일 정보들을 formData에 넣는다. 서버에 보내기 위해서임.
          // 'files' 라는 이름으로 모든 파일들을 append 하기 
         formData.append('files', files[i]);
          
          
          
          // formData가 완성이 되었으니, 서버로 보내기.
          // 제이쿼리 라이브러리가 포함되어있어야 $ 포함된 함수 쓸 수 있음! 에이작스!
          
          
          $.ajax({
             type: 'post',
             url: '/auc/upload-ajax',
             data: formData, 
             dataType: 'text',
             processData: false,
             contentType: false,
             /* 
             form의 enctype 속성을 기본값인 "application/x-www-form-urlencoded"을 사용하지 않고,
             "multipart/form-data"를 사용하기 위해서 반드시 주어야 할 속성은
             dataType: text, processData, contentType: false
             
             processType: true이면 enctype이 기본값이 되기 때문에 반드시 false라고 주어야 한다.
             */
             success: function(data){
                //alert(data);
                
                var str = $('.file-drop').html(); //이렇게 하면 파일이 밑에 계속 추가될 것.
                str += '<div class="forImg">' 
                      + '<img src= "http://localhost:8181/auc/display?fileName='
                      + data
                      + ' " width="136px" height="136px"/>'
                      + '</div>';
                $('.file-drop').html(str);     
                
              				
                var img=$('#img').val();
                console.log("value: "+img);
                var filename=data.substring(data.lastIndexOf("/s_") + 3);  // /s_이후의 묹자열=filename 받아오기
                console.log("filename->"+filename);
                img= img+"="+filename;
                $('#img').val(img);
	 						 					
                                         
             } //end success
          }); //end ajax
          
       }//end for(i)
        
    });
    
 });
</script>
 



      
</body>
</html>