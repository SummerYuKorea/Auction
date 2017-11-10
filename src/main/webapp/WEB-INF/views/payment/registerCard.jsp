<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <style>
.cardnumber {
width:20px;
}
</style> -->
<meta charset="UTF-8">
<title>Food auction</title>
</head>
<body>

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

<h2>지불 세부 정보</h2>



 <form id="card" action="product/productList">
 
 <label>성(영문) <br/></label>
<input type="text" name="lastname" required autofocus/> <br/>
<label>이름(영문) <br/></label>
<input type="text" name="firstname" required /> <br/>

<label>카드 종류 <br/></label>
 
       <select id = "category" name ="category">
          <option value="all">카드종류</option>
              <option value="american">American Express</option>
              <option value="bc">BC Card</option>
              <option value="diner">Diner's Club International</option>
              <option value="jcb">JCB</option>
              <option value="master">Master Card</option>
              <option value="visa">Visa</option>
         </select>
   </form>
   
 
 <form id="expire" action="product/productList">
 
 
  <label>카드 번호 <br/></label>
  

 <input type="text" name="cardnumber" maxlength="4" size="1" required />-
 <input type="password" name="cardnumber" maxlength="4" size="1" required />-
 <input type="text" name="cardnumber" maxlength="4" size="1" required />-
 <input type="password" name="cardnumber" maxlength="4" size="1" required />


 <br/>
 
 
 <label>보안 코드 <br/></label>
 <input type="text" name="code" maxlength="4" size="1" required /> <br/>

 
 <label>유효기간 <br/></label>
       <select id = "category" name ="category">
          <option value="all">월</option>
              <option value="01">01</option>
              <option value="02">02</option>
              <option value="03">03</option>
              <option value="04">04</option>
              <option value="05">05</option>
              <option value="06">06</option>
              <option value="07">07</option>
              <option value="08">08</option>
              <option value="09">09</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>
              
         </select>
         
          <select id = "category" name ="category">
          <option value="all">연도</option>
              <option value="2017">2017</option>
              <option value="2018">2018</option>
              <option value="2019">2019</option>
              <option value="2020">2020</option>
              <option value="2021">2021</option>
              <option value="2022">2022</option>
              <option value="2023">2023</option>
              <option value="2024">2024</option>
              <option value="2025">2025</option>
              <option value="2026">2026</option>
              <option value="2027">2027</option>
              <option value="2028">2028</option>
              <option value="2029">2029</option>
              <option value="2030">2030</option>
         </select>
          
           <br/>
   <input type="submit" value="카드등록" />
 
   </form>
   



</body>
</html>