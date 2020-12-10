<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="org.jdbc.music.*,org.jdbc.users.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/basic_setting.css">
<link rel="stylesheet" href="../css/adminPage.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Admin</title>
</head>
<body>
	<jsp:include page="../navbar.jsp" />

	<!-- 헤더 -->

	<div id="header">

		<h1 id="header_info">관리자모드</h1>

	</div>

	<!-- 컨테이너 -->

	<div id="container">
		<form action="adminAlbumDeletePro.jsp" method="post">
		<div id="content1">

			<h1 style="text-align: left;">앨범 정보 열람</h1>
			<%
				request.setCharacterEncoding("UTF-8");
			PreparedStatement pstmt = null;
			ResultSet albumList = null;

			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");

			pstmt = conn.prepareStatement("SELECT * FROM ALBUMS");
			albumList = pstmt.executeQuery();
			%>
			<table style="border: 1px solid black;">
				<tr>
				<th scope="col" style="width: 30px;"><input type="checkbox"
						class="AllClick" name="all_select" value="all_select"></th>
					<th style="width: 30px;">No</th>
					<th style="width: 100px;">타이틀</th>
					<th style="width: 100px;">유저아이디</th>
					<th style="width: 80px;">장르</th>
					<th style="width: 80px;">앨범사진</th>
					<th style="width: 80px;">좋아요</th>
					<th style="width: 80px;">유/무료</th>
					<th style="width: 80px;">가격</th>
					<th style="width: 80px; overflow:hidden;">소개</th>
					<th style="width: 100px;">등록일</th>
				</tr>

				<%
					while (albumList.next()) {
				%>
				<tr>
				<td><input type="checkbox" class="memberChk" name="select1" value="<%=albumList.getInt("no")%>">
					</td>
					<td><%=albumList.getInt("no")%></td>
					<td><%=albumList.getString("title")%></td>
					<td><%=albumList.getString("user_id")%></td>
					<td><%=albumList.getString("genre")%></td>
					<td><%=albumList.getString("album_image_file")%></td>
					<td><%=albumList.getInt("likes")%></td>
					<td><%=albumList.getString("commercial")%></td>
					<td><%=albumList.getInt("price")%></td>
					<td><%=albumList.getString("introduction")%></td>
					<td><%=albumList.getString("realese_date")%></td>

				</tr>
				<%
					}
				albumList.close();
				pstmt.close();
				conn.close();
				%>
			</table>
		</div>
	<div id="content2">
			<div id="left_sidebar" >
				<ul>
					<li><strong>FILTER</strong>
						<p>Type</p>
					<li><input type="radio" name="result" value="Users"
						OnClick="location.href='adminPageU.jsp'"> Users</li>
					<li><input type="radio" name="result" value="Musicians"
						OnClick="location.href='adminPageM.jsp'">
						Music</li>
					<li><input type="radio" name="result" value="Albums"
						checked="checked" OnClick="location.href='adminPageA.jsp'"> Albums</li>
					<li><input type="radio" name="result" value="Sellers"
						OnClick="location.href='adminPageS.jsp'"> Sellers</li>
				</ul>
				<a href="adminAlbumJoin.jsp"><button id="button" type="submit"
					style="margin-right: 10px;">추가</button></a>
				<button id="button" type="submit">삭제</button>
			</div>
		</div>
		</form>
	</div>
</body>
</html>