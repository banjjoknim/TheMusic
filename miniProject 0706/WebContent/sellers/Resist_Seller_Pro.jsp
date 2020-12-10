<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Regist Seller Pro</title>
</head>
<body>
<%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");
    request.setCharacterEncoding("utf-8");
    
    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM sellers where user_id = ?");
    stmt.setString(1, (String)session.getAttribute("id"));
    ResultSet rs = stmt.executeQuery();
    if(rs.next()){%>
    	<script type="text/javascript">
    	alert("이미 판매자 등록이 되어있습니다.");
    	location.href="../main_page.jsp";
    	</script>
    <%} else {
	String sql = "insert into sellers values(sellers_seq.nextval,?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, (String)session.getAttribute("id"));
	pstmt.setString(2, (String)session.getAttribute("emailFirst"));
	pstmt.setString(3, (String)session.getAttribute("emailSecond"));
	pstmt.setString(4, request.getParameter("phone"));
	pstmt.setString(5, (String)session.getAttribute("nickName"));
	pstmt.setString(6, (String)session.getAttribute("introduction"));
	pstmt.setString(7, request.getParameter("bank"));
	pstmt.setString(8, request.getParameter("account_number"));
	pstmt.executeQuery();
	pstmt = conn.prepareStatement("UPDATE users SET member_type = 'seller'");
	pstmt.executeUpdate();
	response.sendRedirect("Resist_Seller_Result.jsp");
    }%>
</body>
</html>