<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resist Seller Result</title>
    <link rel="stylesheet" href="../css/Resist_Seller.css">
    <link rel="stylesheet" href="../css/basic_setting.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>
    body{
    background-image: url(../files/main/5.jpg);
	background-size: 100% 100%;
	background-repeat: no-repeat;
    }
    </style>
</head>

<body>
    <!-- 네비게이션 바 -->

    <jsp:include page="../navbar.jsp"/>



    <!-- 헤더 -->

    <div id="header">

        <h1 id="header_info">판매자 등록</h1>

    </div>

    <!-- 컨테이너 -->

    <div id="container">

        <div id="content1" style="border: none;">

            <i class="material-icons" style="user-select: none; font-size: 140px; color: coral; display: block; margin: 0 auto;">check</i>
            <h1>판매자 등록완료</h1>
            <h1 style="font-size: 13pt;">판매자 등록이 완료되었습니다.<br>상세내용은 
            <%String url = request.getContextPath(); %>
            <a style="color: coral; text-decoration: underline;" href="<%=url+"/users/user_info.jsp" %>">마이페이지</a>에서 확인하실 수 있습니다.</h1>

            <div id="content1_Resist_Seller_Result">
                
            </div>

        </div>


            <!-- 메인페이지로  -->

            <div id="content3">
                <a href="../main_page.jsp"><button type="button"
                    style="font-size: 13pt; outline: none; font-weight: bold; width: 120px; height: 50px; background-color: cornsilk; color: black; border-radius: 5px;">메인페이지로</button></a>
            </div>

        <!-- 풋터 -->

        <!-- 풋터 -->

    </div>
        <jsp:include page="../footer.jsp"/>

</body>

</html>