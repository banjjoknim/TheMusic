<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");
	
	String sql = "select * from albums inner join users on albums.user_id = users.user_id where albums.no = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(request.getParameter("no")));
	ResultSet rsNow = pstmt.executeQuery();
	
	
	%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Album info</title>
    <link rel="stylesheet" href="../css/basic_setting.css">
    <link rel="stylesheet" href="../css/album_info.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>
    td a {color: cornsilk;}
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
					function add_shopping_cart(i) {
						addShoppingCart[i].innerHTML = "shopping_cart";
						alert("카트에 추가되었습니다.");
						document.addMusic.submit();
					}
					function add_shopping_cartAlbum(){
						addShoppingCartAlbum.innerHTML = "shopping_cart";
						alert("카트에 추가되었습니다.")
						document.addAlbum.submit();
					}
					function playAudio(i) {
						music[i-1].play();
						playButton[i-1].style.color = "red";
						playButton[i-1].innerHTML = "pause_circle_filled";
					}
					function pauseAudio(i) {
						music[i-1].pause();
						playButton[i-1].style.color = "coral";
						playButton[i-1].innerHTML = "play_circle_filled";
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
					var isPlaying=false;
					var isFavorite = false;
					var addedPlaylist = false;
				</script>

<body>
    <!-- 네비게이션 바 -->

    <jsp:include page="../navbar.jsp"/>

    <!-- 대문그림 -->

    <div id="main_gif">
    </div>
    
    <!-- 헤더 -->

    <div id="header">
        <h1 id="header_info">앨범정보</h1>



    </div>

    <!-- 컨테이너 -->

    <div id="container">



        <!-- 앨범 정보 -->
        
        <%
        String albumTitle = null;
        String userId = null;
        String nickName = null;
        int i = 0;
        int albumNo = 0;
			if (rsNow.next()) {
				albumNo = rsNow.getInt("no");
				albumTitle = rsNow.getString("title");
				nickName = rsNow.getString("nickName");
				session.setAttribute("albumNo", albumNo);
                userId = rsNow.getString("user_id");
				sql = "select count(*) from musics where album_title = ? and user_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, albumTitle);
				pstmt.setString(2, userId);
				ResultSet tracks = pstmt.executeQuery();
				
		%>

        <div id="content1" style="border: none;">

            <img id="content1_album_picture" src="../files/musics/<%=rsNow.getString("album_image_file")%>" width="200" height="200">
            <div id="content1_album_info" style="border: none;">
                <h2 id="content1_album_title">Title : <%=rsNow.getString("title")%></h2>
                <h3 id="content1_album_artist">Artist : <%=rsNow.getString("nickName")%></h3>
                <h4 id="content1_album_release">release Date : <%=rsNow.getString("realese_date")%></h4>
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
				<form style="position: relative; bottom: 87px; left: 80px;" name="addAlbum" 
				action="addCartAlbumMusic.jsp?no=<%=albumNo %>&title=<%=albumTitle %>&nickName=<%=nickName %>&album=yes" method="POST">
				<button id="content1_song_info_playlist_add_shopping_cart_button"
					 onclick="add_shopping_cartAlbum();">
					<i class="material-icons" style="font-size: 40px; color: red;"><span class="addShoppingCartAlbum">add_shopping_cart</span></i>
				</button>
				</form>
				<%} %>
			</div>

            <div id="content1_album_followers" style="padding-top:25px; margin-right:40px;">
                <h2 id="content1_album_followers">Likes</h2>
                <h3 id="content1_album_followers_num"><%=rsNow.getInt("likes") %></h3>
            </div>
            <div id="content1_album_tracks" style="padding-top:25px; margin-right:20px;">
                <h2 id="content1_album_tracks">Tracks</h2>
                <%if(tracks.next()) {%>
                <h3 id="content1_album_tracks_num"><%=tracks.getInt(1) %></h3>
            </div>
        </div>
        
        <% }
                
		} sql = "select * from musics inner join users on musics.user_id = users.user_id where musics.album_title = ? and users.nickName = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("title"));
		pstmt.setString(2, request.getParameter("nickName"));
		ResultSet tracklists = pstmt.executeQuery();%>

        <!-- 앨범 트랙리스트 -->

        <div id="content2">

            <h1 id="content2_track_list">수록곡</h1>

            <table>
				<tr>
					<th scope="col" style="width: 30px;">
						<!-- <label for="all_select"></label> --> <input type="checkbox"
						id="all_select" class="AllClick" name="all_select">
					</th>
					<th scope="col" style="width: 50px;">No.</th>
					<th scope="col" style="width: 400px; text-align: left;"><span
						style="padding-left: 6px;">곡 이름</span></th>
					<th scope="col" style="width: 70px;">듣기</th>
					<th scope="col" style="width: 100px;">장르</th>
					<th scope="col" style="width: 200px;">뮤지션/국가</th>
					<th scope="col" style="width: 100px;"><button type="button" onclick="add_shopping_cartAll();">
							<i class="material-icons" style="font-size: 30px; color: cornsilk; padding-top:9px;"><span class="addShoppingCart">add_shopping_cart</span></i>
						</button></th>
				</tr>
                <%
				while (tracklists.next()) {
					i = i + 1;
					int musicNo = tracklists.getInt(1); 
				%>
                <tr>
					<td>
					<input type="checkbox" id="select_1" class="memberChk" name="select_1">
					</td>
					<td><%=i%></td>
					<td style="overflow: hidden;" id="<%=musicNo%>">
					<a
						href="musicInfo.jsp?no=<%=tracklists.getInt("no")%>">
					<img src="../files/musics/<%=tracklists.getString("music_image_file")%>"
						style="float: left; margin-bottom: 9px;"> 
						<span style="display: block; float: left; padding-top: 23px; margin-left: 20px;">
						<%=tracklists.getString("title") %>
					</span></a>
					</td>
					
					<td>
					<audio id="audio">
							<source
								src="../files/musics/<%=tracklists.getString("music_song_file")%>"
								type="audio/mp3">
						</audio>
						<button onclick="playCtrl(<%=i%>)">
							<i class="material-icons"
								style="font-size: 40px; color: coral; display: block; padding-bottom: 10px;"><span class="playButton">play_circle_filled</span></i>
						</button>
					</td>
					<td><span style="display: block; padding-bottom: 13px;">
					<%=tracklists.getString("genre") %></span>
					</td>
					
					<td><span style="display: block; padding-bottom: 13px;">
					<a href="../users/anotherUserInfo.jsp?nickName=<%=tracklists.getString("nickName")%>"><%=tracklists.getString("nickName") %>/<%=tracklists.getString("country") %></a>
					</span>
					</td>
					<td>
						<form style="padding: 0px; margin: 0px;" name="addmusic" 
						action="addCartAlbumMusic.jsp?no=<%=albumNo %>&title=<%=albumTitle %>&nickName=<%=nickName %>&musicNo=<%=tracklists.getInt(1) %>&album=no" method="POST">
						<button onclick="add_shopping_cart(<%=i+1%>);">
							<i class="material-icons" style="font-size: 40px; color: red;"><span class="addShoppingCart">add_shopping_cart</span></i>
						</button>
						</form>
					</td>
				</tr>
				<%-- addCart.jsp?no=<%=albumNo %>&title=<%=albumTitle %>&nickName=<%=nickName %>&musicNo=<%=tracklists.getInt(1) %>&album=no --%>
                <%
					}
				%>
            </table>

        </div>
<script>
var music = document.querySelectorAll("audio");
var playButton = document.querySelectorAll(".playButton");
var addShoppingCart = document.querySelectorAll(".addShoppingCart");
var addShoppingCartAlbum = document.querySelector()
var favorite = document.querySelectorAll(".favorite");
var addPlaylist = document.querySelectorAll(".addPlaylist");

var checkBox = document.querySelectorAll(".checkbox");
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
        <!-- 콘텐츠3 -->

        <div id="content3">


        </div>


        <!-- 풋터 -->

    </div>
        <jsp:include page="../footer.jsp"/>

</body>

</html>