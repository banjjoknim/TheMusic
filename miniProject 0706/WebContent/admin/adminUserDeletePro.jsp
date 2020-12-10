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
	Integer userNo = Integer.parseInt((String) request.getParameter("select1"));
	
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt = null;
	ResultSet userUp = null;

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");

	String sql = "DELETE FROM USERS WHERE NO = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, userNo);
	pstmt.executeUpdate();
	response.sendRedirect("adminPageU.jsp");
	%>
</body>
</html>