<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/user_info.css">
    <link rel="stylesheet" href="../css/basic_setting.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>
    td{color: cornsilk; padding:20px;}
    body{
background-image: url(../files/main/1.jpg);
background-size: 100% 100%;
background-repeat: no-repeat;
}
    </style>
</head>
<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");
	
	String sql = "select * from users where nickName = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("nickName"));
	ResultSet rsNowUser = pstmt.executeQuery();
	%>
<body>
	<!-- 네비게이션 바 -->

	<jsp:include page="../navbar.jsp" />




	<!-- 헤더 -->

	<div id="header">

		<h1 id="header_info">유저 프로필</h1>

	</div>


	<!-- 컨테이너 -->

	<div id="container">

		<!-- 프로필 입력 -->
		<%if(rsNowUser.next()) { %>
		<h1 style="color: cornsilk;">프로필 내용</h1>

		<div id="content1_profile">
			<table
				style="border: 1px solid gray; margin: 0 auto; border-collapse: collapse; width: 85%;">
				<tr>
					<td rowspan="4" style="width: 200px; height: 200px;">
					<img id="content1_profile_picture" src="../files/users/<%=rsNowUser.getString("user_image_file")%>" width="200px"
						height="200px"></td>

					<td style="border: gray 1px solid; color:cornsilk; width: 120px;">닉네임</td>
					<td style="border: gray 1px solid;"><%=rsNowUser.getString("nickName")%>
					</td>
				</tr>
				<tr>
					<td style="border: gray 1px solid;">이메일</td>
					<td style="border: gray 1px solid;"><%=rsNowUser.getString("emailFirst")%>@<%=rsNowUser.getString("emailSecond")%>
					</td>
				</tr>
				<tr>
					<td style="border: gray 1px solid;">연락처</td>
					<td style="border: gray 1px solid;"><%=rsNowUser.getString("phone")%>
					</td>
				</tr>

				<tr>
					<td style="border: gray 1px solid;">관심 장르</td>
					<td style="border-right: gray 1px solid; padding: 5px;"></td>
				</tr>
				<tr>
					<td style="border: gray 1px solid;"><span
						style="font-weight: bold; font-size: 20pt;">소개</span></td>
					<td colspan="3" style="border-right: gray 1px solid;">
					<textarea readonly
							id="content1_profile_introduction" name="introduction"
							style="resize: none; outline: none; float: left; background-color: transparent; width: 95%; height: 100px; border: none;"
							><%-- <%=rsNowUser.getString("introduction") %> --%></textarea></td>
				</tr>
			</table>
		</div>


		<%}%>


		<div id="content3">
			<button type="button"
				style="font-size: 13pt; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">팔로우</button>
			<a href="<%=request.getContextPath()+"/main_page.jsp"%>">
			<button type="button"
				style="font-size: 13pt; margin-left: 30px; outline: none; font-weight: bold; width: 110px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">
				메인으로</button></a>
		</div>


		<!-- 풋터 -->

		<jsp:include page="../footer.jsp" />
	</div>













</body>
</html>