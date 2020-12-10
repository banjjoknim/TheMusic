<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>user update</title>
    <link rel="stylesheet" href="../css/user_info.css">
    <link rel="stylesheet" href="../css/basic_setting.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>
    ul.join_box li{
    margin: 0 auto;
    }
    
body{
background-image: url(../files/main/12.jpg);
background-size: 100% 100%;
background-repeat: no-repeat;
}
</style>
</head>


<body>
<script>
function checkNum(event){
	var code = event.keyCode;
	if(code>47 && code<58 || code>95 && code<106){
		console.log(document.updateFrm.phone.value.length);
		if(document.updateFrm.phone.value.length>10){
			event.preventDefault();
			console.log(document.updateFrm.phone.value);
			alert('전화번호는 최대 11자리까지 입력가능합니다.')
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
	
</script>
    <!-- 네비게이션 바 -->

    <jsp:include page="../navbar.jsp"/>


    <!-- 헤더 -->


        

    <div id="header">

        <h1 id="header_info">회원정보수정</h1>

    </div>
     <!-- 컨테이너 -->
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");
String sql = "SELECT * FROM users where user_id = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, (String)session.getAttribute("id"));
ResultSet rs = pstmt.executeQuery();

%>
     <div id="container">
        <form name="updateFrm" action="user_update_pro.jsp" method="POST" enctype="multipart/form-data"> 
        <!-- 회원 정보 입력 -->
        

<div id="content1">
<h1><span style="color:cornsilk;">회원정보입력</span></h1>
</div>
           <%if(rs.next()){ %>
           <%session.setAttribute("nowPassword", rs.getString("password")); %>
           <c:set var="nowPwd" value="<%=(String)session.getAttribute(\"nowPassword\") %>"/>
            <div id = "content1_form">
                <fieldset style="border: none;">
                    <ul class="join_box" style="text-align: left;">
                        <li>
                        <img id="newImage" src="../files/users/<%=rs.getString("user_image_file") %>" width="350px" height="350px" style="display: block; margin: 0 auto;">
                        </li>
                        <li style="margin-left: 110px;">
                            <label class="reg"><span style="font-weight: bold; font-size: 13pt;">프로필 사진 선택</span></label>
                            <input type="file"  name="newImage" accept="image/*" onchange="setThumbnail(event);">
                        </li>
                        <li style="margin-left: 110px;">
                            <label class="reg"><span style="font-weight: bold; font-size: 13pt;">아이디</span></label>
                            <%=rs.getString("user_id") %>
                        </li>
                        <li style="margin-left: 110px;">
                            <label class="reg" for="newPassword"><span style="font-weight: bold; font-size: 13pt;">현재 비밀번호</span></label>
                            <input type="password" name="nowPassword" id="nowPassword" onkeyup="checkPassword(event)" style="width:180px; height:18px;" placeholder="변경하시려면 입력해주세요.">
                        </li>
                        <li style="margin-left: 110px;">
                            <label class="reg" for="newPassword"><span style="font-weight: bold; font-size: 13pt;">새 비밀번호</span></label>
                            <input type="password" name="newPassword" id="newPassword" style="width:180px; height:18px;" placeholder="변경하시려면 입력해주세요.">
                        </li>
                        <li style="margin-left: 110px;">
                            <label class="reg" for="newPasswordCheck"><span style="font-weight: bold; font-size: 13pt;">새 비밀번호 확인</span></label>
                            <input type="password" name="newPasswordCheck" id="newPasswordCheck" onkeyup="checkNewPassword(event)" style="width:180px; height:18px;" placeholder="변경할 비밀번호 확인">
                        </li>
                        <li style="margin-left: 110px;">
                            <label class="reg" for="name"><span style="font-weight: bold; font-size: 13pt;">이름</span></label>
                            <%=rs.getString("name") %>
                        </li>
                        <li style="margin-left: 110px;">
                            <label class="reg" for="nickName"><span style="font-weight: bold; font-size: 13pt;">닉네임</span></label>
                            <%=rs.getString("nickName") %>
                        </li>
                        <li style="margin-left: 110px;">
                            <label class="reg" for="emailFirst"><span style="font-weight: bold; font-size: 13pt;">메일 주소</span></label>
                            <input type="text" name="emailFirst" id="emailFirst"  style="width:90px; height:18px;" placeholder="아이디 입력">&nbsp;@
                            <!-- <input type="text" name="emailSecond" id="emailSecond" style="width:100px; height:18px;" placeholder="이메일 주소 선택"> -->
                            <select id="email" name="emailSecond" onchange="checkEmail()" style="width:100px; height:27px;" >
                                            <option value="">==선택==</option>
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
                        <li style="margin-left: 110px;">
                            <label class="reg" for="phone"><span style="font-weight: bold; font-size: 13pt;">휴대폰</span></label>
                            <input type="text" name="phone" id="phone" onkeydown="checkNum(event);" style="width:180px; height:18px;" placeholder="(-)없이 입력해주세요">
                        </li>
                    </ul>
                </fieldset>
               </div>

        <!--수정하기 다시작성 버튼 -->

            <div id="content3">
                <button type="button" onclick="checkUser(event)"
                    style="font-size: 13pt; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">수정하기</button>
                <button type="reset"
                    style="font-size: 13pt; margin-left: 30px; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">다시작성</button>
            </div>
            </form>
            <%} else { %>
		<div id="content1">
				<%String pathJoin = request.getContextPath()+"/users/user_join1.jsp"; 
				String pathLogin = request.getContextPath()+"/users/login.jsp"; %>

			<i class="material-icons"
				style="user-select: none; font-size: 140px; color: coral; display: block; margin: 0 auto;">lock</i>
			<h1 style="color: cornsilk;">현재 <a href="<%=pathLogin%>" style="color: coral;">로그인</a>이 되어있지 않습니다.</h1>
			<h1 style="font-size: 13pt; color: cornsilk;">
			회원정보수정은
				<a style="color: coral; text-decoration: underline;"
					href="<%=pathLogin%>">로그인</a>이후에 할 수 있습니다.
			</h1>

			<div id="content1_Resist_Seller_Result"></div>

		</div>
		<!-- 메인페이지 이동 버튼 -->

		<div id="content3">
			<a href="../main_page.jsp"><button type="button"
					style="font-size: 13pt; outline: none; font-weight: bold; width: 120px; height: 50px; background-color: cornsilk; color: black; border-radius: 5px;">메인페이지로</button></a>
		</div>
		<%} %>
        <!-- 풋터 -->
        </div>
        <jsp:include page="../footer.jsp"/>
        
        
<script>
function setThumbnail(event) {
	var fileReader = new FileReader();
	fileReader.readAsDataURL(event.target.files[0]);
	fileReader.onload = function(event) {
		document.getElementById("newImage").src = event.target.result;
	}
}
var checkUserTrue = false;
var checkNewPasswordCheck;

function checkPassword(event) {
	console.log(document.updateFrm.nowPassword.value);
	if(document.updateFrm.nowPassword.value==="${nowPwd}"){
		alert("입력하신 비밀번호가 현재와 동일합니다.");
		checkUserTrue = true;
	} else {
		checkUserTrue = false;
	}
	console.log(checkUserTrue);
}
function checkNewPassword(event) {
	console.log(document.updateFrm.newPasswordCheck.value);
	if(document.updateFrm.newPassword.value!=="") {
	if(document.updateFrm.newPassword.value===document.updateFrm.newPasswordCheck.value) {
		alert("새 비밀번호 및 비밀번호 확인이 동일합니다.");
		checkNewPasswordCheck = true;
		checkUserTrue = true;
	} else {
		checkNewPasswordCheck = false;
		checkUserTrue = false;
	}
	console.log(checkUserTrue);
	console.log(checkNewPasswordCheck);
	}
}
function checkUser(event) {
	if(checkUserTrue === true) {
		document.updateFrm.submit();
		alert("수정완료");
	}
	if(checkUserTrue === false) {
		alert('현재 비밀번호가 틀렸습니다.');
		document.updateFrm.nowPassword.select();
		if(checkNewPasswordCheck === false) {
		alert("새 비밀번호 와 비밀번호 확인이 동일하지 않습니다.");
		document.updateFrm.newPasswordCheck.select();
		}
	} 
}
function checkEmail() {
	if(document.updateFrm.emailFirst!=""){
		
	}
}

</script>        
</body>
</html>