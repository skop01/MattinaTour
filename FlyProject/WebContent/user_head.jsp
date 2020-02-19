<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%--  <%
String SessionEmail="";
String nickname="";
if(session.getAttribute("email")!=null){
	SessionEmail=(String)session.getAttribute("email");
	
	int idx=SessionEmail.indexOf("@");
    nickname=SessionEmail.substring(0,idx);
}

 
%>  
 --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/FlyProject/css/user_head.css" />
<link rel="stylesheet" href="/FlyProject/css/reset.css" />
<title>head</title>
</head>
<body>
  <div class="header">
        <div>
            <h1><a href="/FlyProject/main_head.jsp">Mattina Tour</a></h1>
            <nav>
               <c:choose>
               <c:when test="${empty sessionScope.email}">
                <ul class="spot">
                    <li><a href="/FlyProject/login/login.jsp">로그인</a></li>
                    <li>|</li>                              
                    <li><a href="/FlyProject/login/sign_up.jsp">회원가입</a></li>
                    </ul>
                </c:when>
                <c:otherwise>
                <div class="id">
		            <nav>
		                <ul>
		                    <li><p>계정</p>
		                        <ul class="lo">
		                            <li><a href="/FlyProject/login/my_info.jsp">MY 예약</a></li>
		                            <li><a href="/FlyProject/?comand=view_form">내 정보</a></li>
		                            <li><a href="#a">회원등급</a></li>
		                            <li><a href="/FlyProject/?comand=logout">로그아웃</a></li>
		                        </ul>
		                    </li>
		                </ul>
		            </nav>
          		 </div>
                </c:otherwise>
               </c:choose>
            </nav>
        </div>
    </div>
    
</body>
</html>