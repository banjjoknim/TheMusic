<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*,javax.servlet.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.jdbc.music.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");
%>
<%
int albumNo = Integer.parseInt(request.getParameter("no"));
String albumTitle = request.getParameter("title");
	String nickName = request.getParameter("nickName");
	
if(request.getParameter("musicNo")!=null){
	Integer musicNo = Integer.parseInt(request.getParameter("musicNo"));
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
response.sendRedirect("albumInfo.jsp?no="+albumNo+"&title="+albumTitle+"&nickName="+nickName+"#"+musicNo);
	
	
	
}
	%>






<%if(request.getParameter("album").equals("yes")) {
	PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM musics inner join users on musics.user_id = users.user_id where album_title = ? and nickName = ?");
	pstmt.setString(1, albumTitle);
	pstmt.setString(2, nickName);
	ResultSet rs = pstmt.executeQuery();
	Music addedMusic = new Music();
	ArrayList<Music> cartList = (ArrayList<Music>) session.getAttribute("cartList");
if (cartList == null) {
	cartList = new ArrayList<Music>();
	
}
	while (rs.next()) {
			addedMusic = new Music(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
					rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), 
					rs.getInt(9), rs.getString(10), rs.getInt(11), rs.getString(12));

int cnt = 0;
if (cnt == 0) { 
	addedMusic.setQuantity(1);
	cartList.add(addedMusic);
	session.setAttribute("cartList", cartList);
}
	}
	response.sendRedirect("albumInfo.jsp?no="+albumNo+"&title="+albumTitle+"&nickName="+nickName);
}
	%>
</body>
</html>