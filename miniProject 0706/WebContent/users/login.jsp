<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="../css/user_join.css">
<link rel="stylesheet" href="../css/basic_setting.css">
<style>
body{
background-image: url(../files/main/4.jpg);
background-size: 100%;
}
</style>
</head>

<body>
	<!-- 네비게이션 바 -->

	<jsp:include page="../navbar.jsp" />




	<!-- 헤더 -->

	<div id="header">

		<h1 id="header_info">로그인</h1>

	</div>

	<!-- 컨테이너 -->

	<div id="container">
	
	<div id="content1">

		<h3 style="color: cornsilk;">아이디와 비밀번호를 입력해주세요.</h3>
    </div>
		<!-- 앨범 정보 -->
		<form action="loginPro.jsp" method="GET">
			<div id="content1" style="height: 200px">
				<div style="margin:30px">
					<label for="id"><span
						style="font-size: 30pt; color: cornsilk; vertical-align: middle;">아이디
						:</span></label> <input type="text" name="id" id="id"
						style="vertical-align: middle; width: 195px; height: 30px; outline: none;"
						autocomplete="on">
				</div>
				<div style="margin:30px">
					<label for="password"><span
						style="font-size: 30pt; color: cornsilk; vertical-align: middle;">비밀번호
						:</span></label> <input type="password" name="password" id="password"
						style="vertical-align: middle; width: 195px; height: 30px; outline: none;"
						autocomplete="on">
				</div>
			</div>
			<div id="content3">
                <button type="submit" 
                    style="font-size: 13pt; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">로그인</button>
                <button type="reset"
                    style="font-size: 13pt; margin-left: 30px; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">취소</button>
            </div>
		</form>
		<!-- 곡 리스트 -->

		<div id="content2"></div>


		<!-- 풋터 -->

	</div>
		<jsp:include page="../footer.jsp" />

</body>

</html>