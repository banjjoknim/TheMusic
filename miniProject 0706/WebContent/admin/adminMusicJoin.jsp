<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="org.jdbc.music.*,org.jdbc.users.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/basic_setting.css">
<link rel="stylesheet" href="../css/adminMusicJoin.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Admin</title>
</head>
<body>
<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");

	String sql = "select * from users where user_id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, (String) session.getAttribute("id"));
	ResultSet rs = pstmt.executeQuery();%>
	
	<jsp:include page="../navbar.jsp" />

	<!-- 헤더 -->

	<div id="header">

		<h1 id="header_info">관리자모드</h1>

	</div>
	<div id="container">
		<form action="adminMusicJoinPro.jsp" method="POST" enctype="multipart/form-data">
			<div id="content1_product">
				<table
					style="border: 1px solid gray; margin: 0 auto; border-collapse: collapse;">
					<tr>
						<td rowspan="7" style="width: 200px; height: 200px;"><img
							id="content1_product_picture" src="Desert.jpg" width="200px"
							height="200px"></td>

						<td style="border: gray 1px solid;">Title</td>
						<td style="border: gray 1px solid;"><input type="text"
							id="title" name="title" style="height: 20px;"></td>
					</tr>
					<tr>
						<td style="border: gray 1px solid;">Album Title</td>
						<td style="border: gray 1px solid;"><input type="text"
							id="title" name="albumTitle" style="height: 20px;"></td>
					</tr>
					<%if (rs.next()) {%>
					<tr>
						<td style="border: gray 1px solid;">Artist(NickName)</td>
						<td style="border: gray 1px solid;"><%=rs.getString("nickName") %></td>
					</tr>
					
					<%} %>
					
					<tr>
						<td style="border: gray 1px solid;">Genre</td>
						<td style="border: gray 1px solid; padding: 5px;"><input
							type="checkbox" id="Ballad" name="genre" value="Ballad" checked>
							<label for="Ballad">Ballad&nbsp;</label> <input type="checkbox"
							id="Hiphop" name="genre" value="Hiphop"> <label
							for="Hiphop">Hiphop&nbsp;</label> <input type="checkbox"
							id="Rock/Metal" name="genre" value="Rock/Metal"> <label
							for="Rock/Metal">Rock/Metal&nbsp;</label><br> <input
							type="checkbox" id="R&B/Soul" name="genre" value="R&B/Soul">
							<label for="R&B/Soul">R&B/Soul&nbsp;</label> <input
							type="checkbox" id="Dance" name="genre" value="Dance"> <label
							for="Dance">Dance&nbsp;</label></td>
					</tr>
					<tr>
						<td style="border: gray 1px solid;">Commercial</td>
						<td style="border: gray 1px solid; padding-bottom: 30px; vertical-align: middle;"><input type="radio"
							id="commercial" name="commercial" value="pay"
							style="height: 20px;"> <label  for="commercial">Pay</label>
							<input type="text" name="price"> <input  type="radio"
							id="notCommercial" name="commercial" value="free"
							style="height: 20px;"> <label for="notCommercial">Free</label></td>
					</tr>
					
					<tr>
						<td style="border: gray 1px solid;">Choose Music File</td>
						<td style="border: gray 1px solid;"><input type="file"
							name="musicFile"></td>
					</tr>
					<tr>
						<td style="border: gray 1px solid;">Choose image File</td>
						<td style="border: gray 1px solid;"><input type="file"
							name="imageFile"></td>
					</tr>
					
				</table>
			</div>
			<div id="content3">
				<button type="submit"
					style="font-size: 13pt; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">확인</button>
				<button type="reset"
					style="font-size: 13pt; margin-left: 30px; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">취소</button>
			</div>
		</form>
	</div>





</body>
</html>