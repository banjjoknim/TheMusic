<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="org.jdbc.music.*,org.jdbc.users.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
background-image: url(../files/header/3.jpg);
background-size: 100% 100%;
background-repeat: no-repeat;
}
</style>
<script type="text/javascript">
var isCart = true;
					function add_shopping_cart(i) {
						ShoppingCart[i].innerHTML = "shopping_cart";
						document.music.submit();
					}
					function remove_shopping_cart(i) {
						ShoppingCart[i].innerHTML = "shopping_cart";
						document.music.submit();
					}
					function cartCtrl(i) {
						if(isCart==false) {
							add_shopping_cart(i);
							isCart=true;
						} else if(isCart==true){
							remove_shopping_cart(i);
							isCart=false;
						}
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
					function remove_shopping_cartAll(){ 
						document.deleteCart.submit();
					}
					
				</script>
</head>
<body>
<%String cartId = session.getId();%>
<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "C##Tester", "Tester");
	
	String sql = "select * from users where user_id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, (String)session.getAttribute("id"));
	ResultSet nowId = pstmt.executeQuery();
	
	
	%>
	<!-- 네비게이션 바 -->

	<jsp:include page="../navbar.jsp" />


	


	<!-- 헤더 -->

	<div id="header">

        <h1 id="header_info">쇼핑카트</h1>

    </div>

	<!-- 컨테이너 -->

	<div id="container">

		<!-- 음악 정보 -->
		<form name="addMusic" action="addCart.jsp?no=<%=request.getParameter("no") %>" method="POST"></form>
		<!-- 곡 리스트 -->
<%if(nowId.next()) {%>

		<div id="content2">
			<h1 id="content2_related_song_list" style="color: cornsilk;"><%=nowId.getString("nickName") %>님의 카트</h1>
			<table>
				<tr>
					<th scope="col" style="width: 30px;">
						<!-- <label for="all_select"></label> --> 
						<input type="checkbox" class="AllClick" name="all_select" value="all_select">
					</th>
					<th scope="col" style="width: 50px;">No.</th>
					<th scope="col" style="width: 400px; text-align: left;"><span
						style="padding-left: 6px;">곡/앨범</span></th>
					
					<th scope="col" style="width: 100px;">장르</th>
					<th scope="col" style="width: 200px;">아티스트/국가</th>
					<th scope="col" style="width: 70px;">가격</th>
					<th scope="col" style="width: 100px;">
					<form name="deleteCart" action="deleteCart.jsp" method="POST">
					<button type="button" onclick="remove_shopping_cartAll();">
							<i class="material-icons" style="font-size: 30px; color: cornsilk; padding-top:9px;">
							<span class="ShoppingCart">remove_shopping_cart</span></i>
						</button>
						</form></th>
				</tr>
				
				<%
	
	int totalPrice = 0;
	ArrayList<Music> cartList = (ArrayList<Music>)session.getAttribute("cartList");
	if(cartList==null){
		cartList = new ArrayList<Music>();
	}
	for(int i=0; i<cartList.size(); i++) {
		Music musics = cartList.get(i);
		totalPrice = totalPrice + musics.getPrice();
		
		sql = "select * from musics inner join users on musics.user_id = users.user_id where musics.no = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, musics.getNo());
		ResultSet cartMusics = pstmt.executeQuery();
		if(cartMusics.next()){
	%>
				
				<tr>
					<td><input type="checkbox" class="memberChk" name="select1" value="select<%=i%>">
					</td>
					<td id="index<%=i+1%>"><%=i+1%></td>
					<td style="overflow: hidden;">
					<a
						href="musicInfo.jsp?no=<%=musics.getNo() %>"> <img
							src="../files/musics/<%=musics.getMusic_Image_file() %>"
							style="float: left; margin-bottom: 9px;"> <span
							style="display: block; float: left; padding-top: 23px; margin-left: 20px;">
								<%=musics.getTitle() %>
						</span></a></td>

					
					
					<td>
					<span style="display: block; padding-bottom: 13px;"><%=musics.getGenre() %></span>
					</td>
					
					<td><span style="display: block; padding-bottom: 13px;">
							<a href="../users/anotherUserInfo.jsp?nickName=<%=cartMusics.getString("nickName")%>"><%=cartMusics.getString("nickName")%>
							/<%=cartMusics.getString("country")%></a>
					</span></td>
					
					<td>
					<%=musics.getPrice() %>
					</td>
					
					<td>
					<form name="music" action="removeCart.jsp?no=<%=cartMusics.getInt("no") %>&index=<%=i %>" method="POST">
						<button onclick="remove_shopping_cart(<%=i%>);">
							<i class="material-icons" style="font-size: 40px; color: red;"><span class="ShoppingCart">remove_shopping_cart</span></i>
						</button>
						</form>
					</td>
				</tr>
				<%
		}
					}
				%>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<tr >
				<th colspan="3" style="background-color: #2A2A2A; border: 2px solid gray;">
				<span style="font-size: 25pt;">총액</span> 
				</th>
				<th colspan="4" style="background-color: #2A2A2A; border: 2px solid gray;">
				<span style="font-size: 25pt;"><%=totalPrice %>원</span>
				</th>
				</tr>
			</table>
		</div>
		
		<div id="content3">
            <a href="payment.jsp"><button id="confirm_button" type="submit">
                <i class="material-icons" style="font-size: 30px; color: rgb(236, 34, 34); padding-top:27px; margin-right: 20px;">payment</i>
                <span
                    style=" font-size: 16pt; color: cornsilk; float: left; margin: 14px; padding: 10px 10px;">결제하기</span></button></a>
            <a href="<%=request.getContextPath()%>/main_page.jsp"><button id="cancel_button" type="submit">
                <i class="material-icons" style="font-size: 30px; color: rgb(236, 34, 34); padding-top:27px; margin-right: 20px;">backspace</i>
                <span
                    style=" font-size: 16pt; color: cornsilk; float: left; margin: 14px; padding: 10px 10px; ">돌아가기</span></button></a>
		
        </div>



<%} %>





















<script>
var music = document.querySelectorAll("audio");
var playButton = document.querySelectorAll(".playButton");
var ShoppingCart = document.querySelectorAll(".ShoppingCart");
var favorite = document.querySelectorAll(".favorite");
var addPlaylist = document.querySelectorAll(".addPlaylist");
var isPlaying = false;
var isFavorite = false;
var addedPlaylist = false;
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

		<!-- 풋터 -->

	</div>
		<jsp:include page="../footer.jsp" />

</body>

</html>