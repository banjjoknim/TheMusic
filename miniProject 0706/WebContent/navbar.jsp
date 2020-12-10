    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>navbar</title>
<link rel="stylesheet" href="css/basic_setting.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

<%

String menu1 = null; 
String menu2 = null;
String menu3 = null;
String urlJoin = null;
String urlLogin = null;
String urlCart = null;
if(session.getAttribute("id")!=null){
	menu1 = "로그아웃";
	menu2 = (String)session.getAttribute("id")+"님";
	menu3 = "쇼핑카트";
	urlJoin = request.getContextPath()+"/users/logout.jsp";
	urlLogin = request.getContextPath()+"/users/user_info.jsp";
	urlCart = request.getContextPath()+"/musics/musicCart.jsp";
} else {
	menu1 = "회원가입";
	menu2 = "로그인";
	urlJoin = request.getContextPath()+"/users/user_join1.jsp";
	urlLogin = request.getContextPath()+"/users/login.jsp";
	
}
String urlSeller = request.getContextPath()+"/sellers/Resist_Seller1.jsp";
String urlUpload = request.getContextPath()+"/musics/chooseUploadType.jsp";
String urlHome = request.getContextPath()+"/main_page.jsp";
%>

<header id="nav_bar">
        <div class="nav_bar_wrapper">
            <h1 id="nav_bar_h1" style="font-family:'Franklin Gothic Medium'"><a href="<%=urlHome%>" style="color:cornsilk;">THE MUSIC</a></h1>
            <nav>
                <ul class="nav_bar_menu">
                    <li><a href="">둘러보기</a></li>
                    <li><a href="<%=urlUpload%>">업로드</a></li>
                    <li><a href="<%=urlSeller%>">판매자 등록</a></li>
                </ul>
                <ul class="nav_bar_small_menu">
                    <li><a href="<%=urlJoin%>"><%=menu1 %></a></li>
                    <%if(session.getAttribute("id")!=null) { %>
                    <li><a href="<%=urlCart%>"><%=menu3 %></a></li>
                    <%} %>
                    <li><a href="<%=urlLogin%>"><%=menu2 %></a></li>
                </ul>
                <div class="nav_bar_wrap">
                <%String path = request.getContextPath(); %>
                <form action="<%=path %>/result/searchResultPro.jsp" method="GET">
                <ul class="nav_bar_small_menu">
                    <div class="nav_bar_search">
                    	<select class="nav_bar_select" name = "bySearch">
                    	<option style="outline:none;" value = "all">All</option>
                    	<option style="outline:none;" value = "title" >Title</option>
                    	<option style="outline:none;" value = "musicians">Musicians</option>
                    	<option style="outline:none;" value = "albums">Albums</option>
                    	</select>
    					<input type="text" name = "search_value" class="nav_bar_searchTerm" placeholder="검색어를 입력하세요.">
                        <button type="submit" class="nav_bar_searchButton"
                            style="cursor:pointer; border:0px transparent solid;">
                            <i class="material-icons" style="color: gray;">search</i>
                        </button>
                    </div>
                 </ul>
                 </form>
                </div>

            </nav>
            </div>
    </header>
</body>
</html>