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
	<form action="adminUserDeletePro.jsp" method="post">
		<div id="content1">

			<h1 style="text-align: left;">유저 정보 열람</h1>
			<%
				request.setCharacterEncoding("UTF-8");
			PreparedStatement pstmt = null;
			ResultSet userList = null;

			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");

			pstmt = conn.prepareStatement("SELECT * FROM USERS");
			userList = pstmt.executeQuery();
			%>


			<table>
				<tr>
					<th scope="col" style="width: 30px;"><input type="checkbox"
						class="AllClick" name="all_select" value="all_select"></th>
					<th style="width: 30px;">No</th>
					<th style="width: 100px;">유저아이디</th>
					<th style="width: 80px;">패스워드</th>
					<th style="width: 50px;">이름</th>
					<th style="width: 80px;">닉네임</th>
					<th style="width: 80px;">국가</th>
					<th style="width: 150px;">이메일아이디</th>
					<th style="width: 80px;">이메일주소</th>
					<th style="width: 200px;">핸드폰번호</th>
					<th style="width: 80px;">성별</th>
					<th style="width: 80px;">유저사진</th>
					<th style="width: 80px;">멤버유형</th>
					<th style="width: 150px;">가입일</th>
				</tr>

				<%
					while (userList.next()) {
				%>
				<tr>
					<td>
					<input type="checkbox" class="memberChk" name="select1" value="<%=userList.getInt("no")%>">
					</td>
					<td><%=userList.getInt("no")%></td>
					<td><%=userList.getString("user_id")%></td>
					<td><%=userList.getString("password")%></td>
					<td><%=userList.getString("name")%></td>
					<td><%=userList.getString("nickname")%></td>
					<td><%=userList.getString("country")%></td>
					<td><%=userList.getString("emailfirst")%></td>
					<td><%=userList.getString("emailsecond")%></td>
					<td><%=userList.getString("phone")%></td>
					<td><%=userList.getString("gender")%></td>
					<td><%=userList.getString("user_image_file")%></td>
					<td><%=userList.getString("member_type")%></td>
					<td><%=userList.getString("regdate")%></td>
				</tr>
				<%
					}
				userList.close();
				pstmt.close();
				conn.close();
				%>

			</table>
		</div>
		<div id="content2">
			<div id="left_sidebar">
				<ul>
					<li><strong>FILTER</strong>

						<p>Type</p>
					<li><input type="radio" name="result" value="Users"
						checked="checked" OnClick="location.href='adminPageU.jsp'">
						Users</li>
					<li><input type="radio" name="result" value="Musicians"
						OnClick="location.href='adminPageM.jsp'"> Music</li>
					<li><input type="radio" name="result" value="Albums"
						OnClick="location.href='adminPageA.jsp'"> Albums</li>
					<li><input  type="radio" name="result" value="Sellers"
						OnClick="location.href='adminPageS.jsp'"> Sellers</li>
				</ul>
				<a href="adminJoin.jsp"><button id="button" type="button" style="margin-right:10px;">추가</button></a>
			
				<button id="button" type="submit">삭제</button>
			</div>
	</div>
	</form>
	</div>
</body>
</html>