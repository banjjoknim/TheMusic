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
<link rel="stylesheet" href="../css/adminUpdate.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Admin</title>
</head>
<body>
	<%
		Integer userNo = Integer.parseInt((String) request.getParameter("select1"));

	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt = null;
	ResultSet userUp = null;

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");

	pstmt = conn.prepareStatement("SELECT * FROM USERS WHERE NO = ? ");
	pstmt.setInt(1, userNo);
	userUp = pstmt.executeQuery();
	%>
	<body>
	<jsp:include page="../navbar.jsp" />

	<!-- 헤더 -->

	<div id="header">

		<h1 id="header_info">관리자모드</h1>

	</div>

	<!-- 컨테이너 -->

	<div id="container">
	
	<div id="content1">
	<h1 style="text-align: center;">유저 정보 수정</h1>
</div>
<%while(userUp.next()){ %>
            <div id = "content1_form">
                <fieldset>
                    <ul class="join_box">
                        <li>
                            <label class="reg" for="user_name">아이디</label>
                            <%=userUp.getString("user_id") %>
                        </li>
                        <li>
                            <label class="reg" for="user_name">프로필 이미지</label>
                            <img src="<%=userUp.getString("user_image_file") %>" alt="이미지 없음" width="200px" height="200px"><br>
                            <input type="file" id="newImage" name="newImage">
                        </li>
                        <li>
                            <label class="reg" for="newPassword">비밀번호 변경</label>
                            <input type="password" name="newPassword" id="newPassword" style="width:195px; height:18px;" placeholder="변경할 비밀번호를 입력해주세요">
                        </li>
                        <li>
                            <label class="reg" for="newPasswordCheck">비밀번호 확인</label>
                            <input type="password" name="newPasswordCheck" id="newPasswordCheck" style="width:195px; height:18px;" >
                        </li>
                        <li>
                            <label class="reg" for="name">이름</label>
                            <%=userUp.getString("name") %>
                        </li>
                        <li>
                            <label class="reg" for="nickName">닉네임</label>
                            <%=userUp.getString("nickName") %>
                        </li>
                        <li>
                            <label class="reg" for="emailFirst">메일 주소</label>
                            <input type="text" name="emailFirst" id="emailFirst" style="width:230px; height:18px;" placeholder="새로운 이메일 아이디를 입력해주세요">&nbsp;@
                            <input type="text" name="emailSecond" id="emailSecond" style="width:195px; height:18px;" placeholder="이메일 주소 선택">
                        </li>
                        <li>
                            <label class="reg" for="phone">휴대폰</label>
                            <input type="text" name="phone" id="phone" style="width:195px; height:18px;" placeholder="변경할 전화번호를 입력해주세요">
                    
                        </li>
                    </ul>
                </fieldset>
               </div>
               <div id="content2">
                <button type="submit" 
                    style="font-size: 13pt; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">정보수정</button>
                <button type="reset"
                    style="font-size: 13pt; margin-left: 30px; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">취소</button>
            </div>

	<%} userUp.close();
		pstmt.close();
		conn.close();%>
	
	</div>
	
</body>
</html>