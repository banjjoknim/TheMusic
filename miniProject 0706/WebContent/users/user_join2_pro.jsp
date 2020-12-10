<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user join pro</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");


String sql = "INSERT INTO users values(users_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, request.getParameter("newId"));
pstmt.setString(2, request.getParameter("newPassword"));
pstmt.setString(3, request.getParameter("name"));
pstmt.setString(4, request.getParameter("nickName"));
pstmt.setString(5, request.getParameter("country"));
pstmt.setString(6, request.getParameter("emailFirst"));
pstmt.setString(7, request.getParameter("emailSecond"));
pstmt.setString(8, request.getParameter("phone"));
pstmt.setString(9, request.getParameter("gender"));
pstmt.setString(10, "userDefaultImage.png");
pstmt.setString(11, "normal");
pstmt.executeQuery();
session.setAttribute("id", request.getParameter("newId"));
response.sendRedirect("user_join_result.jsp");
%>
</body>
</html>