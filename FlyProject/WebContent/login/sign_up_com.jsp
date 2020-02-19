<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="/FlyProject/css/sign_up_com.css">
<!-- <script src="./js/sign_up.js"></script> -->
<meta charset="UTF-8">
<title>Sign Up com</title>
</head>
<body>

  <jsp:include page="../user_head_line.jsp"></jsp:include>
   <div class="regis_co">
       <h1><img src="/FlyProject/img/check-mark.png" alt="">회원가입이 완료 되었습니다!</h1>
        <p>${dto.first_name} ${dto.last_name},마티나투어 회원이 되신걸 축하합니다.</p>
        <p>알차고 실속있는 여행을 즐겨보세요!</p>
        <div class="regis_cl">
            <a href="/FlyProject/main_head.jsp">시작하기</a>
        </div>
    </div>
</body>
</html>