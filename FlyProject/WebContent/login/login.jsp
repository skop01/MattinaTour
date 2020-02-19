<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="connect.CookieSave"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String myCookie = CookieSave.getMyCookie(request);
	pageContext.setAttribute("myCookie", myCookie);
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/login.css" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>head</title>
   
</head>
<body> 
     <jsp:include page="../user_head_line.jsp"></jsp:include>
    <form name="login_form" action="../user?comand=login" method="post">
    <div class="login">
        <h2>로그인</h2>
        <ul>
        <c:choose>
		<c:when test="${empty myCookie}">
            <li><input type="text" name="email" placeholder="이메일"></li>
            <li><input type="password" name="passwd" placeholder="비밀번호"></li>
            <li><input type="checkbox"  name="email_save" id="check_id">
            <label for="check_id">이메일 저장</label></li>
            </c:when>
            <c:otherwise>
			<li><input type="text" value="${myCookie}" name="email" ></li>
            <li><input type="password" name="passwd" placeholder="비밀번호"></li>
            <li><input type="checkbox"  name="email_save" id="check_id" checked="checked">
            <label for="check_id">이메일 저장</label></li>
            </c:otherwise>
            </c:choose>
            <li><input type="submit" value="로그인" style="font-size: 16px;" ></li>
            <li><a id="kakao-login-btn"></a></li>
        </ul>
        <div class="login_in">
          <p>마티나투어 회원이 아니세요?</p>
          <a href="./sign_up.jsp">회원가입 하세요!</a>
    </div>
    </div>
    </form>
    
    <!-- 	<form name="kakaoLogin">
		<input type="hidden" name="userid" />
	</form>
	
	<form name="kakaoRegister">
		<input type="hidden" name="userid" />
		<input type="hidden" name="nickname" />
	</form> -->
    
<!--    <script>
   Kakao.init('7ca2d597fb4f77cef4c41fffe0add133');
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
     container: '#kakao-login-btn',
     success: function() {
  
        Kakao.API.request({ 
             url: '/v2/user/me', 
             success: function(res) { 
                var email = res.kakao_account.email;
                
                $.ajax({
                     url : "../user?comand=kakao_login",
                     type : "post",
                     data : {email : email},
                       success : function(result){
                       	if(result==1){
                       		var frm = document.kakaoLogin;
      		        		frm.userid.value=email;  		        	
      		        		
      		        		frm.method="POST";
      		        		frm.action="";
      		        		frm.submit(); 
                       	}
                       	
                       	}
                     }
                  }
            })
        
        })       
   </script> -->
</body>
</html>

