<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resist Seller Result</title>
    <link rel="stylesheet" href="../css/registMusic.css">
    <link rel="stylesheet" href="../css/basic_setting.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>
td a {
	color: cornsilk;
}
	body{
background-image: url(../files/header/3.jpg);
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

        <h1 id="header_info">음악 및 앨범 등록</h1>

    </div>

    <!-- 컨테이너 -->

    <div id="container">
    <%if(session.getAttribute("id")==null) {%>
		<h1 style="color: cornsilk;">비로그인 상태</h1>
		
		<div id="content1" style="border: none;">
				<%String pathJoin = request.getContextPath()+"/users/user_join1.jsp"; 
				String pathLogin = request.getContextPath()+"/users/login.jsp"; %>

			<i class="material-icons"
				style="user-select: none; font-size: 140px; color: coral; display: block; margin: 0 auto;">lock</i>
			<h1>현재 <a href="<%=pathLogin%>" style="color: coral;">로그인</a>이 되어있지 않습니다.</h1>
			<h1 style="font-size: 13pt;">
				비로그인 상태에서는 업로드를 할 수 없습니다.<br>업로드는
				<a style="color: coral; text-decoration: underline;"
					href="<%=pathJoin%>">회원가입</a>이후에 할 수 있습니다.
			</h1>

			<div id="content1_Resist_Seller_Result"></div>

		</div>
		<%} else { %>
<h1 style="color: cornsilk;">업로드 타입 선택</h1>


            <div id="content3">
            <a href="registAlbum.jsp"><button id="confirm_button" type="submit">
                <i class="material-icons" style="font-size: 100px; color: rgb(236, 34, 34); display: block; padding-top:50px;">album</i>
                <span
                    style="display: block; font-size: 40pt; color: cornsilk; float: left; margin: 14px; padding: 10px 60px;">앨범</span></button></a>
            <a href="registMusic.jsp"><button id="cancel_button" type="submit">
                <i class="material-icons" style="font-size: 100px; color: rgb(236, 34, 34); display: block; padding-top:50px;">music_note</i>
                <span
                    style="display: block; font-size: 40pt; color: cornsilk; float: left; margin: 14px; padding: 10px 60px;">음악</span></button></a>
        </div>
<%} %>
        <!-- 풋터 -->
    </div>

        <jsp:include page="../footer.jsp"/>

</body>

</html>