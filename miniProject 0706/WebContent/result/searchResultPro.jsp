<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,java.net.*"%>
<%@ page import="org.jdbc.music.*,org.jdbc.users.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/basic_setting.css">
<link rel="stylesheet" href="../css/search_result.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String searchBy = request.getParameter("bySearch");
	String encodeBy= URLEncoder.encode(searchBy, "UTF-8");
	String searchV = request.getParameter("search_value");
	String encodeV= URLEncoder.encode(searchV, "UTF-8");
	
	
	String urlSearch = null;

	
	if (searchBy.equals("all")) {
		urlSearch ="searchAll.jsp?search_value=" + encodeV + "&bySearch=" + encodeBy;
	}else if (searchBy.equals("title")) {
		urlSearch ="searchTitle.jsp?search_value=" + encodeV + "&bySearch=" + encodeBy;
	}else if (searchBy.equals("musicians")) {
		urlSearch ="searchMusicians.jsp?search_value=" + encodeV + "&bySearch=" + encodeBy;
	}else if (searchBy.equals("albums")) {
		urlSearch ="searchAlbums.jsp?search_value=" + encodeV + "&bySearch=" + encodeBy;
	}
	
	
	response.sendRedirect(urlSearch);%>


</body>
</html>