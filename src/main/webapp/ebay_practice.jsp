<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<script language="JavaScript"> 
function clock() { 
   var time = new Date() 
   
   
   var hour = time.getHours() 
   var minute = time.getMinutes() 
   var second = time.getSeconds() 
   var store = " "  
        
   store += ((hour > 12) ? (hour - 12) : hour) 
   store += ((minute < 10) ? ":0" : ":") + minute 
   store += ((second < 10) ? ":0" : ":") + second 
   store += (hour >= 12) ? " PM" : " AM" 
        
   document.time.clock.value = store     
   setTimeout("clock()", 1000) 
}

//카운트 다운 스크립트 시작
var hhVal = 0;
var mmVal = 0;
var ssVal = 0;
var cFlag = "Y";
function setMinute(){
    cFlag = "Y";
    document.tForm.hhVal.value="";
    document.tForm.mmVal.value="";
    document.tForm.ssVal.value="";
    
    var minVal = document.tForm.minVal.value;
    
    //시간
    if( minVal/60 > 1){
        hhVal =  Math.floor(minVal/60);
        mmVal = (minVal)%60;    
        ssVal = 0;
    //분
    }else{
        mmVal = minVal; 
        ssVal = 0;
    
    }
    setTimeOn();
}

function setTimeOn(){
   
    if(cFlag == "Y"){
       
        if( ssVal == 0){
            
            ssVal = 59;
            if(mmVal == 0){
                hhVal = hhVal - 1;
                mmVal = 59;
                if(hhVal == 0)  hhVal = 0;
            }else{
                mmVal = mmVal - 1;
            } 
            
        }else{
            ssVal = ssVal - 1;
        }
        if (hhVal < 10 ) document.tForm.hhVal.value="0"+hhVal;
        else document.tForm.hhVal.value= hhVal;
            
        if (mmVal < 10 ) document.tForm.mmVal.value="0"+mmVal;
        else document.tForm.mmVal.value= mmVal;
            
        if (ssVal < 10 ) document.tForm.ssVal.value="0"+ssVal;
        else document.tForm.ssVal.value= ssVal;
    }
    
    if( cFlag=="N" || (hhVal==0 && mmVal==0 && ssVal==0) ){
        hhVal = 0;
        mmVal = 0;
        ssVal = 0;
        document.tForm.hhVal.value= "00";
        document.tForm.mmVal.value= "00";
        document.tForm.ssVal.value= "00";
        stopTime ();
    }else{
        setTimeout("setTimeOn()", 1000);//최대 1초 
    }        
} //setTimeOn()
function stopTime (){
    cFlag = "N";
    alert("완료");
}
//카운트 다운 스크립트 종료
//--> 
</script> 
</head> 
<body onLoad="clock()"> 
   <form name="time"> 
       현재 시간 : <input name="clock" size="12" value="" style="border:0"> 
   </form> 
   <form name="tForm"> 
       카운트할 시간(분 단위) 입력:<input name="minVal" size="4" maxlength="3" value="" >  
       <input type="button"   value="카운트시작" onClick="javascript:setMinute()" /> 
       <input name="hhVal" size="4" value="00" style="border:0" readonly>:
       <input name="mmVal" size="4" value="00" style="border:0" readonly>:
       <input name="ssVal" size="4" value="00" style="border:0" readonly >   
   </form> 
   
   <form name="sForm"> 
        카운종료 <input type="button"  value="카운트 종료"  onClick="javascript:stopTime()"> 
    </form>
</body> 
</html>

