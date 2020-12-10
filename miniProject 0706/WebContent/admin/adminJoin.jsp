<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="org.jdbc.music.*,org.jdbc.users.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/basic_setting.css">
<link rel="stylesheet" href="../css/adminJoin.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Admin</title>
</head>
<body>
<body>
	<jsp:include page="../navbar.jsp" />

	<!-- 헤더 -->

	<div id="header">

		<h1 id="header_info">관리자모드</h1>

	</div>
	<div id="container">
		<form action="adminJoinPro.jsp" method="POST">
			<!-- 회원 정보 입력 -->

			<div id="content1">
				<h1>
					<span style="color: cornsilk;">관리자 정보 입력</span>
				</h1>
			</div>

			<div id="content1_form">
				<fieldset>
					<ul class="join_box">
						<li><label class="reg" for="adminId">아이디</label> <input
							type="text" name="adminId" id="adminId"
							style="width: 195px; height: 18px;" autocomplete="on" required>
							</li>
						<li><label class="reg" for="Password">비밀번호</label> <input
							type="password" name="Password" id="Password"
							style="width: 195px; height: 18px;" required></li>
							 <li>
                            <label class="reg" for="name">이름</label>
                            <input type="text" name="name" id="name" style="width:195px; height:18px;" required>
                        </li>
						<li><label class="reg" for="nickName">닉네임</label> <input
							type="text" name="nickName" id="nickName"
							style="width: 195px; height: 18px;" required> </li>
						 <li>
                            <label class="reg" for="emailFirst">메일 주소</label>
                            <input type="text" name="emailFirst" id="emailFirst" style="width:195px; height:18px;" required> @ 
                            <label class="reg" for="email" ></label>
                                        <select id="email" name="emailSecond" style="width:150px; height:24px;" required>
                                            <option value="직접 입력">직접 입력</option>
                                            <option value="gmail.com">gmail.com</option>
                                            <option value="naver.com">naver.com</option>
                                            <option value="daum.net">hanmail.net</option>
                                            <option value="hotmail.com">hotmail.com</option>
                                            <option value="nate.com">nate.com</option> 
                                            <option value="yahoo.com">yahoo.co.kr</option> 
                                            <option value="empas.com">empas.com</option> 
                                            <option value="lycos.co.kr">lycos.co.kr</option> 
                                            <option value="korea.com">korea.com</option> 
                                            <option value="hanmir.com">hanmir.com</option> 
                                            <option value="paran.com">paran.com</option>
                                        </select>
                            </li>
						<li>
                            <label class="reg" for="phone">휴대폰</label>
                            <input type="tel" name="phone" id="phone" style="width:195px; height:18px;" placeholder="(-)는 빼고 입력해주세요." required>
                        </li>
                        <li>
                            <label class="reg" for="gender" >성별</label>
                            <input type="radio" name="gender" id="male" value="male"><label for="male">남성</label>
                            <input type="radio" name="gender" id="female" value="female"><label for="female">여성</label>
                        </li>
							<li><label class="reg" for="membertype">멤버타입</label> 
							<input type="radio" name="membertype" value="admin" required> admin </li>
					</ul>
				</fieldset>

			</div>



			<div id="content3">
				<button type="submit"
					style="font-size: 13pt; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">확인</button>
				<button type="reset"
					style="font-size: 13pt; margin-left: 30px; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">취소</button>
			</div>
		</form>




	</div>
</body>
</html>