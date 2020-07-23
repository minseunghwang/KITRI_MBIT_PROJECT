<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User2DAO"%>
<%@ page import="user.User2"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>Join!!!</title>

<!-- Bootstrap core CSS -->
<link href="./Resource/css/bootstrap.min.css" rel="stylesheet">
<link href="./Resource/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./Resource/css/custom.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	var selectBox = document.getElementById("selectBox");
	var selectedValue = selectBox.options[selectBox.selectedIndex].value;
	alert(selectedValue);

	function check_input() {
		// 사용자가 입력한 데이터를 추출한다.
		var user_name = $("#u_name").val()
		var user_id = $("#u_id").val()
		var user_pw = $("#u_id").val()
		var user_age = $("#u_age").val()

		if (user_id.length == 0) {
			alert('아이디를 입력해 주세요')
			$("#user_id").focus()
			return false
		}
		if (user_pw.length == 0) {
			alert('비밀번호를 입력해 주세요')
			$("#user_pw").focus()
			return false
		}
		if (user_name.length == 0) {
			alert("이름을 입력해 주세요")
			$("#user_name").focus()
			return false
		}
		if (user_age.length == 0) {
			alert('나이를 입력해 주세요')
			$("#user_age").focus()
			return false
		}

		return True
	}
</script>



</head>
<body style="background-color: antiquewhite";>
	<%@ include file="Navigation.jsp"%>
	<!-- Page Content -->
	<div class="container">
		<div class="row" style="position: relative;">
			<div class="col-lg-1"></div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9" style="text-align: center";>
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel" style="text-align: -webkit-center;">

					<div class="card-body col-lg-5">



						<h3 style="text-align: center;">🙋‍♀️ 회원가입 🙋‍♂️</h3>


						<form method="post" action="joinAction.jsp"
							onsubmit="return check_input()">
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="아이디 : 3~12자 영문 소문자" id="u_id" name="u_id"
									maxlength="20">
							</div>

							<div class="form-group">
								<input type="password" class="form-control"
									placeholder="비밀번호 : 3~12자 숫자" id="u_pw" name="u_pw"
									maxlength="20">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="이름"
									name="u_name" id="u_name" maxlength="20">
							</div>

							<div class="form-group" style="text-align: center;">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-secondary">
										<input type="radio"	name="u_gender" autocomplete="off" value="남자">남자</label>
									<label class="btn btn-secondary">
										<input type="radio" name="u_gender" autocomplete="off" value="여자">여자</label>
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="나이"
									id="u_age" name="u_age" maxlength="20">
							</div>
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="주소 ex)서울시 서초구, 강원도 강릉시" name="u_loc"
									maxlength="20">
							</div>
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="취미 ex)자전거타기" name="u_hobby" maxlength="20">
							</div>
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="특기 ex)요리, 축구" name="u_talent" maxlength="20">
							</div>

							<div>
								<select id="selectBox" name="u_mbti" id="u_mbti"
									style="margin-bottom: 15px; padding: 5px; width: 300px">
									<option value="">MBTI 유형 선택하기</option>
									<option value="INTJ">INTJ</option>
									<option value="INTP">INTP</option>
									<option value="ENTJ">ENTJ</option>
									<option value="ENTP">ENTP</option>
									<option value="INFJ">INFJ</option>
									<option value="INFP">INFP</option>
									<option value="ENFJ">ENFJ</option>
									<option value="ENFP">ENFP</option>
									<option value="ISTJ">ISTJ</option>
									<option value="ISFJ">ISFJ</option>
									<option value="ESTJ">ESTJ</option>
									<option value="ESFJ">ESFJ</option>
									<option value="ISTP">ISTP</option>
									<option value="ISFP">ISFP</option>
									<option value="ESTP">ESTP</option>
									<option value="ESFP">ESFP</option>
								</select>
							</div>

							<input type="submit" class="btn btn-secondary form-control"
								value="회원가입">
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- /.col-lg-9 -->

		<div class="col-lg-1"></div>
	</div>
	<!-- /.row -->

	</div>




	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark"
		style="background-color: #78C2AF !important; position: absolute; bottom: 0; width: 100%;">
		<div class="contents">
			<p class="m-0 text-center text-white">Copyright © KTR Website
				2020</p>
		</div>
		<!-- /.contents -->
	</footer>


	<!-- Bootstrap core JavaScript -->
	<script src="./Resource/jquery/jquery.min.js"></script>
	<script src="./Resource/js/bootstrap.bundle.min.js"></script>

</body>
</html>