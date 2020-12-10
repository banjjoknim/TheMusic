<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.jdbc.users.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>user join2</title>
    <!--서치버튼 아이콘 링크-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="../css/basic_setting.css">
    <link rel="stylesheet" href="../css/user_info.css">
    <style>
    ul.join_box li{
    margin: 0 auto;
    }
    body{
background-image: url(../files/main/19.jpg);
background-size: 100% 100%;
background-repeat: no-repeat;
}
    </style>
</head>


<body>


    <!-- 네비게이션 바 -->

    <jsp:include page="../navbar.jsp"/>
    <!-- 헤더 -->
    <div id="header">

        <h1 id="header_info">회원가입</h1>
        

    </div>
<%
ArrayList<Users> allUsers = new ArrayList<Users>();
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");
String sql = "SELECT * FROM users";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
Users newUser = new Users();
while(rs.next()){
	newUser = new Users(
	rs.getInt(1), 
	rs.getString(2),
	rs.getString(3),
	rs.getString(4),
	rs.getString(5),
	rs.getString(6),
	rs.getString(7),
	rs.getString(8),
	rs.getString(9),
	rs.getString(10),
	rs.getString(11),
	rs.getString(12),
	rs.getString(13));
	allUsers.add(newUser);
}

%>



    <!-- 컨테이너 -->

    <div id="container">
        <form name="joinFrm" action="user_join2_pro.jsp" method="POST"> 
        <!-- 회원 정보 입력 -->

        <div id="content1">
        <h1><span style="color :cornsilk;">회원정보 입력</span></h1>
        </div>
           
            <div id ="content1_form">
                <fieldset>
                    <ul class="join_box" style="text-align: left;">
                        <li>
                            <label class="reg" for="newId">아이디</label>
                            <input type="text" name="newId" id="newId" style="width:195px; height:18px;" autocomplete="on" required>
                            <input type="button" value="중복확인" onclick="checkId()">
                        </li>
                        
                        <li>
                            <label class="reg" for="newPassword">비밀번호</label>
                            <input type="password" name="newPassword" id="newPassword" style="width:195px; height:18px;" required>
                        </li>
                        <li>
                            <label class="reg" for="newPasswordCheck">비밀번호 확인</label>
                            <input type="password" name="newPasswordCheck" id="newPasswordCheck" style="width:195px; height:18px;" required>
                        </li>
                        <li>
                            <label class="reg" for="name">이름</label>
                            <input type="text" name="name" id="name" style="width:180px; height:18px;" required>
                        </li>
                        <li>
                            <label class="reg" for="nickName">닉네임</label>
                            <input type="text" name="nickName" id="nickName" style="width:180px; height:18px;" required>
                            <input type="button" value="중복확인"> 
                        </li>
                        <li>
                            <label class="reg" for="country">국가</label>
                            <input type="text" name="country" id="country" style="width:180px; height:18px;" required>
                        </li>
                        <li>
                            <label class="reg" for="emailFirst">메일 주소</label>
                            <input type="text" name="emailFirst" id="emailFirst" style="width:90px; height:18px;" required> @ 
                            <label class="reg" for="email" ></label>
                                        <select id="email" name="emailSecond" style="width:100px; height:24px;" required>
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
                            <input type="tel" name="phone" id="phone" style="width:180px; height:18px;" placeholder="(-)없이 입력해주세요." onkeydown="checkNum(event)">
                        </li>
                        <li>
                            <label class="reg" for="gender" >성별</label>
                            <input type="radio" name="gender" id="male" value="male" checked><label for="male">남성</label>
                            <input type="radio" name="gender" id="female" value="female"><label for="female">여성</label>
                        </li>
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
        
        <!-- 풋터 -->
        
        <jsp:include page="../footer.jsp"/>
        
        
<script>
function checkNum(event){
	var code = event.keyCode;
	if(code>47 && code<58 || code>95 && code<106){
		console.log(document.joinFrm.phone.value.length);
		if(document.joinFrm.phone.value.length>10){
			event.preventDefault();
			console.log(document.joinFrm.phone.value);
			alert('전화번호는 최대 11자리까지 입력가능합니다.');
			return;
			
		}
		return;
		} else if (code == 9 || code == 36 || code == 35 || code == 37 || code == 39 || code == 8 || code == 46) {
		return;
		} else {
			alert("숫자만 입력할 수 있습니다.");
	event.preventDefault();
		} 
	
	}
	
	function inputCheck() {
		var checkInput = false;
		if(document.joinFrm.newId.value==""){
			alert("아이디를 입력해주세요.");
			checkInput = false;
		} else {
			checkInput = true;
		}
		if(document.joinFrm.newId.value==""){
			alert("비밀번호를 입력해주세요.");
			checkInput = false;
		} else {
			checkInput = true;
		}
		if(document.joinFrm.newId.value==""){
			alert("비밀번호 확인을 입력해주세요.")
			checkInput = false;
		} else {
			checkInput = true;
		}
		if(document.joinFrm.newId.value==""){
			alert("이름을 입력해주세요.")
			checkInput = false;
		} else {
			checkInput = true;
		}
		if(document.joinFrm.newId.value==""){
			alert("닉네임을 입력해주세요.")
			checkInput = false;
		} else {
			checkInput = true;
		}
		if(document.joinFrm.newId.value==""){
			alert("국가를 입력해주세요.")
			checkInput = false;
		} else {
			checkInput = true;
		}
		if(document.joinFrm.newId.value==""){
			alert("이메일 아이디를 입력해주세요.")
			checkInput = false;
		} else {
			checkInput = true;
		}
		if(document.joinFrm.newId.value==""){
			alert("이메일 주소를 선택해주세요.")
			checkInput = false;
		} else {
			checkInput = true;
		}
		if(document.joinFrm.newId.value==""){
			alert("휴대폰 번호를 입력해주세요.")
			checkInput = false;
		} else {
			checkInput = true;
		}
		if(checkInput==true) {
			document.joinFrm.submit();
		}
	}
</script>        
        
        
</body>

</html>