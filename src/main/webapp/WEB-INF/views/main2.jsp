<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<style>

/* Dropdown Button */
.dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    
}

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
    background-color: #3e8e41;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {display:block;}

html { background: url(images/1.jpg) no-repeat center center fixed; 
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;}
.menubar{
border:none;
border:0px;
margin:0px;
padding:0px;
font: 67.5% "Lucida Sans Unicode", 
"Bitstream Vera Sans", "Trebuchet Unicode MS", 
"Lucida Grande", Verdana, Helvetica, sans-serif;
font-size:14px;
font-weight:bold;
}

.menubar ul{
background: hotpink;
height:50px;
list-style:none;
margin:0;
padding:0;
width:30px;
}

.menubar li{
float:left;
padding:0px;
width:70px;
}

.menubar li a{
background: hotpink;
color:white;
display:block;
font-weight:normal;
line-height:50px;
margin:0px;
padding:0px 25px;
text-align:center;
text-decoration:none;
}

.menubar li a:hover, .menubar ul li:hover a{
background: hotpink;
color:#FFFFFF;
text-decoration:none;
}

.menubar li ul{
background: white;
display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:70px;
z-index:70;
/*top:1em;
/*left:0;*/
}

.menubar li:hover ul{
display:block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}

.menubar li li {
background: hotpink;
display:block;
float:none;
margin:0px;
padding:0px;
width:70px;
}

.menubar li:hover li a{
background:none;
}

.menubar li ul a{
display:block;
height:50px;
font-size:12px;
font-style:normal;
margin:0px;
padding:0px 10px 0px 15px;
text-align:left;
}

.menubar li ul a:hover, .menubar li ul li:hover a{
background: pink;
border:0px;
color:white;
text-decoration:none;
}

.menubar p{
clear:left;
}
      
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Food Market</title>
<script type="text/javascript">
 function keyword_check(){
  if(document.search.keyword.value==''){ //검색어가 없을 경우  
  alert('검색어를 입력하세요'); //경고창 띄움 
  document.search.keyword.focus(); //다시 검색창으로 돌아감 
  return false; 
  }
  else return true;
 }
 
 
 /* When the user clicks on the button, 
 toggle between hiding and showing the dropdown content */
 function myFunction() {
     document.getElementById("myDropdown").classList.toggle("show");
 }

 // Close the dropdown menu if the user clicks outside of it
 window.onclick = function(event) {
   if (!event.target.matches('.dropbtn')) {

     var dropdowns = document.getElementsByClassName("dropdown-content");
     var i;
     for (i = 0; i < dropdowns.length; i++) {
       var openDropdown = dropdowns[i];
       if (openDropdown.classList.contains('show')) {
         openDropdown.classList.remove('show');
       }
     }
   }
 }
 
 
</script>
</head>
<body>
<h1 align="CENTER" style="color:hotpink;"> <!-- h1 사이즈로 내용 출력  -->
Food Auction
</h1>

<div class="span2"></div>
<div class="dropdown" style="float:right; top:20px; right:20px;" >
  <button onclick="myFunction()" class="dropbtn">+</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="#">Join</a>
    <a href="#">Login</a>
    <a href="#">Null</a>
  </div>

<div class="menubar" style="position:fixed; top:50px; left:20px;">
   <ul>
      <li><a href="TeamProject.jsp">|||</a>
      <ul>
      <li><a href="#" id="current">정보</a>
      <li><a href="#">식자재</a></li>
      <li><a href="#">가공품</a></li>
      <li><a href="#">수제</a></li>
      </ul>
      </li>
      
   </ul>
</div>


</div>





<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>





<form name="search" align="center"  
         method = "get"  
         action ="NextFile.jsp" 
         onsubmit="return keyword_check()">
<!-- align : 정렬 , style : 스타일 정보 포함 (margin : 여백 설정) , method : 전달 방식 ,  action : submit 시 이동 경로 ,onsubmit : submit 클릭시 호출 조건 (true 일 때 action으로 넘어감 )-->
<input type="text" name="keyword" align="CENTER"> 

<input type="submit" value="search" align="CENTER">
 
</form>




</body>
</html>