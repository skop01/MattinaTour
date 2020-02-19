<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="/FlyProject/css/my_info_modify.css">
<!-- <script src="./js/sign_up.js"></script> -->
<meta charset="UTF-8">
<title>my_info_modify</title>
</head>
<body>
<jsp:include page="../user_head.jsp"></jsp:include>
<div class="banner">
        <form name="reg" method="post" action="/FlyProject/?comand=update_proc">
        <div class="user">
            <p>마티나투어 회원</p>
        </div>
        <div class="modify">
            <ul>
                <li><a href="/FlyProject/login/my_info.jsp">MY 예약</a></li>
                <li><a href="/FlyProject/login/my_info_view.jsp">내 정보</a></li>
                <li>회원등급</li>
                <li>my 예약</li>
            </ul>     
        </div>        
        <div class="tab_content">
           <ul>
                <li>이메일<span>-</span><span><input type="text" id="email" name="email" value="${dto.email}"  readonly="readonly"></span><span id="email_check" class="op"></span></li>
                <li>비밀번호<span>-</span><span><input type="password" id="pwd" name="pwd" placeholder="비밀번호 입력..."></span><span id="pwd_check" class="op"></span></li>  
                <li>비밀번호 재입력<span>-</span><span><input type="password" id="r_pwd" name="r_pwd" placeholder="비밀번호를 재입력..." ></span><span id="r_pwd_check" class="op"></span></li>                 
                <li>성<span>-</span><span><input type="text" id="f_name" name="f_name" value="${dto.first_name}" placeholder="예)HONG" ></span><span id="f_check" class="op"></span></li>
                <li>이름<span>-</span><span><input type="text"   id="l_name" name="l_name" value="${dto.last_name}" placeholder="예)GILDONG" ></span><span id="l_check" class="op"></span></li>
                <li>생년월일<span>-</span><span><input type="text"id="birth" name="birth" value="${dto.birth}" placeholder="YYYY.MM.DD" ></span><span id="birth_check" class="op"></span></li>
                <li>여권번호<span>-</span><span><input type="text"id="port" name="port"  value="${dto.p_port}" placeholder="여권번호를 입력..."></span><span class="op" id="port_check"></span></li>
                <li>발행일<span>-</span><span><input type="text"  id="issue" name="issue"  value="${dto.p_issue}" placeholder="YYYY.MM.DD" ></span><span class="op" id="issue_check"></span></li>
                <li>만료일<span>-</span><span><input type="text"  id="expiry" name="expiry" value="${dto.p_expiry}" placeholder="YYYY.MM.DD" ></span><span class="op" id="ex_check"></span></li>
                <li>연락처<span>-</span><span><select class="phone_" class="op" id="phone" name="phone" >
                    <option value="0">Not Selected</option>
                    <option value="1" <c:if test="${dto.n_number==1}">selected</c:if>>+82(korea)</option> 
                    <option value="2" <c:if test="${dto.n_number==2}">selected</c:if>>+81(Japan)</option>
                    <option value="3" <c:if test="${dto.n_number==3}">selected</c:if>>+84(Vietnam)</option>
                    <option value="4" <c:if test="${dto.n_number==4}">selected</c:if>>+852(HongKong)</option>
                    <option value="5" <c:if test="${dto.n_number==5}">selected</c:if>>+853(Makao)</option>
                    <option value="6" <c:if test="${dto.n_number==6}">selected</c:if>>+86(China)</option>
                    <option value="7" <c:if test="${dto.n_number==7}">selected</c:if>>+886(Taiwan)</option>
                                    </select>
                    <input type="text" name="number" id="number" value="${dto.p_number}" placeholder="전화번호를 입력..."></span>
                    <span class="op" id="phone_check"></span>
                </li>
           </ul>
           <input type="submit" value="저장" class="sub">
        </div>
    </form> 
    </div>
    
</body>
</html>