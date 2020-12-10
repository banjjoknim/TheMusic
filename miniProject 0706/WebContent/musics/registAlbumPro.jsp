<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
    <%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Regist Music</title>
</head>
<body>
<%
MultipartRequest multi
= new MultipartRequest(request, application.getRealPath("/files/albums"), 1024*1024*20 ,"utf-8" ,new DefaultFileRenamePolicy());

    Class.forName("oracle.jdbc.driver.OracleDriver");
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");
    request.setCharacterEncoding("utf-8");
	String sql = "insert into albums values(ALBUMS_SEQ.nextval, ? ,? ,? ,sysdate ,? ,? ,? ,? ,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, multi.getParameter("title")); 
	pstmt.setString(2, (String)session.getAttribute("id"));
	pstmt.setString(3, multi.getParameter("genre"));
	/* pstmt.setString(5, "sysdate"); */
	pstmt.setString(4, multi.getFilesystemName("imageFile"));
	pstmt.setInt(5, 0);
	
	PreparedStatement pstmtUser = conn.prepareStatement("SELECT * FROM users where user_id = ?");
	pstmtUser.setString(1, (String)session.getAttribute("id"));
	ResultSet rsUser = pstmtUser.executeQuery();
	if(rsUser.next()) {
		if(rsUser.getString("member_type").equals("normal")) {
			pstmt.setString(6, "Free");
			pstmt.setInt(7, 0); //price 값 0원
		} else if(rsUser.getString("member_type").equals("seller")){
			pstmt.setString(6, multi.getParameter("commercial"));
			if(multi.getParameter("commercial").equals("free")) {
				pstmt.setInt(7, 0);
			} else {
			pstmt.setInt(7, Integer.parseInt(multi.getParameter("price")));
			}
		}
	}
	
	pstmt.setString(8, multi.getParameter("introduction"));
	pstmt.executeQuery();
	response.sendRedirect("registAlbumResult.jsp");
	
	
    %>
</body>
</html>