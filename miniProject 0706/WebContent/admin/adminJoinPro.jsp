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
<link rel="stylesheet" href="../css/adminUpdate.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Admin</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt = null;
	ResultSet userUp = null;

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");

	String sql = "INSERT INTO users(no, user_id, password, name, nickname, emailfirst, emailsecond, phone, gender, member_type, regdate)  values(users_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("adminId"));
	pstmt.setString(2, request.getParameter("Password"));
	pstmt.setString(3, request.getParameter("name"));
	pstmt.setString(4, request.getParameter("nickName"));
	pstmt.setString(5, request.getParameter("emailFirst"));
	pstmt.setString(6, request.getParameter("emailSecond"));
	pstmt.setString(7, request.getParameter("phone"));
	pstmt.setString(8, request.getParameter("gender"));
	pstmt.setString(9, request.getParameter("membertype"));
	pstmt.executeUpdate();
	response.sendRedirect("adminPageU.jsp");
	%>
	
	
</body>
</html>