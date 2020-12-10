<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>THE MUSIC</title>
<link rel="stylesheet" href="css/basic_setting.css">
<link rel="stylesheet" href="css/main_page.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<style>
	body{
	background-image: url(files/main/13.jpg);
	background-size: 100% 100%;
	background-repeat: no-repeat;
	}
.textHover:hover {
color: coral;
}
	</style>
</head>

<body>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");

	String sql = "select * from musics inner join users on musics.user_id = users.user_id";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet mainMusicList = pstmt.executeQuery();

	pstmt = conn.prepareStatement(
			"SELECT * FROM musics m,users u where (m.user_id, m.realese_date) in (select m.user_id, max(m.realese_date) from musics group by m.user_id ) and m.user_id = u.user_id order by m.realese_date desc");
	ResultSet todayMusicList = pstmt.executeQuery();
	%>
	<!-- 네비게이션 바 -->

	<jsp:include page="navbar.jsp" />

	<!-- 대문그림 -->

	<div id="main_gif"></div>

	<!-- 헤더 -->

	<!-- 헤더 -->

	<div id="header" class="header">

		<h1 id="header_info"></h1>

	</div>

	<!-- 컨테이너 -->


	<div id="container">


		<!-- 추천음악 -->

		<div id="content1">
			<div id="content1_section">
				<section id="content1_article_section">
					<h2 style="margin-bottom: 90px;">
						<a href='#' style="color: white;">주변소리를</br> 차단하고</br> 플레이 더 뮤직
						</a>
					</h2>
					<h3 style="font-size: small; margin-bottom: 70px;">총 22곡 |
						2020.06.08</h3>
					<button>
						<i class="material-icons play"
								style="font-size: 80px; width: 80px; height: 80px; color: lightgray; display: block; padding-bottom: 10px;"><span class="playButton" style="margin-bottom: 20px;">play_circle_filled</span></i>
					</button>

				</section>
				<section id="content1_article_section">
					<ul>
						<%
							for (int i = 0; i < 4; i++) {
						%>
						<%
							if (mainMusicList.next()) {
						%>
						<li><a
							href="musics/musicInfo.jsp?no=<%=mainMusicList.getInt("no")%>"
							style="color: cornsilk;"> <img
								class="content1_article_section_img"
								src="files/musics/<%=mainMusicList.getString("music_image_file")%>"
								width="80" height="80"></a></li>
						<li style="font-size: 0.9em; margin-bottom: 5px; overflow-x: hidden; white-space: nowrap; "><strong>
								<a class="animation"
								href="musics/musicInfo.jsp?no=<%=mainMusicList.getInt("no")%>"
								style="color: cornsilk; overflow: hidden;"><span class="textHover"><%=mainMusicList.getString("title")%></span></a>
						</strong></li>
						<li
							style="font-size: 0.7em; color: lightgray; margin-bottom: 50px;">
							<a
							href="users/anotherUserInfo.jsp?nickName=<%=mainMusicList.getString("nickName")%>"
							style="color: lightgray; font-weight: bold;"><span class="textHover"><%=mainMusicList.getString("nickName")%></span></a>
						</li>
						<%
							if (i == 3)
							break;
						%>
						<%
							}
						%>
						<%
							}
						%>
					</ul>
				</section>
				<section id="content1_article_section">
					<ul>
						<%
							for (int i = 0; i < 4; i++) {
						%>
						<%
							if (mainMusicList.next()) {
						%>
						<li>
						<a
							href="musics/musicInfo.jsp?no=<%=mainMusicList.getInt("no")%>"
							style="color: cornsilk;"> <img
								class="content1_article_section_img"
								src="files/musics/<%=mainMusicList.getString("music_image_file")%>"
								width="80px" height="80px">
								</a>
								</li>
						<li class="animation" style="font-size: 0.9em; margin-bottom: 5px; overflow-x: hidden; white-space: nowrap;"  ><strong>
								<a
								href="musics/musicInfo.jsp?no=<%=mainMusicList.getInt("no")%>"
								style="color: cornsilk;"><span class="textHover"><%=mainMusicList.getString("title")%></span></a>
						</strong>
						</li>
						<li
							style="font-size: 0.7em; color: lightgray; margin-bottom: 50px;">
							<a
							href="users/anotherUserInfo.jsp?nickName=<%=mainMusicList.getString("nickName")%>"
							style="color: lightgray; font-weight: bold;"><span class="textHover"><%=mainMusicList.getString("nickName")%></span></a>
						</li>
						<%
							if (i == 3)
							break;
						%>
						<%
							}
						%>
						<%
							}
						%>
					</ul>
				</section>
			</div>
		</div>

		<!-- TODAY MUSIC -->

		<div id="content2">
			<div id="content2_section">
				<h2 id="content2_h2">TODAY MUSIC</h2>
				<ul class="content2_img">
					<%
						for (int i = 0; i < 4; i++) {
					%>
					<%
						if (todayMusicList.next()) {
					%>
					<li><div class="content2_scale">
							<a
							href="musics/musicInfo.jsp?no=<%=todayMusicList.getInt("no")%>"
							style="color: cornsilk;"><img src="files/musics/<%=todayMusicList.getString("music_image_file") %>"
								style="margin-bottom: 15px; border-radius: 7px; display: block; width: 172px; height: 172px;"></a>
						</div>
						<div class="img-with-text">
							<a href="musics/musicInfo.jsp?no=<%=todayMusicList.getInt("no")%>" style="font-size: 1em; font-weight: 600;"><%=todayMusicList.getString("title")%></a>
						</div>
						<div class="img-with-text">
							<a href="users/anotherUserInfo.jsp?nickName=<%=todayMusicList.getString("nickName")%>"
								style="position: relative; color: lightgray; bottom: 45px;"><%=todayMusicList.getString("nickName")%></a>
						</div></li>
					<%
						}
					%>
					<%
						}
					%>
				</ul>
				<ul class="content2_img">
					<%
						for (int i = 0; i < 4; i++) {
					%>
					<%
						if (todayMusicList.next()) {
					%>
					<li><div class="content2_scale">
							<img src="files/musics/<%=todayMusicList.getString("music_image_file") %>"
								style="margin-bottom: 15px; border-radius: 7px; display: block; width: 172px; height: 172px;">
						</div>
						<div class="img-with-text">
							<a href="#" style="font-size: 1em; font-weight: 600;"><%=todayMusicList.getString("title")%></a>
						</div>
						<div class="img-with-text">
							<a href="#"
								style="position: relative; color: lightgray; bottom: 45px;"><%=todayMusicList.getString("nickName")%></a>
						</div></li>
					<%
						}
					%>
					<%
						}
					%>
				</ul>
			</div>
		</div>

		<!-- GENRE MUSIC -->

		<div id="content3">
			<div id="content3_section">
				<h2 id="content3_h2">GENRE MUSIC</h2>
				<ul class="content3-list">
					<li><img src="files/genre/ballad.png"
						style="border-radius: 7px; display: block; width: 150px; height: 150px;">
						<div class="opacity">
							<h2>발라드</h2>
						</div></li>
					<li><img src="files/genre/hiphop.jpg"
						style="border-radius: 7px; display: block; width: 150px; height: 150px;">
						<div class="opacity">
							<h2>힙합</h2>
						</div></li>
					<li><img src="files/genre/rock&metal.jpg"
						style="border-radius: 7px; display: block; width: 150px; height: 150px;">
						<div class="opacity">
							<h2>록/메탈</h2>
						</div></li>
					<li><img src="files/genre/dance.jpg"
						style="border-radius: 7px; display: block; width: 150px; height: 150px;">
						<div class="opacity">
							<h2>댄스</h2>
						</div></li>
					<li><img src="files/genre/R&B.jpg"
						style="border-radius: 7px; display: block; width: 150px; height: 150px;">
						<div class="opacity">
							<h2>R&B/Soul</h2>
						</div></li>
				</ul>

			</div>
		</div>

		<!-- 풋터 -->

	</div>
		<jsp:include page="footer.jsp" />

</body>

</html>