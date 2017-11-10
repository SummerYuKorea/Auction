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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>





<style>

.file-drop{
   width: 100%;
   height: 200px;
   border: 1px solid grey;
}



</style>



</head>
<body>

<!--       
   
 Ajax를 이용한 파일 업로드
   
<div class="file-drop"  >사진 등록</div>   
<div class="upload-list"></div>


<script>
 $(document).ready(function(){
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
       var files = event.originalEvent.dataTransfer.files;
       var i = 0;
       for (i = 0; i < files.length; i++){
          console.log(files[i]);
       
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
                alert(data);
                
                var str = $('.upload-list').html(); //이렇게 하면 파일이 밑에 계속 추가될 것.
                str += '<div>' 
                      + '<img src= "/auc/display?fileName='
                      + data
                      + ' "/>'
                      + data
                      + '</div>';
                $('.upload-list').html(str);                   
                                         
             } //end success
          }); //end ajax
          
       }//end for(i)
        
    });
    
 });
</script>
      <input type = "submit" value ="등록"/>
</form> -->





<!-- /// 상품 등록시작 세션  /// -->
      <section class="join-section">
         <div class="container">
            <div class="cont-title"><!-- 회원정보 타이틀 시작 -->
               <h2>회원가입</h2>
               <!-- <ul class="list-unstyled">
                  <li><span class="list-icon-line">-</span>아래 항목을 충실히 작성해 주세요. 공란이 있을 경우 상품등록을 할 수 없습니다..</li>
               </ul> -->
            </div><!-- 회원정보 타이틀 끝 -->

             <form id="fom_join" action="registerUser" method="post"><!-- 회원가입 "아이디" 시작  -->
               <div class="login-cont-all">
                  <article class="login-cont"><!-- article 시작 -->
                     <div class="block1">
                        <div class="row">
                           <label for="id" class="col-sm-2 control-label lable-title">회원 ID</label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 5자이상 입력하세요"  required>
                           </div>
                           <div id="result"></div>
                        </div>
                     </div><!-- 회원가입 "아이디" 끝  -->
                     
                     
                     <div class="block1"><!-- 회원가입 "비밀번호" 시작  -->
                        <div class="row">
                           <label for="pw" class="col-sm-2 control-label lable-title">비밀번호</label>
                           <div class="col-sm-10">
                              <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호 8자리 입력하세요" required>
                           <div id="result1"></div>
                           </div>
                        </div>
                     </div><!-- 회원가입 "비밀번호" 끝  -->
                     
                     <div class="block1"><!-- 회원가입 "비밀번호 확인" 시작  -->
                        <div class="row">
                           <label for="pw2" class="col-sm-2 control-label lable-title">비밀번호 확인</label>
                           <div class="col-sm-10">
                              <input type="password" class="form-control" id="pw2" name="pw2" placeholder="비밀번호 다시 입력하세요" required>
                           <div id="result2"></div>
                           </div>
                        </div>
                     </div><!-- 회원가입 "비밀번호 확인" 끝  -->
                     
                     
                     <div class="block1">
                        <div class="row">
                           <label for="name" class="col-sm-2 control-label lable-title">회원 이름</label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control" id="name" name="name" placeholder="회원이름을 입력하세요" value="" required>
                           </div>
                        </div>
                     </div><!-- 회원가입 "회원이름" 끝  -->

                     
                     <div class="block1">
                        <div class="row">
                           <label for="phone" class="col-sm-2 control-label lable-title">휴대전화번호</label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력하세요" value="">
                           </div>
                        </div>
                     </div><!-- 회원가입 "휴대전화번호" 끝  -->
                     
                     
                     <div class="block1">
                        <div class="row">
                           <label for="email" class="col-sm-2 control-label lable-title">E-mail</label>
                           <div class="col-sm-10">
                              <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" value="">
                           </div>
                        </div>
                     </div><!-- 회원가입 "이메일" 끝  -->
                    
                     
                     <div class="block1">
                        <div class="row">
                           <label for="address" class="col-sm-2 control-label lable-title">받을 주소</label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control" id="address" name="address" placeholder="주소를 입력하세요.">
                           </div>
                        </div>
                     </div><!-- 회원가입 "받을 주소" 끝  -->
                     
          
                  </article><!-- article 끝 -->
               </div>
               
               
               <div class="btn-area" ><!-- 등록하기 버튼 -->
                  <a type="button" class="btn btn-primary btn-block btn-login" id="join_btn" style="width:1040px; margin:20px;">회원가입</a>
               </div>
             <!--   <div class="btn-area" style="float:left; margin-left:95px"> 등록하기 버튼
                  <a role="button" class="btn btn-primary btn-block btn-login" id="login_btn">수정</a>
               </div>
               <div class="btn-area" style="float:left; margin-left:95px">등록하기 버튼
                  <a role="button" class="btn btn-primary btn-block btn-login" id="login_btn">삭제</a>
               </div> -->
               
               
               <!-- 등록하기 버튼  요까이~ -->
             </form>
      </section>
      
      <!-- /// 상품 등록 세션 끝 /// -->
      
      
      <script>
		$(function() {
			$('#id').keyup(function() {
				// 아이디 5 ~ 20자 일때 //사용 가능한 아이디 입니다!//뜸
				if($('#id').val().length >= 5 && $('#id').val().length <= 20) {
					$.ajax({
						type: 'get',
						url: 'checking-id',
						data: {id: $('#id').val()},
						success: function(res, status, xhr) {
							if (res === 'valid') {
								$('#result').html('사용 가능한 아이디 입니다!');
								$('#result').css('color', 'green');
								$('#btn-submit').prop('disabled',false)
							} else {
								$('#result').html('이미 사용중이거나 탈퇴한 아이디입니다.');
								$('#result').css('color', 'red');
								$('#btn-submit').prop('disabled',true)
							}
						}
					});
				} else {
					$('#result').html('5~20자 입니다.');
					$('#result').css('color', 'red');
				} // end if() 
			});
					
			$('#pw').keyup(function() {
					// 패스워드 4자 이상 //사용 가능한 아이디 입니다!//뜸
				if($('#pw').val().length >= 8 && $('#pw').val().length <= 20) {
						$.ajax({
							type: 'post',
							url: 'checking-id',
							data: {pw: $('#pw').val()},
							success: function(res, status, xhr) {
								if (res === 'valid') {
									$('#result1').html('8자 이상 입니다!');
									$('#result1').css('color', 'green');
									$('#btn-submit').prop('disabled',false)
								} else {
									$('#result1').html('패스워드가 짧습니다.');
									$('#result1').css('color', 'red');
									$('#btn-submit').prop('disabled',true)
								}
							}
						});
				} else {
					$('#result1').html('패스워드가 너무 짧습니다.');
					$('#result1').css('color', 'red');
				} // end if()  
					
			});
			
			$('#join_btn').click(function(){
				if($('#pw').val() == $('#pw2').val()){
					//$('#result2').html('패스워드 확인 ');
				    //$('#result2').css('color', 'green');
				    if($('#id').val().length >= 5 && $('#id').val().length <= 20 && $('#pw').val().length >= 8 && $('#pw').val().length <= 20){
				    	//$('#result2').html('확인 ');
				    	$('#fom_join').submit();
					} else {
						//$('#result2').html('노확인 ');
						$('#result2').html('아이디나 패스워드길이를 확인해주세요. ');
					}
				    
				} else {
					 $('#result2').html('패스워드를 다시 한번 확인해주세요.');
					$('#result2').css('color', 'red'); 
				}
			});
		
		});
			
	</script>
</body>
</html>