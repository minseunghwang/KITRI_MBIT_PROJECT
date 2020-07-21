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

<!-- Custom styles for this template -->
<link href="./Resource/css/shop-homepage.css" rel="stylesheet">
<link href="./Resource/css/custom.css" rel="stylesheet">

<script language="javascript">
	var selectBox = document.getElementById("selectBox");
	var selectedValue = selectBox.options[selectBox.selectedIndex].value;
	alert(selectedValue);
</script>



</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		style="background-color :#8dffdb !important";>
		<div class="container">
			<a class="navbar-brand" href="#">MBTI MATE</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="index.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">
		<div class="row" style="position: relative;">
			<div class="col-lg-1"></div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9" style="text-align: center";>
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel" style="text-align: -webkit-center;">

					<div class="card-body col-lg-5">
					
						<form method="post" action="joinAction.jsp">

								<h3 style="text-align: center;">회원가입 화면</h3>


								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="아이디 : 3~12자 영문 소문자" name="u_id" maxlength="20">
								</div>

								<div class="form-group">
									<input type="password" class="form-control"
										placeholder="비밀번호 : 3~12자 숫자" name="u_pw" maxlength="20">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="이름"
										name="u_name" maxlength="20">
								</div>
								<div class="form-group" style="text-align: center;">
									<div class="btn-group" data-toggle="buttons">
										<label class="btn btn-primary active"> <input
											type="radio" name="u_gender" autocomplete="off" value="남자"
											checked>남자
										</label> <label class="btn btn-primary"> <input type="radio"
											name="u_gender" autocomplete="off" value="여자">여자
										</label>
									</div>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="나이"
										name="u_age" maxlength="20">
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
									<select id="selectBox" name="u_mbti"
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

								<span class="btn btn-default btn-file" style="margin-bottom: 15px;">
									프로필 사진을 업로드하세요 <input type="file" name="u_img">
								</span> 
							
							<input type="submit" class="btn btn-primary form-control" value="회원가입"
							style="background-color: #ffa28d; border-color: #ffa28d";>
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
		style="position: absolute; bottom: 0; width: 100%; background-color : #ffdb8d !important;" >
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; KTR 
				Website 2020</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="./Resource/jquery/jquery.min.js"></script>
	<script src="./Resource/js/bootstrap.bundle.min.js"></script>

</body>
</html>