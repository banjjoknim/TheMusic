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
		<form action="adminsellerDeletePro.jsp" method="post">
		<div id="content1">

			<h1 style="text-align: left;">판매자 정보 열람</h1>
			<%
				request.setCharacterEncoding("UTF-8");
			PreparedStatement pstmt = null;
			ResultSet sellerList = null;

			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");

			pstmt = conn.prepareStatement("SELECT * FROM SELLERS");
			sellerList = pstmt.executeQuery();
			%>
			<table style="border: 1px solid black; margin: 0px;">
				<tr>
				<th scope="col" style="width: 30px;"><input type="checkbox"
						class="AllClick" name="all_select" value="all_select"></th>
					<th style="width: 30px;">No</th>
					<th style="width: 100px;">유저아이디</th>
					<th style="width: 80px;">이메일아이디</th>
					<th style="width: 80px;">이메일주소</th>
					<th style="width: 80px;">핸드폰번호</th>
					<th style="width: 80px;">닉네임</th>
					<th style="width: 80px; overflow:hidden;">소개</th>
					<th style="width: 100px;">은행</th>
					<th style="width: 100px;">계좌번호</th>
				</tr>

				<%
					while (sellerList.next()) {
				%>
				<tr>
				<td><input type="checkbox" class="memberChk" name="select1" value="<%=sellerList.getInt("no")%>">
					</td>
					<td><%=sellerList.getInt("no")%></td>
					<td><%=sellerList.getString("user_id")%></td>
					<td><%=sellerList.getString("emailfirst")%></td>
					<td><%=sellerList.getString("emaisecond")%></td>
					<td><%=sellerList.getString("phone")%></td>
					<td><%=sellerList.getString("nickname")%></td>
					<td><%=sellerList.getString("introduction")%></td>
					<td><%=sellerList.getString("bank")%></td>
					<td><%=sellerList.getString("account_number")%></td>
				</tr>
				<%
					}
				sellerList.close();
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
						OnClick="location.href='adminPageA.jsp'"> Albums</li>
						<li><input type="radio" name="result" value="Sellers"
						checked="checked" OnClick="location.href='adminPageA.jsp'"> Sellers</li>
				</ul>
				<a href="adminSellerJoin.jsp"><button id="button" type="button"
					style="margin-right: 10px;">추가</button></a>
				<button id="button" type="submit">삭제</button>
			</div>
		</div>
		</form>
	</div>
</body>
</html>