<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.jdbc.users.Users" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
<script src="../jquery/jquery-3.5.1.js"></script>
	<script type="text/javascript">
function checkId(){
	if(document.frm.newId.value==="<%=allUsers.get(1).getId()%>"){
		alert('중복된 아이디 입니다.')
	} else {
		if(confirm('입력하신 아이디로 등록하시겠습니까?')){
			alert('등록되었니다.')	
		} else {
			alert('취소되었니다.')	
			};
		}
			
}
function checkPassword() {
	if(document.frm.newPassword.value==""){
		alert('비밀번호를 입력해주세요.')
	} else {
		if(document.frm.newPassword.value !== document.frm.newPasswordCheck.value){
			alert('비밀번호와 비밀번호 확인이 틀립니다.')
		} else {
			alert('good!')
		}
	}
}
function checkNick() {
	if(document.frm.nickName.value==""){
		alert('닉네임을 입력해주세요.')
	} else {
		if(document.frm.nickName.value==="nick") {
			alert('이미 존재하는 닉네임입니다.')
		} else {
			if(confirm('입력하신 닉네임으로 등록하시겠습니까?')){
				alert('등록되었습니다.')
			}
		}
	}
}
function checkEmail() {
	if((document.frm.emailFirst.value+"@"+document.frm.emailSecond.value)==="hong@naver.com"){
		alert('이미 등록된 닉네임입니다.')
	} else {
			if(confirm('입력하신 닉네임으로 등록하시겠습니까?')){
				alert('등록되었습니다.')
			}
		}
	}
</script>
<form name="frm" action="checkJoin.html">
	<p>아이디 : <input type="text" name="newId" id="newId"
		style="width: 195px; height: 18px;" autocomplete="on" >
	<button onclick="checkId()">중복확인</button></p>
	<p>비밀번호<input type="password" name="newPassword" id="newPassword"
		style="width: 195px; height: 18px;" ></p>
	<p>비밀번호확인<input type="password" name="newPasswordCheck" id="newPasswordCheck"
		style="width: 195px; height: 18px;" ></p>
	<p>이름<input type="text" name="name" id="name"
		style="width: 195px; height: 18px;" ></p>
	<p>닉네임<input type="text" name="nickName" id="nickName"
		style="width: 195px; height: 18px;" >
	<button onclick="checkNick()">중복확인</button></p>
	<p>국가<input type="text" name="country" id="country"
		style="width: 195px; height: 18px;" ></p>
	<p>이메일 : <input type="text" name="emailFirst" id="emailFirst"
		style="width: 195px; height: 18px;" > @
	<select id="email" name="emailSecond"
		style="width: 150px; height: 24px;" >
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
	<button onclick="checkEmail()">중복확인</button></p>
	<p>전화번호<input type="tel" name="phone" id="phone"
		style="width: 195px; height: 18px;" placeholder="(-)는 빼고 입력해주세요."
		></p>
	<p>성별<input type="radio" name="gender" id="male" value="male">
	<label for="male">남성</label>
	<input type="radio" name="gender" id="female" value="female">
	<label for="female">여성</label></p>
	<input type="submit" value="전송">
	</form>
	
	<script>
	
	</script>
</body>
</html>