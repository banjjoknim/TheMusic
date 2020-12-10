<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>user join1</title>
<!--서치버튼 아이콘 링크-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="../css/basic_setting.css">
<link rel="stylesheet" href="../css/user_join.css">
<style>
body{
background-image: url(../files/main/19.jpg);
background-size: 100% 100%;
background-repeat: no-repeat;
}
</style>
<script type="text/javascript">
	// @command 전체선택
	function allCheckedBox(obj) {

		// @brief 선택한 체크박스의 클래스 명칭을 가져온다.
		const termClass = obj.getAttribute("class");

		// @brief 선택한 클래스명과 같은 클래스의 갯수

		console.log(document.getElementsByClassName(termClass).length);

		Array.prototype.forEach
				.call(
						document.getElementsByClassName(termClass),
						function(element, index, array) {

							// @brief 엘리먼트의 값 출력

							console.log(element.value);

							// @brief 선택한 클래스의 첫번째 checkbox의 상태가 체크가 되있는 경우

							if (document.getElementsByClassName(termClass)[0].checked == true) {

								// @brief 같은 클래스명을 가진 모든 checkbox의 상태를 선택 완료 처리 한다.

								element.checked = true;

							}// @brief 선택한 클래스의 첫번째 checkbox의 상태가 체크가 해제된 경우
							else {// @brief 같은 클래스명을 가진 모든 checkbox의 상태를 선택 해제 처리 한다.
								element.checked = false;
							}
						});

	}
	// @command 개별 선택이 이루어진 경우에 전체값 체크의 예외처리
	function eachCheckedBox(obj) {
		// @brief 선택한 체크박스의 상태가 선택해제인 경우

		if (obj.checked == false) {

			// @brief 선택한 체크박스의 클래스 명칭을 가져온다.

			const termClass = obj.getAttribute("class");

			// @brief 첫번째 checkbox의 상태가 체크가 되어있는경우

			if (document.getElementsByClassName(termClass)[0].checked == true) {

				// @brief 첫번째 checkbox의 상태를 체크해제한다.

				document.getElementsByClassName(termClass)[0].checked = false;

			}

		}

	}
</script>
<style>
background-color:white;
</style>
</head>

<body>
	<!-- 네비게이션 바 -->

	<jsp:include page="../navbar.jsp" />
	<!-- 헤더 -->

	<div id="header">

        <h1 id="header_info">회원가입</h1>

    </div>

	<!-- 컨테이너 -->



	<div id="container">
	
	<h1>
			<span style="color: cornsilk;">이용약관 확인 및 동의</span>
		</h1>
		<form name="agreeFrm" action="user_join2.jsp" method="POST">
			<!-- 이용약관 -->

			<div id="content2">

				<div id="content2_form">
					<fieldset>
						<ul class="join_box">
							<li class="checkBox check01">
								<ul class="clearfix">
									<li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 이벤트등 프로모션 안내 메일
										수신(선택)에 모두 동의합니다.</li>
									<li class="checkAllBtn"><input type="checkbox"
										name="chkAll" id="chk" class="chkTerms"
										onChange="allCheckedBox(this);"></li>
								</ul>
							</li>
							<li class="checkBox check02">
								<ul class="clearfix">
									<li>이용약관 동의(필수)</li>
									<li class="checkBtn"><input type="checkbox" name="chk"
										class="chkTerms" id="firstCheck"></li>
								</ul> <textarea name="" id="" readonly>여러분을 환영합니다.
    네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
           </textarea>
							</li>
							<li class="checkBox check03">
								<ul class="clearfix">
									<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
									<li class="checkBtn"><input type="checkbox" name="chk"
										class="chkTerms" id="secondCheck"></li>
								</ul> <textarea name="" id="" readonly>여러분을 환영합니다.
    네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
           </textarea>
							</li>
							<li class="checkBox check03">
								<ul class="clearfix">
									<li>위치정보 이용약관 동의(선택)</li>
									<li class="checkBtn"><input type="checkbox"
										class="chkTerms" name="chk"></li>
								</ul> <textarea name="" id="" readonly>여러분을 환영합니다.
    네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
           </textarea>
							</li>
							<li class="checkBox check04">
								<ul class="clearfix">
									<li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
									<li class="checkBtn"><input type="checkbox"
										class="chkTerms" name="chk"></li>
								</ul>
							</li>
							<li class="checkBox check05">
								<ul class="clearfix">
									<li>상기에 기재된 본 사이트의 이용약관을 확인하였으며 이에 동의합니다</li>
									<li class="checkBtn"><input type="checkbox"
										class="chkTerms" name="chk" id="lastCheck" value="ok"></li>
								</ul>
							</li>
						</ul>
					</fieldset>



				</div>
				<div id="content3">
					<button type="button" onclick="checkOk()"
						style="font-size: 13pt; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">확인</button>
					<button type="reset"
						style="font-size: 13pt; margin-left: 30px; outline: none; font-weight: bold; width: 96px; height: 54px; background-color: cornsilk; color: black; border-radius: 5px;">취소</button>
				</div>
			</div>
		</form>



		<!-- 풋터 -->

	</div>
		<jsp:include page="../footer.jsp" />
<script>
function checkOk(){
	if(document.getElementById("lastCheck").checked==true && document.getElementById("firstCheck").checked==true && document.getElementById("secondCheck").checked==true) {
	document.agreeFrm.submit();
	} else {
		alert("필수항목에 체크하지 않으셨습니다.");
	}
}
</script>
</body>

</html>