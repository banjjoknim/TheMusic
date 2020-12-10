<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form name="updateFrm" action="#">
<input type="password" name="password"><br>
<input type="password" name="passwordCheck"><br>
<input type="password" name="nowPassword" onkeyup="checkPassword(event)"><br>
<input type="text" name="text" onkeydown="checkNum(event)"><br>
<input type="hidden" name="oldPassword" value="12345">
<input type="file" id="file" name="file" onchange="showFile()">
<input type="submit" value="제출">
</form>

<!-- 숫자만 쓸 수 있게 체크
<script>
function checkNum(event){
	var code = event.keyCode;
	if(code>47 && code<58){
		return;
		}
	else if (code == 9 || code == 36 || code == 35 || code == 37 || code == 39 || code == 8 || code == 46) {
		return;
		} else {
			alert("숫자만 입력할 수 있습니다.")
	event.preventDefault();
		}
	}
</script> -->
<c:set var="nowPassword" value="33"/>
<script>
function checkPassword(event) {
	console.log(document.updateFrm.nowPassword.value);
	if(document.updateFrm.nowPassword.value=="33"){
		alert("패스워드 동일");
	}
}
</script>

<script>
function showFile(){
	console.log(document.updateFrm.file.files[0].name);
}
</script>
</body>
</html>