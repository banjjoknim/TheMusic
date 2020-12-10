<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginPro</title>
</head>
<body>
	<!-- 회원여부 판별, 성공=>loginResult페이지
세션에 아이디 저장 -->

	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");
	request.setCharacterEncoding("utf-8");

	PreparedStatement pstmt = conn.prepareStatement("select * from users where user_id = ?");
	pstmt.setString(1, request.getParameter("id"));
	ResultSet rs = pstmt.executeQuery();

	String id = request.getParameter("id");
	String password = request.getParameter("password");

	/* request.setAttribute("id", id);
	request.setAttribute("pwd", password); */

	if (id != "") { /* adminPageU.jsp */
		if (rs.next()) {
			String memberType = rs.getString("member_type");
			if (memberType.equals("admin")) {
				response.sendRedirect("../admin/adminPageU.jsp");
				return;
			}
			if (id.equals(rs.getString(2)) && password.equals(rs.getString(3))) {
		session.setAttribute("id", id);
		response.sendRedirect("../main_page.jsp");
			} else {
		out.print("<script>alert('비밀번호가 틀렸습니다.');history.back();</script>");
			}
		} else {
			out.print("<script>alert('존재하지않는 아이디입니다.');history.back();</script>");
		}

	} else {
		out.print("<script>alert('아이디를 입력하십시오.');history.back();</script>");
	}
	%>

	<%
		rs.close();
	pstmt.close();
	conn.close();
	%>
</body>
</html>