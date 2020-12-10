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
<title>Insert title here</title>
</head>
<body>
<%
Integer musicNo = Integer.parseInt(request.getParameter("no"));

ArrayList<Music> cartList = (ArrayList<Music>)session.getAttribute("cartList");
Music addedMusic = new Music();
for(int i = 0; i<cartList.size(); i++) {
	addedMusic = cartList.get(i);
	if(addedMusic.getNo()==musicNo) {
		cartList.remove(addedMusic);
	}
}
int index = Integer.parseInt(request.getParameter("index"));
response.sendRedirect("musicCart.jsp#index"+index);
%>
</body>
</html>