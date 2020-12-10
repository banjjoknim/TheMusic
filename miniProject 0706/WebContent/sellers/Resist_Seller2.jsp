<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Regist Seller2</title>
<link rel="stylesheet" href="../css/Resist_Seller.css">
<link rel="stylesheet" href="../css/basic_setting.css">
<style>
    #container{
    background-image: url(../files/main/5.jpg);
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

		<h1 id="header_info">판매자 등록</h1>

	</div>


	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");

	String sql = "select * from users where user_id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, (String)session.getAttribute("id"));
	ResultSet rs = pstmt.executeQuery();
	while (rs.next()) {
		session.setAttribute("nickName", rs.getString("nickName"));
		session.setAttribute("emailFirst", rs.getString("emailFirst"));
		session.setAttribute("emailSecond", rs.getString("emailSecond"));
	%>

	<!-- 컨테이너 -->

	<div id="container">
			<form action="Resist_Seller3.jsp?userId=${userId }&nickName=${nickName}" method="POST">

			<!-- 프로필 입력 -->


			<h1 style="color:cornsilk;">프로필 등록</h1>

			<div id="content1_profile">
				<table style="border: 1px solid gray; margin:0 auto; border-collapse: collapse;">
					<tr>
						<td rowspan="4" style="width: 200px; height: 200px;"><img
							id="content1_profile_picture" src="Desert.jpg" width="200px"
							height="200px"></td>

						<td style="border: gray 1px solid; width: 120px">이름</td>
						<td style="border: gray 1px solid;"><%=rs.getString("user_id")%>
						</td>
					</tr>
					<tr>
						<td style="border: gray 1px solid;">닉네임</td>
						<td style="border: gray 1px solid;"><%=rs.getString("nickName")%>
						</td>
					</tr>
					<tr>
						<td style="border: gray 1px solid;">연락처</td>
						<td style="border: gray 1px solid;"><%=rs.getString("phone")%>
						</td>
					</tr>
					
					<tr>
						<td style="border: gray 1px solid;">관심 장르 선택</td>
						<td style="border-right: gray 1px solid; padding: 5px;">
						<input type="radio" id="Ballad" name="interests" value="Ballad">
						<label for="Ballad">Ballad&nbsp;</label>
						<input type="radio" id="Hiphop" name="interests" value="Hiphop"> 
						<label for="Hiphop">Hiphop&nbsp;</label>
						<input type="radio" id="Rock/Metal" name="interests" value="Rock/Metal">
						<label for="Rock/Metal">Rock/Metal&nbsp;</label>
						<input type="radio" id="R&B/Soul" name="interests" value="R&B/Soul">
						<label for="R&B/Soul">R&B/Soul&nbsp;</label>
						<input type="radio" id="Dance" name="interests" value="Dance"> 
						<label for="Dance">Dance&nbsp;</label>
						

						</td>
					</tr>
					<tr>
						<td style="border: gray 1px solid;">
							<span style="font-weight:bold; font-size:20pt;">소개</span>
						</td>
						<td colspan="3" style="border-right: gray 1px solid;"><textarea
								id="content1_profile_introduction" name="introduction"
								style="resize: none; outline: none; float: left; width: 100%; height: 100px; border: none;"
								placeholder="소개글을 입력해주세요."></textarea></td>
					</tr>
				</table>
			</div>
				

<%}%>

			<!-- 확인 취소 버튼 -->

			<div id="content3">
				<button type="submit"
					style="font-size: 13pt; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">다음</button>
				<button type="reset"
					style="font-size: 13pt; margin-left: 30px; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">취소</button>
			</div>
			</form>
		

		<!-- 풋터 -->
	</div>

		<jsp:include page="../footer.jsp" />
</body>

</html>