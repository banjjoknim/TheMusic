<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보</title>
    <link rel="stylesheet" href="../css/user_info.css">
    <link rel="stylesheet" href="../css/basic_setting.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>
body{
background-image: url(../files/main/12.jpg);
background-size: 100% 100%;
background-repeat: no-repeat;
}
ul.join_box li{
font-weight: bold;
}
</style>
</head>

<body>
    <!-- 네비게이션 바 -->

    <jsp:include page="../navbar.jsp"/>


    <!-- 헤더 -->

    <div id="header">

        <h1><span style="color:cornsilk;">회원정보</span></h1>

    </div>

     <!-- 컨테이너 -->

     <div id="container">
        <form action="user_update.jsp" method="POST"> 
        <!-- 회원 정보 확인-->
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");
String sql = "SELECT * FROM users where user_id = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, (String)session.getAttribute("id")); //원본
ResultSet rs = pstmt.executeQuery();
while(rs.next()){
%>
        <div id="content1">
           
            <div id = content1_form>
                <fieldset style="border: none;">
                    <ul class="join_box">
                    <li>
                        <img id="newImage" src="../files/users/<%=rs.getString("user_image_file") %>" width="350px" height="350px" style="display: block; margin: 0 auto;">
                        </li>
                        <li>
                            <label class="reg" for="user_name"><span style="font-weight: bold; font-size: 16pt;">아이디</span></label>
                            <span style="font-weight: bold; font-size: 16pt;"><%=rs.getString("user_id") %></span>
                        </li>
                        <li>
                            <label class="reg" for="user_name"><span style="font-weight: bold; font-size: 16pt;">이름</span></label>
                            <span style="font-weight: bold; font-size: 16pt;"><%=rs.getString("name") %></span>
                        </li>
                        <li>
                            <label class="reg" for="user_name"><span style="font-weight: bold; font-size: 16pt;">닉네임</span></label>
                            <span style="font-weight: bold; font-size: 16pt;"><%=rs.getString("nickName") %></span>
                        </li>
                        <li>
                            <label class="reg" for="user_name"><span style="font-weight: bold; font-size: 16pt;">국가</span></label>
                            <span style="font-weight: bold; font-size: 16pt;"><%=rs.getString("country") %></span>
                        </li>
                        <li>
                            <label class="reg" for="user_mail"><span style="font-weight: bold; font-size: 16pt;">메일 주소</span></label>
                            <span style="font-weight: bold; font-size: 16pt;"><%=rs.getString("emailFirst") %>@<%=rs.getString("emailSecond") %></span>
                        </li>
                        <li>
                            <label class="reg" for="user_tel"><span style="font-weight: bold; font-size: 16pt;">휴대폰</span></label>
                            <span style="font-weight: bold; font-size: 16pt;"><%=rs.getString("phone") %></span>
                            <span style="font-size: small; color: gray; margin-left: 10px; color : cornsilk;"></span>
                        </li>
                        <li>
                            <label class="reg" for="user_gender"><span style="font-weight: bold; font-size: 16pt;">성별</span></label>
                            <span style="font-weight: bold; font-size: 16pt;"><%=rs.getString("gender") %></span>
                        </li>
                        <li>
                            <label class="reg" for="memberType"><span style="font-weight: bold; font-size: 16pt;">멤버타입</span></label>
                            <span style="font-weight: bold; font-size: 16pt;"><%=rs.getString("member_type") %></span>
                        </li>
                    </ul>
                </fieldset>
               </div>
               </div>
            
        <!-- 곡 리스트 -->

        <div id="content3">
                <button type="submit" 
                    style="font-size: 13pt; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">정보수정</button>
                <button type="reset"
                    style="font-size: 13pt; margin-left: 30px; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">취소</button>
            </div>
</form>
<%} %>
        
        <!-- 풋터 -->
        
        </div>
        <jsp:include page="../footer.jsp"/>
        
</body>

</html>