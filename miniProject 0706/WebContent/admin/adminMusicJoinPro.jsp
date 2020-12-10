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
<title>Insert title here</title>
</head>
<body>
<% 
MultipartRequest multi
= new MultipartRequest(request, application.getRealPath("/files/musics"), 1024*1024*20 ,"utf-8" ,new DefaultFileRenamePolicy());

    Class.forName("oracle.jdbc.driver.OracleDriver");
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");
    request.setCharacterEncoding("utf-8");
	String sql = "insert into musics values(MUSICS_SEQ.nextval, ? ,? ,? ,? ,sysdate ,? ,? ,? ,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, multi.getParameter("title")); 
	pstmt.setString(2, multi.getParameter("albumTitle"));
	pstmt.setString(3, (String)session.getAttribute("id"));
	pstmt.setString(4, multi.getParameter("genre"));
	pstmt.setString(5, multi.getFilesystemName("musicFile"));
	pstmt.setString(6, multi.getFilesystemName("imageFile"));
	
	PreparedStatement pstmtUser = conn.prepareStatement("SELECT * FROM users where user_id = ?");
	pstmtUser.setString(1, (String)session.getAttribute("id"));
	ResultSet rsUser = pstmtUser.executeQuery();
	if(rsUser.next()) {
		if(rsUser.getString("member_type").equals("normal")) {
			pstmt.setString(7, "Free");
			pstmt.setInt(8, 0); //price 값 0원
		} else if(rsUser.getString("member_type").equals("seller")){
			pstmt.setString(7, multi.getParameter("commercial"));
			if(multi.getParameter("commercial").equals("free")) {
				pstmt.setInt(8, 0);
			} else {
			pstmt.setInt(8, Integer.parseInt(multi.getParameter("price")));
			}
		}
	}
	
	pstmt.executeQuery();
	response.sendRedirect("adminPageM.jsp");
	%>
</body>
</html>