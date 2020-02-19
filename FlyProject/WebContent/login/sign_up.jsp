<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/sign_up.css">
<!-- <script src="./js/sign_up.js"></script> -->
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>


  <jsp:include page="../user_head.jsp"></jsp:include>
    <div class="regis">
   <form name="reg" method="post" action="../?comand=join">
    <div class="regis1">
        <h1>회원가입</h1><br>
        <span style="color:#646060;">마티나 투어 홈페이지에 가입하는 것을 환영합니다.</span><br>
        <span style="color:#646060;">여행 당일 아침의 설레임을 느껴보세요.</span>
    </div>
    <div class="main">
        <div class="regis2">
            <ul>
                <li>
                    <p>이메일</p>
                    <input type="text" id="email" name="email" placeholder="이메일을 입력하세요" >
                    <div id="email_check" class="op"></div>        
                </li>
            </ul>
        </div>
        <div class="regis3">
            <ul>
                <li>
                    <p>비밀번호</p>
                    <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" > 
                    <div id="pwd_check" class="op"></div>
                </li>
                <li>
                    <p>비밀번호 재입력 </p>
                    <input type="password" id="r_pwd" name="r_pwd" placeholder="비밀번호를 재입력하세요" > 
                    <div id="r_pwd_check" class="op"></div>
                </li>
            </ul>
        </div>
        <div class="regis3">
            <ul>
                <li>
                    <p>성</p>
                    <input type="text" id="f_name" name="f_name" placeholder="예)HONG">
                    <div id="f_check" class="op"></div>
                </li>
                <li>
                    <p>이름</p>
                    <input type="text"   id="l_name" name="l_name" placeholder="예)GILDONG">
                    <div id="l_check" class="op"></div>
                </li>
            </ul>
        </div>
        <div class="regis4">
            <ul>
                <li class="regis4_1">
                    <p>생년월일</p>
                    <input type="text"id="birth" name="birth" placeholder="YYYY.MM.DD">
                    <div id="birth_check" class="op"></div>
                </li>
                <li>
                    <ul>
                        <li class="regis4_2">
                            <p>국적</p>
                            <select id="national" name="national" class="national_">
                                <option  value="0" selected="selected">Not Selected</option>
                                <option value="1">Korea</option>
                                <option value="2">Japane</option>
                                <option value="3">China</option>
                                <option value="4">Vietnam</option>
                                <option value="5">HongKong</option>
                            </select>
                            <div class="op" id="n_check"></div>
                        </li>
                        <li>
                            <p>성별</p>
                            <input type="checkbox" value="0" > 
                            <input type="checkbox" value="1" name="gender" id="man"/><label for="man">Man</label>
                            <input type="checkbox" value="2" name="gender" id="woman"/><label for="woman">Female</label>
                            <div class="opo" id="g_check"></div> 
                        </li>
                    </ul>    
                </li>
            </ul>
        </div>        
        <div class="regis5">
            <ul>
                <li class="regis5_1">
                    <p>여권번호</p>
                    <input type="text"id="port" name="port"placeholder="여권번호를 입력하세요">
                    <div class="op" id="port_check"></div>
                </li>
                <li class="regis5_2">
                    <ul>
                        <li>
                            <p>발행일</p>
                            <input type="text"  id="issue" name="issue" placeholder="YYYY.MM.DD">
                            <div class="op" id="issue_check"></div>
                        </li>
                        <li>
                            <p>만료일</p>
                            <input type="text"  id="expiry" name="expiry" placeholder="YYYY.MM.DD">
                            <div class="op" id="ex_check"></div>
                        </li>
                    </ul>    
                </li>        
            </ul>
        </div>
        <div class="regis6">
            <ul>
                <li>
                    <p>연락처</p>
                    <select class="phone_" class="op" id="phone" name="phone">
                        <option value="0" selected="selected">Not Selected</option>
                        <option value="1">+82(korea)</option> 
                        <option value="2">+81(Japan)</option>
                        <option value="3">+84(Vietnam)</option>
                        <option value="4">+852(HongKong)</option>
                        <option value="5">+853(Makao)</option>
                        <option value="6">+86(Chiena)</option>
                        <option value="7">+886(Taiwan)</option>
                    </select>
                     <input type="text" name="number" id="number" placeholder="전화번호를 입력하세요">
                     <div class="op" id="phone_check"></div>
                </li>
            </ul>
        </div>
    </div>
    <div class="submit">
        <input type="submit" value="가입하기" class="sub">
    </div> 
