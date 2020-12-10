<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="org.jdbc.music.*,org.jdbc.users.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/basic_setting.css">
<link rel="stylesheet" href="../css/search_result.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<style>
    body{
    background-image: url(../files/main/1.jpg);
	background-size: 100% 100%;
	background-repeat: no-repeat;
    }
    </style>
<title>Search</title>
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
	menu2 = (String)session.getAttribute("id")+"님 안녕하세요.";
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
	<%
		request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String searchBy = (String)request.getParameter("bySearch");
	String searchV = (String)request.getParameter("search_value");
	

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");

		//넘어 온 값이 모두 null 일 때 
	if (searchBy == null && searchV == null) {
		pstmt = conn.prepareStatement(
		"SELECT * FROM musics m,users u where (m.user_id, m.realese_date) in (select m.user_id, max(m.realese_date) from musics group by m.user_id ) and m.user_id = u.user_id order by m.realese_date");
		//셀렉트 값이 null이고  검색 값이 null 일 때
	} else if (searchBy != null && searchV.equals("")) {
		pstmt = conn.prepareStatement(
		"SELECT * FROM musics m,users u where (m.user_id, m.realese_date) in (select m.user_id, max(m.realese_date) from musics group by m.user_id ) and m.user_id = u.user_id order by m.realese_date");
		//둘 다 값이 있을 때
	}else if (searchBy != null && !searchV.equals(searchV)) {
		pstmt = conn.prepareStatement(
		"SELECT * FROM musics m,users u where (m.user_id, m.realese_date) in (select m.user_id, max(m.realese_date) from musics group by m.user_id ) and m.user_id = u.user_id order by m.realese_date"); 
		//둘 다 값이 있을 때
	}else if (searchBy != null && searchV != null) {
		//셀렉트 값이 title 일 때  music,users가 조인된 테이블에서 검색한 값과 title속성에서 같은 값 가져오기
		if (searchBy.equals("all")) {
			pstmt = conn
			.prepareStatement("SELECT * FROM musics,users where upper(title) like upper(?) and musics.user_id = users.user_id");
			//셀렉트 값이 musicians 일 때  music,users가 조인된 테이블에서 검색한 값과  nickname 속성에서 같은 값 가져오기	
		}
		pstmt.setString(1, "%" + searchV + "%");
		
		
	}
	rs = pstmt.executeQuery();
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
                <form action="searchResultPro.jsp" method="POST">
                <ul class="nav_bar_small_menu">
                    <div class="nav_bar_search">
                    	<select class="nav_bar_select" name = "bySearch">
                    	<option style="outline:none;" value = "all"  selected>All</option>
                    	<option style="outline:none;" value = "title">Title</option>
                    	<option style="outline:none;" value = "musicians">Musicians</option>
                    	<option style="outline:none;" value = "albums">Albums</option>
                    	</select>
    					<input type="text" name = "search_value" class="nav_bar_searchTerm" value="<%=searchV%>" placeholder="검색어를 입력하세요.">
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

	

	<!-- 헤더 -->

	<div id="header">

		<h1>
			'<%=searchV%>' 검색결과
		</h1>

	</div>

	<!-- 컨테이너 -->


	<div id="container">
		<div id="content1" >
			<h1>Title</h1>
			<%
			int i = 0;
			if(rs.next() == false) {%>
			   <h1><span style="position: relative; bottom:40px; font-size:0.8em; ">'<%=searchV%>' 에 대한 검색결과가 없습니다.</span></h1>
			<% }else{
				do{ i = i + 1;%>
					<ul>
					<li>
					<a href="../musics/musicInfo.jsp?no=<%=rs.getInt("no") %>"><div class="img-content1 img1">
					<img
						src="../files/musics/<%=rs.getString("music_image_file")%>">
						
						<div class="darkness"></div>
						<!-- <div class="btn-plus" >
							<span draggable="false">▶</span>
						</div> -->
						</div></a>		
						<div class="img-with-text">
							<a href="../musics/musicInfo.jsp?no=<%=rs.getInt("no") %>" style="font-size:1em; font-weight:600; color:cornsilk;"><%=rs.getString(2)%></a>
						</div>
						<div class="img-with-text">
							<a href="../users/anotherUserInfo.jsp?nickName=<%=rs.getString("nickName") %>" style="color:gray;"><%=rs.getString("nickName")%></a>
						</div>
						</li>
				</ul>
				<%if(i==8) break; }while (rs.next()); 
			}
			rs.close();
			pstmt.close();
			
			%>
		</div>
		<div id="left_sidebar">
			<ul>
				<li><strong>FILTER</strong>

					<p>Type</p>
				<li><input type="radio" name="result" value="All_Categories" checked="checked" id="All_Categories"
					checked="checked" OnClick="location.href='searchAll.jsp?search_value=<%=searchV%>&bySearch=all'"><label for="All_Categories"> All Categories</label></li>
				<li><input type="radio" name="result" value="Title" id="Title"
					OnClick="location.href='searchTitle.jsp?search_value=<%=searchV%>&bySearch=title'"><label for="Title"> Title</label></li>
				<li><input type="radio" name="result" value="Musicians" id="Musicians" OnClick="location.href='searchMusicians.jsp?search_value=<%=searchV%>&bySearch=musicians'"><label for="Musicians"> Musicians</label></li>
				<li><input type="radio" name="result" value="Albums" id="Albums" OnClick="location.href='searchAlbums.jsp?search_value=<%=searchV%>&bySearch=albums'"><label for="Albums"> Albums</label></li>
			</ul>

		</div>
	<%
	PreparedStatement pstmt1 = null;
	ResultSet rs1 = null;
	
		//넘어 온 값이 모두 null 일 때 
	if (searchBy == null && searchV == null) {
		pstmt1 = conn.prepareStatement(
		"SELECT distinct nickname, user_image_file FROM users inner join musics on users.user_id = musics.user_id");
		//셀렉트 값이 null이고  검색 값이 null 일 때
	} else if (searchBy != null && searchV.equals("")) {
		pstmt1 = conn.prepareStatement(
		"SELECT * FROM musics m,users u where (m.user_id, m.realese_date) in (select m.user_id, max(m.realese_date) from musics group by m.user_id ) and m.user_id = u.user_id order by m.realese_date");
		//둘 다 값이 있을 때
	} else if (searchBy != null && !searchV.equals(searchV)) {
		pstmt1 = conn.prepareStatement(
		"SELECT * FROM musics m,users u where (m.user_id, m.realese_date) in (select m.user_id, max(m.realese_date) from musics group by m.user_id ) and m.user_id = u.user_id order by m.realese_date");
	} else if (searchBy != null && searchV != null) {
		//셀렉트 값이 title 일 때  music,users가 조인된 테이블에서 검색한 값과 title속성에서 같은 값 가져오기
		if (searchBy.equals("all")) {
			pstmt1 = conn.prepareStatement("SELECT distinct nickname, user_image_file FROM musics,users where upper(nickname) like upper(?) and musics.user_id = users.user_id");
			//셀렉트 값이 musicians 일 때  music,users가 조인된 테이블에서 검색한 값과  nickname 속성에서 같은 값 가져오기	
		}
		pstmt1.setString(1, "%" + searchV + "%");
		
	}
	rs1 = pstmt1.executeQuery();
	%>
		<div id="content2">
			<h1>Musicians</h1>
			<%i = 0;
			if(rs1.next() == false) {%>
			   <h1><span style="position: relative; bottom:-50px; font-size:0.8em; display:block; margin-bottom:220px;">'<%=searchV%>' 에 대한 검색결과가 없습니다.</span></h1>
			<% }else{
				do{%>
					<ul>
				<li><a href="../users/anotherUserInfo.jsp?nickName=<%=rs1.getString("nickName") %>">
				<div class="img-content1 img1">
						<img src="../files/users/<%=rs1.getString("user_image_file")%>">
						<div class="darkness" style="border-radius: 75px;"></div></a>
					</div>

					<%-- <div class="img-with-text">
						<a style="font-size:1em; font-weight:600;"><%=rs1.getString(16)%></a>
					</div> --%>
					<div class="img-with-text">
						<a href="../users/anotherUserInfo.jsp?nickName=<%=rs1.getString("nickName") %>" 
						style="color:cornsilk; font-weight: bold;">
						<%=rs1.getString("nickName")%></a>
					</div></li>
			</ul>
				<%if(i==8) break; }while (rs1.next()); 
			}
			rs1.close();
			pstmt1.close();
			
			%>
		</div>
		<%
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	
		//넘어 온 값이 모두 null 일 때 
	//넘어 온 값이 모두 null 일 때 
	if (searchBy == null && searchV == null) {
		pstmt2 = conn.prepareStatement(
		"SELECT * FROM albums a,users u where (a.user_id, a.realese_date) in (select a.user_id, max(a.realese_date) from albums group by a.user_id ) and a.user_id = u.user_id order by a.realese_date");
		//셀렉트 값이 null이고  검색 값이 null 일 때
	} else if (searchBy != null && searchV.equals("")) {
		pstmt2 = conn.prepareStatement(
		"SELECT * FROM albums a,users u where (a.user_id, a.realese_date) in (select a.user_id, max(a.realese_date) from albums group by a.user_id ) and a.user_id = u.user_id order by a.realese_date");
		//둘 다 값이 있을 때
	}else if (searchBy != null && !searchV.equals(searchV)) {
		pstmt2 = conn.prepareStatement(
		"SELECT * FROM albums a,users u where (a.user_id, a.realese_date) in (select a.user_id, max(a.realese_date) from albums group by a.user_id ) and a.user_id = u.user_id order by a.realese_date");
		//둘 다 값이 있을 때
	} else if (searchBy != null && searchV != null) {
		//셀렉트 값이 title 일 때  music,users가 조인된 테이블에서 검색한 값과 title속성에서 같은 값 가져오기
		if (searchBy.equals("all")) {
			pstmt2 = conn.prepareStatement("SELECT * FROM albums,users where upper(title) like upper(?) and albums.user_id = users.user_id");
			//셀렉트 값이 musicians 일 때  music,users가 조인된 테이블에서 검색한 값과  nickname 속성에서 같은 값 가져오기	
		}
		pstmt2.setString(1, "%" + searchV + "%");
		
	}
	rs2 = pstmt2.executeQuery();
	%>
		<div id="content3">
			<h1>Albums</h1>
			<%i = 0;
			if(rs2.next() == false) {%>
			   <h1><span style="position: relative; bottom:-50px; font-size:0.8em; ">'<%=searchV%>' 에 대한 검색결과가 없습니다.</span></h1>
			<% }else{
				do{%>
				<ul>
				<li>
				<a href="../musics/albumInfo.jsp?no=<%=rs2.getInt(1)%>&title=<%=rs2.getString("title")%>&nickName=<%=rs2.getString("nickName") %>">
				<div class="img-content1 img1">
				<img src="../files/albums/<%=rs2.getString("album_image_file")%>">
					<div class="darkness"></div>
					<!-- <div class="btn-plus" draggable="false">
						<span draggable="false">▶</span>
					</div> -->
					</div></a>
					<div class="img-with-text">
						<a href="../musics/albumInfo.jsp?no=<%=rs2.getInt(1)%>&title=<%=rs2.getString("title")%>&nickName=<%=rs2.getString("nickName") %>" style="font-size:1em; font-weight:600; color: cornsilk;"><%=rs2.getString(2)%></a>
					</div>
					<div class="img-with-text">
						<a href="../users/anotherUserInfo.jsp?nickName=<%=rs2.getString("nickName") %>" style="color:gray;"><%=rs2.getString("nickName")%></a>
					</div>
					</li>
			</ul>
				<%if(i==8) break; }while (rs2.next()); 
			}
			rs2.close();
			pstmt2.close();
			conn.close();
			%>
		</div>
			<jsp:include page="../footer.jsp" />
</body>
</html>