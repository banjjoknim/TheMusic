<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<input type="password" name="newPassword" id="newPassword" style="width:195px; height:18px;" placeholder="변경할 비밀번호를 입력해주세요">
<input type="password" name="newPasswordCheck" id="newPasswordCheck" style="width:195px; height:18px;" placeholder="변경할 비밀번호를 입력해주세요">
<script type="text/javascript">
function check() {
	var c =	confirm("비밀번호를 변경하시겠습니까?"); 
}
</script>
        <button type="button" onclick="check()">dddd</button>
</body>
</html>