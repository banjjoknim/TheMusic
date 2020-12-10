<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");

	String sql = "select * from users where user_id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, (String) session.getAttribute("id"));
	ResultSet rs = pstmt.executeQuery();%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Regist Music</title>
<link rel="stylesheet" href="../css/registMusic.css">
<link rel="stylesheet" href="../css/basic_setting.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<style>
	body{
background-image: url(../files/header/3.jpg);
background-size: 100% 100%;
background-repeat: no-repeat;
}
	</style>
</head>

<body>

	<!-- 네비게이션 바 -->

	<jsp:include page="../navbar.jsp" />




	<!-- 헤더 -->

	<div id="header">

		<h1 id="header_info">음악 등록</h1>

	</div>

	<!-- 컨테이너 -->

	<div id="container">


		<!-- 상태표시글 -->
		<%if(session.getAttribute("id")==null) {%>
		<h1 style="color: cornsilk;">비로그인 상태</h1>
		<%} else { %>
		<h1 style="color: cornsilk;">곡 상세정보 입력</h1>
		<%} %>
		<form action="registMusicPro.jsp" method="POST"
			enctype="multipart/form-data">

			<%if (rs.next()) {%>
			<div id="content1_product">
				<table
					style="border: 1px solid gray; margin: 0 auto; border-collapse: collapse;">
					<tr>
						<td rowspan="2" style="width: 200px; height: 200px;"><img
							id="content1_product_picture" width="200px"
							height="200px"></td>
						<td style="border: gray 1px solid;">Choose image File</td>
						<td style="border: gray 1px solid;"><input type="file"
							name="imageFile" accept="image/*" onchange="setThumbnail(event);"></td>
					</tr>
					<tr>
		<td style="border: gray 1px solid;">Choose Music File</td>
			<td style="border: gray 1px solid;"><input type="file"
				name="musicFile" accept="audio/*"></td>
		</tr>
					<tr>
			<td colspan="2" style="border: gray 1px solid;">Title</td>
			<td style="border: gray 1px solid;"><input type="text"
				id="title" name="title" style="height: 20px;"></td>
		</tr>
					<tr>
			<td colspan="2" style="border: gray 1px solid;">Album Title</td>
			<td style="border: gray 1px solid;"><input type="text"
				id="title" name="albumTitle" style="height: 20px;"></td>
		</tr>
		<tr>
			<td colspan="2" style="border: gray 1px solid;">Genre</td>
			<td style="border: gray 1px solid; padding: 5px;"><input
				type="radio" id="Ballad" name="genre" value="Ballad" checked>
				<label for="Ballad">Ballad&nbsp;</label> <input type="radio"
				id="Hiphop" name="genre" value="Hiphop"> <label for="Hiphop">Hiphop&nbsp;</label>
				<input type="radio" id="Rock/Metal" name="genre" value="Rock/Metal">
				<label for="Rock/Metal">Rock/Metal&nbsp;</label><br> <input
				type="radio" id="R&B/Soul" name="genre" value="R&B/Soul"> <label
				for="R&B/Soul">R&B/Soul&nbsp;</label> <input type="radio" id="Dance"
				name="genre" value="Dance"> <label for="Dance">Dance&nbsp;</label></td>
		</tr>
					<% if(rs.getString("member_type").equals("seller")) { %>
					<tr>
						<td colspan="2" style="border: gray 1px solid;">Commercial</td>
						<td style="border: gray 1px solid;"><input type="radio"
							id="commercial" name="commercial" value="pay"
							style="height: 20px;"> <label for="commercial">Pay</label>
							<input type="text" name="price"> <input type="radio"
							id="notCommercial" name="commercial" value="free"
							style="height: 20px;"> <label for="notCommercial">Free</label></td>
					</tr>
					<%} else {%>
					<tr>
						<td colspan="2" style="border: gray 1px solid;">Commercial</td>
						<td style="border: gray 1px solid;"><span
							style="font-size: 11pt; font-weight: bold; color: coral;">판매자
								등록이 되어있지 않아 유료로 곡을 등록할 수 없습니다.</span></td>
					</tr>
					<%} %>
					<tr>
						<td colspan="2" style="border: gray 1px solid;"><span
							style="font-weight: bold; font-size: 20pt;">소개</span></td>
						<td colspan="3" style="border-right: gray 1px solid;"><textarea
								id="content1_profile_introduction" name="introduction"
								style="resize: none; outline: none; float: left; width: 100%; height: 100px; border: none;"
								placeholder="소개글을 입력해주세요."></textarea></td>
					</tr>
				</table>
			</div>
			<!-- 추가 제거 버튼 -->
			<!-- <div id="button" style="height: 200px; border: 1px solid black; position: relative;">
                <button id="add_button" type="button">
                    <i class="material-icons" style="font-size: 34px; color: coral;">add</i>
                    <span
                        style="display: block; font-size: 13pt; color: cornsilk; float: left; margin: 14px;">추가</span></button>
                <button id="remove_button" type="button">
                    <i class="material-icons" style="font-size: 34px; color: coral;">remove</i>
                    <span
                        style="display: block; font-size: 13pt; color: cornsilk; float: left; margin: 14px;">제거</span></button>
            </div> -->



			<!-- 확인 취소 버튼 -->

			<div id="content3">
				<button id="confirm_button" type="submit">
					<i class="material-icons"
						style="font-size: 70px; color: rgb(236, 34, 34);">check</i> <span
						style="display: block; font-size: 25pt; color: cornsilk; float: left; margin: 14px;">등록완료</span>
				</button>
				<button id="cancel_button" type="submit">
					<i class="material-icons"
						style="font-size: 70px; color: rgb(236, 34, 34);">close</i> <span
						style="display: block; font-size: 25pt; color: cornsilk; float: left; margin: 14px;">취소</span>
				</button>
			</div>
		</form>
		<%} else { %>
		<div id="content1" style="border: none;">
			<%String pathJoin = request.getContextPath()+"/users/user_join1.jsp"; 
				String pathLogin = request.getContextPath()+"/users/login.jsp"; %>

			<i class="material-icons"
				style="user-select: none; font-size: 140px; color: coral; display: block; margin: 0 auto;">lock</i>
			<h1>
				현재 <a href="<%=pathLogin%>" style="color: coral;">로그인</a>이 되어있지
				않습니다.
			</h1>
			<h1 style="font-size: 13pt;">
				비로그인 상태에서는 업로드를 할 수 없습니다.<br>업로드는 <a
					style="color: coral; text-decoration: underline;"
					href="<%=pathJoin%>">회원가입</a>이후에 할 수 있습니다.
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
	<jsp:include page="../footer.jsp" />
	<script>
function setThumbnail(event) {
	var fileReader = new FileReader();
	fileReader.readAsDataURL(event.target.files[0]);
	fileReader.onload = function(event) {
		document.getElementById("content1_product_picture").src = event.target.result;
	}
}
</script>
</body>

</html>