</form> 
</div> 

<script>
/* const empJ = /\s/g; */
const pwdj=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$^])/i;
const emailj = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
const phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
const nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
const num= /[^0-9]/g;


$(document).ready(function() {
	$('input[type="checkbox"][name="gender"]').click(function() {
		if($(this).prop('checked')){
			$('input[type="checkbox"][name="gender"]').prop('checked',false);
			$(this).prop('checked',true);
		}
		
	})
	
})



$("#email").blur(function(){
	const email=$('#email').val();

	/* alert(window.location.pathname); */
	$.ajax({
		type : 'GET',
		url : "../user?comand=idcheck",
		data :{email : email},		
		success : function (result) {
			if(result==1){
				$('#email_check').text("still");
				$('#email_check').css("color","green");
				console.log("success");
			}else if(result==0){
				$('#email_check').text("Nope");
				$('#email_check').css("color","red");
				console.log("fail");
			}
			if(email==""){
				$('#email_check').text("input email");
				$('#email_check').css("color","red");
				
			}else if(!emailj.test(email)){
				$('#email_check').text("Invalid email format");
				$('#email_check').css("color","red");		
				
			}
			
		}
		
	})
})


$("#pwd").blur(function() {
	const pwd=$('#pwd').val();

	if(pwd==""){
		$('#pwd_check').text("input pwd");
		$('#pwd_check').css("color","red");
	
		
	}else if(!pwdj.test(pwd)){
		$('#pwd_check').text("invalid pwd");
		$('#pwd_check').css("color","red");
	}
	
	
	else{
		$('#pwd_check').text("");
	}
	
	
})

$("#r_pwd").blur(function() {
	const r_pwd=$('#r_pwd').val();
	const pwd=$('#pwd').val();
	if(r_pwd==""){
		$('#r_pwd_check').text("input r_pwd");
		$('#r_pwd_check').css("color","red");
	
	}else{
		$('#r_pwd_check').text("");
	}
	
	if(pwd!=r_pwd){
		$('#r_pwd_check').text("diffrent");
		$('#r_pwd_check').css("color","red");
	
	}else if(pwd==r_pwd&&pwdj.test(pwd)&&pwdj.test(r_pwd)){
		$('#pwd_check').text("same");
		$('#pwd_check').css("color","green");
		
		$('#r_pwd_check').text("same");
		$('#r_pwd_check').css("color","green");
	}
})

$("#f_name").blur(function() {
	const f_name=$('#f_name').val();
	if(f_name==""&&!nameJ.test(f_name)){
		$('#f_check').text("input first name");
		$('#f_check').css("color","red");
		
	}else{
		$('#f_check').text("");
	}
})

$("#birth").blur(function(){
	const birth=$('#birth').val();
	if(birth==""){
		$('#birth_check').text("input first name");
		$('#birth_check').css("color","red");
	}else{
		$('#birth_check').text("");
	}
	
})

$("#l_name").blur(function() {
	const l_name=$('#l_name').val();
	if(l_name==""&&!nameJ.test(l_name)){
		$('#l_check').text("input last name");
		$('#l_check').css("color","red");
		
	}else{
		$('#l_check').text("");
	}
})
$("#national").blur(function() {
	const national=$('#national').val();
	if(national==0){
		$('#n_check').text("select the National");
		$('#n_check').css("color","red");
		return;
	}else{
		$('#n_check').text("");
	}
})

$("#man").blur(function() {
	if ($("input:checkbox[id='man']").is(":checked") == false && $("input:checkbox[id='woman']").is(":checked") == false){
		
		$('#g_check').text("select the gender");
		$('#g_check').css("color","red");

		}else if($("input:checkbox[id='man']").is(":checked") == true || $("input:checkbox[id='woman']").is(":checked") == true){
			$('#g_check').text("");
		
		}
		
})
$("#woman").blur(function() {
	if ($("input:checkbox[id='man']").is(":checked") == false && $("input:checkbox[id='woman']").is(":checked") == false){
		
		$('#g_check').text("select the gender");
		$('#g_check').css("color","red");

		}else if($("input:checkbox[id='man']").is(":checked") == true || $("input:checkbox[id='woman']").is(":checked") == true){
			$('#g_check').text("");
		
		}
		
})


