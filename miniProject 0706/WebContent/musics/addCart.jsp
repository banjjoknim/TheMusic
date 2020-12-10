<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*,javax.servlet.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.jdbc.music.Music"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="../css/basic_setting.css">
<link rel="stylesheet" href="../css/cartList.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons"> -->
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="music" class="org.jdbc.music.Music" scope="request" />
	<%
	Integer musicNo = Integer.parseInt(request.getParameter("no"));
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");
	PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM MUSICS");
	ResultSet rs = pstmt.executeQuery();
	Music addedMusic = new Music();
	while (rs.next()) {
		if (rs.getInt(1) == musicNo) { 
			addedMusic = new Music(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
					rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), 
					rs.getInt(9), rs.getString(10), rs.getInt(11), rs.getString(12));
		}
	}
	%>
	<%
		ArrayList<Music> cartList = (ArrayList<Music>) session.getAttribute("cartList");
	
	if (cartList == null) {
		cartList = new ArrayList<Music>();
		
	}
	int cnt = 0;
	if (cnt == 0) { 
		addedMusic.setQuantity(1);
		cartList.add(addedMusic);
		session.setAttribute("cartList", cartList);
	}
	response.sendRedirect("musicInfo.jsp?no="+session.getAttribute("musicNo")+"#"+musicNo);
	%>
	
   
	

</body>
</html>