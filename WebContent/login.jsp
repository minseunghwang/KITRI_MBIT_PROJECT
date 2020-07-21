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


<title>Login!!!</title>

<!-- Bootstrap core CSS -->
<link href="./Resource/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./Resource/css/shop-homepage.css" rel="stylesheet">
</head>
<body>
	<%
		if (session.getAttribute("u_id") != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'friendList.jsp'");
		script.println("</script>");
	}
	%>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		style="background-color :#8dffdb !important";>
		<div class="container">
			<a class="navbar-brand" href="/Project_test/index.jsp">MBTI MATE</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">

			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">
		<div class="row" style="position: relative; top: 100px;">
			<div class="col-lg-1"></div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9" style="text-align: center";>
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel" style="text-align: -webkit-center;">

					<div class="card-body col-lg-5">
						<form method="post" action="loginAction.jsp">
							<h3 style="text-align: center;"> 🙋🏻‍♀️ 환영합니다 🙋🏻‍♀️  </h3>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="아이디"
									name="u_id" maxlength="20">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="비밀번호"
									name="u_pw" maxlength="20">
							</div>
							<input type="submit" class="btn btn-primary form-control"
								value="로그인"
								style="background-color: #ffa28d; border-color: #ffa28d";>
						</form>
						<form method="post" action="join.jsp">
							<input type="submit" class="btn btn-primary form-control"
								value="회원가입"
								style="background-color: #ffa28d; border-color: #ffa28d; margin-top: 10px";>
						</form>
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