$("#phone").blur(function() {
	const phone=$('#phone').val();
	if(phone==0){
		$('#phone_check').text("input the Phone Number");
		$('#phone_check').css("color","red");
		
	}else{
		$('#phone_check').text("");
	}
})
$("#number").blur(function() {
	const number=$('#number').val();
	if(number==""||!phoneJ.test(number)){
		$('#phone_check').text("input the Phone Number");
		$('#phone_check').css("color","red");
		
	}else if(!phoneJ.test(number)){
		$('#phone_check').text("Only Number");
		$('#phone_check').css("color","red");
	}
	
	else{
		$('#phone_check').text("");
	}
})




$("#port").blur(function() {
	const port=$('#port').val();
	if(port==""){
		$('#port_check').text("input portNumber");
		$('#port_check').css("color","red");
		
	}else{
		$('#port_check').text("");
	}
})

$("#issue").blur(function() {
	const issue=$('#issue').val();
	if(issue==""){
		$('#issue_check').text("input issue data");
		$('#issue_check').css("color","red");
	
	}else{
		$('#issue_check').text("");
	}
})

$("#expiry").blur(function() {
	const expiry=$('#expiry').val();
	if(expiry==""){
		$('#ex_check').text("input expiry data");
		$('#ex_check').css("color","red");

	}else{
		$('#ex_check').text("");
	}
})



$('form').on('submit',function () {
	const inval_Arr=new Array(11).fill(false);
	const email=$('#email').val();
	const pwd=$('#pwd').val();
	const r_pwd=$('#r_pwd').val();
	const birth=$('#birth').val();
	const f_name=$('#f_name').val();
	const l_name=$('#l_name').val();
	const national=$('#national').val();
	const phone=$('#phone').val();
	const number=$('#number').val();
	const port=$('#port').val();
	const issue=$('#issue').val();
	const expiry=$('#expiry').val();
	
	if(emailj.test(email)&&email!=""){
	 inval_Arr[0]=true;
	}else{
		inval_Arr[0]=false;
		$('#email_check').text("Required item");
		$('#email_check').css("color","red");
		return false;
					
	}
	
	if(pwd==r_pwd&&pwdj.test(pwd)&&pwd!=""){
		inval_Arr[1]=true;
		
	}else{
		inval_Arr[1]=false;
		$('#pwd_check').text("Required item");
		$('#pwd_check').css("color","red");
		return false;
	}
	
	if(f_name!=""){
		 inval_Arr[2]=true;
		}else{
			inval_Arr[2]=false;
			$('#f_check').text("Required item");
			$('#f_check').css("color","red");
			return false;
						
		}
	
	if(l_name!=""){
		 inval_Arr[3]=true;
		}else{
			inval_Arr[3]=false;
			$('#l_check').text("Required item");
			$('#l_check').css("color","red");
			return false;
						
		}
	
	if(national!=0){
		 inval_Arr[4]=true;
		}else{
			inval_Arr[4]=false;
			$('#n_check').text("Required item");
			$('#n_check').css("color","red");
			return false;
						
		}
	
	if(phone!=0){
		 inval_Arr[5]=true;
		}else{
			inval_Arr[5]=false;
			$('#phone_check').text("Required national phone number");
			$('#phone_check').css("color","red");
			return false;
						
		}
	
	if(number!=""){
		 inval_Arr[6]=true;
		}else{
			inval_Arr[6]=false;
			$('#phone_check').text("Required phone");
			$('#phone_check').css("color","red");
			return false;
						
		}

	if(port!=""){
		 inval_Arr[7]=true;
		}else{
			alert("test1");
			inval_Arr[7]=false;
			$('#port_check').text("Required item");
			$('#port_check').css("color","red");
			return false;
		}
	
	if(issue!=""){
		 inval_Arr[8]=true;
		}else{
			alert("test2");
			inval_Arr[8]=false;
			$('#issue_check').text("Required item");
			$('#issue_check').css("color","red");
			return false;
		}
	if(birth!=""){
		 inval_Arr[9]=true;
		}else{
			inval_Arr[9]=false;
			$('#phone_check').text("Required phone");
			$('#phone_check').css("color","red");
			return false;
						
		}
	
	
	if(expiry!=""){
		 inval_Arr[10]=true;
		}else{
			alert("test3");
			inval_Arr[10]=false;
			$('#birth_check').text("Required item");
			$('#birth_check').css("color","red");
			return false;
		

			var val_All=true;
				for(var i=0; i<inval_Arr.length; i++){
					if(inval_Arrp[i]==false){
					val_All=false;
					}
				}
				if(val_All==true){
					alert("Thanks");
				}else{
					alert("re")
				}

		}
		
	
});
</script>
</body>
</html>