<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Music info</title>
<link rel="stylesheet" href="../css/basic_setting.css">
<link rel="stylesheet" href="../css/musicInfo.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
td a {
	color: cornsilk;
}
body{
background-image: url(../files/header/7.jpg);
background-size: 100% 100%;
background-repeat: no-repeat;
}
</style>
</head>
<script type="text/javascript">
					function addFavorite(i) {
						favorite[0].innerHTML = "favorite";
						alert("좋아요 하셨습니다.");
					}
					function playlist_add() {
						addPlaylist[0].innerHTML = "playlist_add_check";
						alert("플레이리스트에 추가되었습니다.");
					}
					
					function playAudio(i) {
						music[i].play();
						playButton[i].style.color = "red";
						playButton[i].innerHTML = "pause_circle_filled";
					}
					function pauseAudio(i) {
						music[i].pause();
						playButton[i].style.color = "coral";
						playButton[i].innerHTML = "play_circle_filled";
					}
					function playCtrl(i) {
						if(isPlaying==false) {
							playAudio(i);
							isPlaying=true;
						} else if(isPlaying==true){
							pauseAudio(i);
							isPlaying=false;
						}
					}
					
				</script>
<body>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");
	
	String sql = "select * from musics inner join users on musics.user_id = users.user_id where musics.no = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(request.getParameter("no")));
	ResultSet rsNow = pstmt.executeQuery();
	
	%>
	<!-- 네비게이션 바 -->

	<jsp:include page="../navbar.jsp" />




	<!-- 헤더 -->

	<div id="header">

		<h1 id="header_info">곡 상세정보</h1>

	</div>

	<!-- 컨테이너 -->

	<div id="container">

		<!-- 음악 정보 -->
		<%
		int i = 0;
		int musicNo = 0;
		String albumTitle = null;
		String nickName = null;
			if (rsNow.next()) {
				musicNo = rsNow.getInt("no");
				nickName = rsNow.getString("nickName");
				albumTitle = rsNow.getString("album_title");
				session.setAttribute("musicNo", musicNo);
		%>
		
		
		<div id="content1" style="border: none;">


			<img id="content1_song_picture"
				src="../files/musics/<%=rsNow.getString("music_image_file")%>"
				width="200" height="200">
			<audio id="audio">
				<source
					src="../files/musics/<%=rsNow.getString("music_song_file")%>"
					type="audio/mp3">
			</audio>
			<div class="opacity" onclick="playCtrl(<%=i%>)">
			<i class="material-icons play"
								style="font-size: 200px;width: 200px; height: 200px; color: coral; display: block; padding-bottom: 10px;"><span class="playButton">play_circle_filled</span></i>
								</div>
							
			<div id="content1_song_info" style="border: none;">
				<h2 id="content1_song_title">
					Title :
					<%=rsNow.getString("title")%></h2>
				<h3 id="content1_song_artist">
					Artist :
					<%=rsNow.getString("nickName")%></h3>
				<h4 id="content1_song_release">
					release Date :
					<%=rsNow.getString("realese_date")%></h4>
				<c:set var="likes" value="<%=rsNow.getInt(\"likes\")%>" />
				<%if(session.getAttribute("id")!=null){ %>
				<form action="#">
				<button id="content1_song_info_like_button" type="button"
					onclick="addFavorite(<%=i%>);">
					<i class="material-icons" style="font-size: 40px; color: red;"><span class="favorite">favorite_border</span></i>
				</button>
				</form>
				<form action="#" style="position: relative; bottom: 45px; left: 40px;">
				<button id="content1_song_info_playlist_add_button" type="button"
					onclick="playlist_add();">
					<i class="material-icons" style="font-size: 40px; color: red;"><span class="addPlaylist">playlist_add</span></i>
				</button>
				</form>
				<form style="position: relative; bottom: 87px; left: 80px;" name="addMusic" 
				action="addCart.jsp?no=<%=musicNo%>" method="POST">
				<button id="content1_song_info_playlist_add_shopping_cart_button"
					type="button" onclick="add_shopping_cart(<%=i%>);">
					<i class="material-icons" style="font-size: 40px; color: red;"><span class="addShoppingCart">add_shopping_cart</span></i>
				</button>
				</form>
				<%} %>
			</div>

			<div id="content1_song_likes">
				<h2 id="content1_song_likes_text">likes</h2>
				<h3 id="content1_song_likes_count"><%=rsNow.getInt("likes")%></h3>
			</div>
		</div>
		<%
			}
		%>
		<!-- 곡 리스트 -->

		<div id="content2">

			<h1 id="content2_related_song_list">연관 곡 리스트</h1>
			<table>
				<tr>
					<th scope="col" style="width: 30px;">
						<!-- <label for="all_select"></label> --> 
						<input type="checkbox" class="AllClick" name="all_select" value="all_select">
					</th>
					<th scope="col" style="width: 50px;">No.</th>
					<th scope="col" style="width: 400px; text-align: left;"><span
						style="padding-left: 6px;">곡/앨범</span></th>
					<th scope="col" style="width: 70px;">듣기</th>
					<th scope="col" style="width: 100px;">장르</th>
					<th scope="col" style="width: 200px;">뮤지션/국가</th>
					<th scope="col" style="width: 100px;">
					<button onclick="add_shopping_cartCheck();">
							<i class="material-icons" style="font-size: 30px; color: cornsilk; padding-top:9px;"><span class="addShoppingCart">add_shopping_cart</span></i>
						</button></th>
				</tr>
				
				<%
				sql = "select * from musics inner join users on musics.user_id = users.user_id inner join albums on musics.album_title = albums.title where not musics.no = ? and users.nickName = ?"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, musicNo);
				pstmt.setString(2, nickName);
				ResultSet rs = pstmt.executeQuery();
					while (rs.next()) {
					i = i + 1;
					musicNo = rs.getInt("no");
					
				%>
				<tr>
					<td>
					<input type="checkbox" class="memberChk" name="checkbox" value="<%=musicNo%>">
					</td>
					<td id="<%=musicNo%>"><%=i%></td>
					<td style="overflow: hidden;">
					
					<a
						href="musicInfo.jsp?no=<%=rs.getInt("no")%>"> <img
							src="../files/musics/<%=rs.getString("music_image_file")%>"
							style="float: left; margin-bottom: 9px;"> 
							<span
							style="display: block; float: left; padding-top: 23px; margin-left: 20px;">
								<%=rs.getString("title")%></span></a>
								<span style="dispaly: block; float: left; padding-top: 23px; margin: 0px 10px;">/</span>
								<a
						href="albumInfo.jsp?no=<%=rs.getInt(26) %>&title=<%=rs.getString("album_title") %>&nickName=<%=rs.getString("nickName") %>">
								<span
							style="display: block; float: left; padding-top: 23px;">
							<%=rs.getString("album_title") %>
						</span></a></td>

					<td>
					<audio id="audio">
							<source
								src="../files/musics/<%=rs.getString("music_song_file")%>"
								type="audio/mp3">
						</audio>
						<button type="button" onclick="playCtrl(<%=i%>)">
							<i class="material-icons play"
								style="font-size: 40px; color: coral; display: block; padding-bottom: 10px;"><span class="playButton">play_circle_filled</span></i>
						</button></td>
					<td><span style="display: block; padding-bottom: 13px;"><%=rs.getString("genre")%></span>
					</td>
					
					<td><span style="display: block; padding-bottom: 13px;">
							<a href="../users/anotherUserInfo.jsp?nickName=<%=rs.getString("nickName")%>"><%=rs.getString("nickName")%>/<%=rs.getString("country")%></a>
					</span></td>
					<td>
					<form style="padding: 0px; margin: 0px;" name="addmusic" action="addCart.jsp?no=<%=musicNo %>" method="POST">
						<button onclick="add_shopping_cart(<%=i+1%>);">
							<i class="material-icons" style="font-size: 40px; color: red;"><span class="addShoppingCart">add_shopping_cart</span></i>
						</button>
						</form>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		
		<script>
		function add_shopping_cart(i) {
			addShoppingCart[i].innerHTML = "shopping_cart";
			alert("카트에 추가되었습니다.");
			document.addMusic.submit();
		}
		
		
var music = document.querySelectorAll("audio");
var playButton = document.querySelectorAll(".playButton");
var addShoppingCart = document.querySelectorAll(".addShoppingCart");
var favorite = document.querySelectorAll(".favorite");
var addPlaylist = document.querySelectorAll(".addPlaylist");
var isPlaying = false;
var isFavorite = false;
var addedPlaylist = false;

</script>

<script>
var checkedList = new Array();
var checkBox = document.getElementsByClassName("memberChk")
function add_shopping_cartCheck(){

	alert("체크항목이 모두 카트에 추가되었습니다.");
}
</script>



















<script>
        var allClick = document.querySelector(".AllClick");
      allClick.addEventListener('click', function(){
      var objs = document.querySelectorAll(".memberChk");
            var allchk = document.querySelector(".AllClick");
            for (var i = 0; i < objs.length; i++) {
                objs[i].checked = allchk.checked;
            };
      }, false);
        function OnOffMemberAllClickBtn() {
            var objs = document.querySelectorAll(".memberChk");
            var allchk = document.querySelector(".AllClick");
            var existUnchecked = false;
            for (var i = 0; i < objs.length; i++) {
                if (objs[i].checked === false) {
                    existUnchecked = true;
                    break;
                }
            }
            if (existUnchecked === false) {
                allchk.checked = true;
            } else {
                allchk.checked = false;
            }
        }
    </script>


		<!-- 풋터 -->

	</div>
		<jsp:include page="../footer.jsp" />

</body>

</html>