<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8"/>
<title>판매 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.file-drop{
   width: 100%;
   height: 200px;
   border: 1px solid grey;
}
div{
border : 1px solid black;
}
</style>

</head>
<body>

<h1> 판매 정보 </h1>   
<form action="ragistration" method="post">
		<label for ="name"> 상품 이름</label>
		<input type ="text" name = "name"  id="name"  placeholder="상품 이름" required autofocus/>
		<br/>
		<label for ="code">상품 코드</label>
		<input type ="text" name = "code" id="code" placeholder="상품 코드" />
		<br/>
		<label for ="number">가격입력</label>
		<input type = "number" name = "price"  id="price" placeholder="가격 입력" required autofocus/>
		<br/>
		<label for ="immediate_price">즉시 판매가</label>
		<input type = "number" name = "immediate_price" id="immediate_price" placeholder="즉시 판매가" required autofocus/>
		<br/>
		<label for ="quantity">수량</label>
		<input type ="number" name ="quantity" id="quantity" placeholder="수량" required autofocus>
		<br/>
		<label for ="category">카테고리</label>	
		<select id = "category" name ="category">
			<option value="fresh">쌀/과일/농수축산물</option>
       	 	<option value="drink">커피/음료</option>
       	 	<option value="healthy">건강/다이어트</option>
       	 	<option value="instant">즉석/가공식품</option>
		</select>
		<!-- <input type ="text" name ="category" placeholder="카테고리" required autofocus> -->
		<br/>
		<label for ="closed_time">마감 날짜</label>
		<input type ="date" name = "closed_time" id="closed_time" placeholder="마감 날짜" required autofocus/>
		<br/>
		<label for ="detail">상품 상태</label>
		<br/>
		<textarea name="detail" id="detail" placeholder="상품 상태" required autofocus></textarea>
		<!-- <input type ="text" name = "detail" id="detail" placeholder="상품 상태" required autofocus/> -->
		<br/>
		
		
	
 <!-- Ajax를 이용한 파일 업로드 -->
   
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
</form>

</body>
</html>




