<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/basic_setting.css">
    <link rel="stylesheet" href="../css/adminPage.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
<jsp:include page="../navbar.jsp"/>

    <!-- 헤더 -->

    <div id="header">

		<h1 id="header_info">관리자모드</h1>

	</div>

    <!-- 컨테이너 -->

    <div id="container">

        <h1>컨테이너 입니다.</h1>

        <!-- 앨범 정보 -->

        <div id="content1">

            <h1>유저 정보 열람</h1>
            
</div>
        <!-- 곡 리스트 -->

        <div id="content2">

            <h1>유저 정보 열람</h1>
            
            <table>
				<tr>
					<th scope="col" style="width: 30px;">
						<!-- <label for="all_select"></label> --> 
						<input type="checkbox" class="checkBox" name="all_select" value="all_select">
					</th>
					<th scope="col" style="width: 50px;">No.</th>
					<th scope="col" style="width: 400px; text-align: left;"><span
						style="padding-left: 6px;">유저아이디</span></th>
					<th scope="col" style="width: 70px;">듣기</th>
					<th scope="col" style="width: 100px;">장르</th>
					<th scope="col" style="width: 200px;">아티스트/국가</th>
					<th scope="col" style="width: 100px;">담기</th>
				</tr>
				<tr>
					<td><input type="checkbox" class="checkBox" name="select1" value="select">
					</td>
					<td></td>
					<td style="overflow: hidden;"></td>

					<td>
					</td>
					<td>
					</td>
					<td>
					<td>
					</td>
				</tr>
			</table>

        </div>


        
        <!-- 풋터 -->
        

        <jsp:include page="../footer.jsp"/>
        
    </div>
</body>
</html>