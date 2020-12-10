<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");

	String sql = "select * from users where user_id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, (String) session.getAttribute("id"));
	
	ResultSet rs = pstmt.executeQuery();
	
	%>
<% while (rs.next()) {
		session.setAttribute("nickName", rs.getString("nickName"));
		session.setAttribute("emailFirst", rs.getString("emailFirst"));
		session.setAttribute("emailSecond", rs.getString("emailSecond"));
	}%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Regist Seller1</title>

<link rel="stylesheet" href="../css/Resist_Seller.css">
<link rel="stylesheet" href="../css/basic_setting.css">
</head>

<body>

	<!-- 네비게이션 바 -->

	<jsp:include page="../navbar.jsp" />




	<!-- 헤더 -->

	<div id="header">

		<h1 id="header_info">판매자 등록</h1>

	</div>

	<!-- 컨테이너 -->

	<div id="container">
		<h1>프로필 등록</h1>
		<form action="Resist_Seller2.jsp" method="GET">


			<!-- ==================================================

           
============================== -->

			<div id="content1_profile"></div>

			<!-- 확인 취소 버튼 -->

			<div id="content3">
				<button type="submit"
					style="font-size: 13pt; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">다음</button>
				<button type="reset"
					style="font-size: 13pt; margin-left: 30px; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">취소</button>
			</div>
		</form>

		<!-- 풋터 -->


		<jsp:include page="../footer.jsp" />

	</div>
</body>

</html>