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
<link href="./Resource/css/bootstrap.css" rel="stylesheet">


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

	<%@ include file="Navigation.jsp"%>

	<!-- Page Content -->

	<div class="container">

		<div class="row" style="position: relative; top: 100px;">
			<div class="col-lg-1"></div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9" style="text-align: center";>

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel" style="text-align: -webkit-center;">
					<img src="logo\mbti_logo2.png" style="margin-bottom: 30px;">
					<div class="card-body col-lg-5">
						<form method="post" action="loginAction.jsp">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="아이디"
									name="u_id" maxlength="20">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="비밀번호"
									name="u_pw" maxlength="20">
							</div>
							<input type="submit" class="btn btn-secondary form-control"
								value="로그인" style="margin-top: 10px";>
						</form>
						<form method="post" action="join.jsp">
							<input type="submit" class="btn btn-secondary form-control"
								value="회원가입" style="margin-top: 10px";>
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