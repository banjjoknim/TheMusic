<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보</title>
<link rel="stylesheet" href="../css/user_info.css">
<link rel="stylesheet" href="../css/basic_setting.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>


<body>
	<!-- 네비게이션 바 -->

	<jsp:include page="../navbar.jsp" />


	<!-- 헤더 -->

	<div id="header">

		<h1>
			<span style="color: cornsilk;">회원정보수정</span>
		</h1>

	</div>

	<!-- 컨테이너 -->
	<%
	MultipartRequest multi
	= new MultipartRequest(request, application.getRealPath("")+"/files/users", 1024*1024*20 ,"utf-8" ,new DefaultFileRenamePolicy());
		Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");
    request.setCharacterEncoding("utf-8");
	String sql = "SELECT * FROM users where user_id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, (String)session.getAttribute("id")); //유저아이디는 세션으로 받아올 것.
	ResultSet rs = pstmt.executeQuery();
	String imageFile = null;
	String phone = null;
	if(rs.next()){
		session.setAttribute("imageFile", rs.getString("user_image_file"));
		phone = rs.getString("phone");
	}
	
	String script = "수정완료";
	
	if(multi.getParameter("nowPassword").equals((String)session.getAttribute("nowPassword"))){
	
	if(multi.getFilesystemName("newImage")!=null){
		pstmt = conn.prepareStatement("UPDATE users SET user_image_file = ? where user_id = ?");
		pstmt.setString(1, multi.getFilesystemName("newImage"));
		pstmt.setString(2, (String)session.getAttribute("id"));
		pstmt.executeUpdate();
	} else {
		pstmt = conn.prepareStatement("UPDATE users SET user_image_file = ? where user_id = ?");
		pstmt.setString(1, (String)session.getAttribute("imageFile"));
		pstmt.setString(2, (String)session.getAttribute("id"));
		pstmt.executeUpdate();
	}
	
	if (multi.getParameter("newPassword").equals("k")) { //조건이 안먹는다.
		if (multi.getParameter("newPassword").equals(multi.getParameter("newPasswordCheck"))) {
			sql = "UPDATE users SET password = ? where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("newPassword"));
			pstmt.setString(2, (String)session.getAttribute("id"));
			pstmt.executeUpdate();
		} else {
			out.print("<script>alert('새 비밀번호와 비밀번호 확인이 동일하지 않습니다.');history.back();</script>");
		}
		out.print("<script>alert('새 비밀번호와 비밀번호 확인이 동일하지 않습니다.');history.back();</script>");
	}
			%>
			
			
	<%
	if(multi.getParameter("newPassword").equals("") || multi.getParameter("newPassword")==null){
		sql = "UPDATE users SET password = ? where user_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, (String)session.getAttribute("nowPassword"));
		pstmt.setString(2, (String)session.getAttribute("id"));
		pstmt.executeUpdate();
	}
	


	if(!multi.getParameter("emailFirst").equals("") && !multi.getParameter("emailSecond").equals("")) {
		String newEmailFirst = multi.getParameter("emailFirst");
		String newEmailSecond = multi.getParameter("emailSecond");
		pstmt = conn.prepareStatement("SELECT user_id from users where emailFirst = ? and emailSecond = ?");
		pstmt.setString(1, newEmailFirst);
		pstmt.setString(2, newEmailSecond);
		ResultSet rs3 = pstmt.executeQuery();
		
		if(rs3.next()) {
			out.print("<script>alert('이미 등록된 이메일입니다.');history.back();</script>");
			%>
			
	<%} else {
	sql = "UPDATE users SET emailFirst = ?, emailSecond = ? where user_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, newEmailFirst);
	pstmt.setString(2, newEmailSecond);
	pstmt.setString(3, (String)session.getAttribute("id"));
	pstmt.executeUpdate();
		}
	}

	if(!multi.getParameter("phone").equals("")) {
		String newPhone = multi.getParameter("phone");
		pstmt = conn.prepareStatement("SELECT no from users where phone = ?");
		pstmt.setString(1, newPhone);
		ResultSet rs4 = pstmt.executeQuery();
		
		if(rs4.next()) {
			out.print("<script>alert('이미 등록된 전화번호입니다.');history.back();</script>");
			%>
			
	<% } else {
	 sql = "UPDATE users SET phone = ? where user_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, newPhone);
	pstmt.setString(2, (String)session.getAttribute("id"));
	pstmt.executeUpdate();
		}
	} else {
		sql = "UPDATE users SET phone = ? where user_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, phone);
		pstmt.setString(2, (String)session.getAttribute("id"));
		pstmt.executeUpdate();
	}
	
    response.sendRedirect("user_update_result.jsp");
	pstmt.close();
	rs.close();
	
	} else {
		%>

	<script>
	alert("현재 비밀번호가 틀립니다.");
	history.back();
	</script>
	
	<%} %>

</body>
</html>