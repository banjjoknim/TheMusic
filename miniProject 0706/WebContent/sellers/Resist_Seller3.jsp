<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resist Seller3</title>
    <link rel="stylesheet" href="../css/Resist_Seller.css">
    <link rel="stylesheet" href="../css/basic_setting.css">
   <style>
    #container{
    background-image: url(../files/main/5.jpg);
	background-size: 100% 100%;
	background-repeat: no-repeat;
    }
    </style>
</head>

<body>
<%
session.setAttribute("introduction", request.getParameter("introduction"));
session.setAttribute("interests", request.getParameterValues("interests"));
%>
    <!-- 네비게이션 바 -->

    <jsp:include page="../navbar.jsp"/>




    <!-- 헤더 -->

    <div id="header">

        <h1 id="header_info">판매자 등록</h1>

    </div>

    <!-- 컨테이너 -->

    <div id="container">
        <form action="Resist_Seller_Pro.jsp?" method="POST">

        <!-- 결제관련 정보 -->

        <div id="content2" style="border: none;">

            <h1>결제정보입력</h1>

            <div id="content2_credit_info" >
                    <table id="content2_credit_info_table">
                        <tr>
                            <td>
                                <label for="depositor_name"><span>예금주명</span></label>
                            </td>
                            <td>
                                <input type="text" name="name" id="depositor_name" required placeholder="예금주명을 입력해주세요." required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="phone_number"><span>연락처</span></label>
                            </td>
                            <td>
                                <input type="tel" name="phone_number" id="phone_number" style="width: 340px; height: 25px;" required
                                placeholder="'-'는 제외하고 숫자만 입력해주세요." required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="email"><span>이메일</span></label>
                            </td>
                            <td>
                                <input type="text" name="emailFirst" id="email"  placeholder="이메일 주소를 입력해주세요." required> 
                                <span style="float: left; padding-top:5px;">&nbsp;@&nbsp;</span>
                                <select id="email_select" name="emailSecond" style="width: 160px; padding: 3px 0 8px; font-size: 15pt;">
                                    <option>=이메일선택=</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="nate.com">nate.com</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="bank"><span>은행</span></label>
                            </td>
                            <td>
                                <select id="bank" name="bank" style="float: left; font-size: 15pt; padding: 1px 0 7px;" required>
                                    <option>=은행선택=</option>
                                    <option value="NH농협">NH농협</option>
                                    <option value="국민은행">국민은행</option>
                                    <option value="기업은행">기업은행</option>
                                    <option value="우리은행">우리은행</option>
                                    <option value="하나은행">하나은행</option>
                                </select>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                <label for="account_number"><span>계좌번호</span></label>
                            </td>
                            <td>
                                <input type="text" class="text_box" id="account_number" style="height: 25px;" size="30"
                                    name="account_number" placeholder="'-'는 빼고 계좌번호를 입력해주세요." required><br>
                            </td>
                        </tr>


                    </table>

                    
                    
                </div>
                
                
                
            </div>
            
            <!-- 확인 취소 버튼 -->
            
            <div id="content3">
                <button type="submit" style="font-size: 13pt; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">등록완료</button>
                <button type="reset" style="font-size: 13pt; margin-left: 30px; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">취소</button>
            </div>
        </form>
            
        <!-- 풋터 -->

        <!-- 풋터 -->

    </div>
        <jsp:include page="../footer.jsp"/>

</body>

</html>