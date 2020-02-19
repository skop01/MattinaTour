<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/my_info.css">
<!-- <script src="./js/sign_up.js"></script> -->
<meta charset="UTF-8">
<title>my_info</title>
</head>
<body>


<jsp:include page="../user_head.jsp"></jsp:include>
    <div class="banner">
        <div class="user">
            <p>마티나투어 회원</p>
        </div>
        <div class="modify">
            <ul>
                <li><a href="/FlyProject/login/my_info.jsp">MY 예약</a></li>
                <li><a href="../?comand=view_form">내 정보</a></li>
                <li>회원등급</li>
                <li>my 예약</li>
            </ul>     
        </div>
        <div class="content">
            <span><img src="../img/alert2.png"> 여기에서 최근 1년간의 마티나투어 예약 내역을 확인하실 수 있습니다. 그 이전 예약내역을 확인하시려면, 고객센터에 문의하세요.</span>
        </div>
        <div class="tab_content">
            <input type="radio" name="tabmenu" id="tab01" checked>
            <label for="tab01">항공권</label>
            <input type="radio" name="tabmenu" id="tab02" >
            <label for="tab02">호텔</label>
            <div class="conbox con1"><h3><img src="../img/warning.png" alt=""> 항공권 예약 내용이 존재하지 않습니다.</h3></div>    
            <div class="conbox con2"><h3><img src="../img/warning.png" alt=""> 호텔 예약 내용이 존재하지 않습니다.</h3></div>
        </div>
    </div>
    
    
</body>
</html>