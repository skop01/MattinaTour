<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="/FlyProject/css/my_info_view.css">
<!-- <script src="./js/sign_up.js"></script> -->
<meta charset="UTF-8">
<title>my_info_view</title>
</head>
<body>

<jsp:include page="../user_head.jsp"></jsp:include>
	<div class="banner">
	<form action="/FlyProject/?comand=update_form" method="post">
        <div class="user">
            <p>마티나투어 회원</p>
        </div>
        <div class="modify">
            <ul>
              	<li><a href="/FlyProject/login/my_info.jsp">MY 예약</a></li>
                <li><a href="/FlyProject/?comand=view_form">내 정보</a></li>
                <li>회원등급</li>
                <li>my 예약</li>
            </ul>     
        </div>        
        <div class="tab_content">
           <ul>
        
                <li>이메일<span>-</span><span>${dto.email}</span></li>               
                <li>성<span>-</span><span>${dto.first_name}</span></li>
                <li>이름<span>-</span><span>${dto.last_name}</span></li>
                <li>생년월일<span>-</span><span>${dto.birth}</span></li>
                <li>국적<span>-</span><span>	
                				<c:if test="${dto.national==1}">Korea</c:if>
				                <c:if test="${dto.national==2}">Japan</c:if>
				                <c:if test="${dto.national==3}">China</c:if>
				                <c:if test="${dto.national==4}">Vietnam</c:if>
				                <c:if test="${dto.national==5}">Hongkong</c:if>				               
                </span></li>
                <li>여권번호<span>-</span><span>${dto.p_port}</span></li>
                <li>발행일<span>-</span><span>${dto.p_issue}</span></li>
                <li>만료일<span>-</span><span>${dto.p_expiry}</span></li>
                <li>연락처<span>-</span><span>
                				<c:if test="${dto.n_number==1}">+82</c:if>
				                <c:if test="${dto.n_number==2}">+81</c:if>
				                <c:if test="${dto.n_number==3}">+84</c:if>
				                <c:if test="${dto.n_number==4}">+852</c:if>
				                <c:if test="${dto.n_number==5}">+853</c:if>
				                <c:if test="${dto.n_number==6}">+86</c:if>
				                <c:if test="${dto.n_number==7}">+886</c:if>                				
               								&nbsp;	 ${dto.p_number}</span></li>
           </ul>
           <input type="submit" value="수정" class="sub">
        </div>
        </form>
    </div>

</body>
</html>