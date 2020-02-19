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
<link rel="stylesheet" href="/FlyProject/css/header.css" />
<link rel="stylesheet" href="/FlyProject/css/reset.css" />
  <link rel="stylesheet" href="/FlyProject/css/lightpick.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
<script src="./js/jquery.easy-autocomplete.min.js"></script>
<script src="./js/lightpick.js"></script>

<title>head</title>
</head>
<body>
  <div class="header">
        <div>
            <h1><a href="/FlyProject/main_head.jsp"><img src="./img/im12.png"></a></h1>
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
    <div class="gallerylist">
	<div class="gallerylist_l">
		<div class="banner">
			<div class="screen">
				<img src="img/ime33.jpg">
				<div class="background" > 
					<div class="tab_content">	
					<form action="air_view.jsp" method="post">
							<input type="radio" name="tabmenu" id="tab01" checked>
							<label for="tab01">편도</label>
							<input type="radio" name="tabmenu" id="tab02" >
							<label for="tab02">왕복</label>			
						<div class="conbox con1">
							<ul>
								<li>출발지</li>
								<li>도착지</li>
								<li class="vos">가는날</li>
								<li class="vos">오는날</li>
								<li class="voa">좌석 등급 및 승객</li>								
							</ul>												       
							<ul>
								<li><input type="text" name="start" id="start"></li>
								<li><input type="text" name="arrive" id="arrive"></li>
								<li class="vos"><input name="start_day" id="start_day" placeholder="가는날"></li>
								<li class="vos"><input readonly="readonly"></li>
								<li class="voa"><input name="" id="" placeholder="1 성인, 일반석"></li>						
							</ul>
							<div class="inp">						
								<button>항공권 검색</button>
							</div>																
						</div>
						<div class="conbox con2">
							<ul>
								<li>출발지</li>
								<li>도착지</li>
								<li class="vos">가는날</li>
								<li class="vos">오는날</li>
								<li class="voa">좌석 등급 및 승객</li>								
							</ul>												       
							<ul>
								<li><input type="text" name="start" id="start"></li>
								<li><input type="text" name="arrive" id="arrive"></li>
								<li class="vos"><input name="start_day2" id="start_day2" placeholder="가는날"></li>
								<li class="vos"><input name="arrive_day" id="arrive_day" placeholder="오는날"></li>
								<li class="voa"><input name="" id="" placeholder="1 성인, 일반석"></li>													
							</ul>
							<div class="inp">						
								<button>항공권 검색</button>
							</div>																
						</div>										
					</form> 
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>

<script src="./js/demo.js"></script>
</body>

</html>