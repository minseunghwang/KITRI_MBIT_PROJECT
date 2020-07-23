<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User2DAO"%>
<%@ page import="user.User2"%>
<%@ page import="relation.RelationDAO"%>
<%@ page import="relation.Relation"%>

<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Friend List!!!</title>

<!-- Bootstrap core CSS -->
<link href="./Resource/css/bootstrap.min.css" rel="stylesheet">
<link href="./Resource/css/bootstrap.css" rel="stylesheet">


<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#selectBox1')
								.change(
										function() {
											var mbti_level = $(
													"#selectBox1 option:selected")
													.val();
											$
													.ajax({
														type : "POST",
														url : "checkLevel.jsp",
														data : {
															mbti_level : mbti_level
														},
														dataType : "json",
														// 통신이 완료되면 호출되는 함수
														success : function(
																result) {
															if (result.length != 0) {

																$(
																		"#user_card_side")
																		.attr(
																				"style",
																				"style=");
																var original_in = $("#user_card");

																$(
																		"#user_card_side")
																		.empty();

																$
																		.each(
																				result,
																				function() {
																					var copy = original_in
																							.clone();

																					copy
																							.find(
																									"#uid")
																							.attr(
																									"href",
																									"userInfo.jsp?u_id="
																											+ this["u_id"])
																					copy
																							.find(
																									"#uid")
																							.text(
																									this["u_name"]);
																					copy
																							.find(
																									"#uage")
																							.text(
																									"("
																											+ this["u_age"]
																											+ ")");
																					copy
																							.find(
																									"#ugender")
																							.text(
																									this["u_gender"]);
																					copy
																							.find(
																									"#uloc")
																							.text(
																									"주소 : "
																											+ this["u_loc"]);
																					copy
																							.find(
																									"#uhobby")
																							.text(
																									"취미 : "
																											+ this["u_hobby"]);
																					copy
																							.find(
																									"#utalent")
																							.text(
																									"특기 : "
																											+ this["u_talent"]);
																					copy
																							.find(
																									"#umbti")
																							.text(
																									this["u_mbti"]);
																					copy
																							.find(
																									"#uimg")
																							.attr(
																									"src",
																									this["u_img"]);

																					copy
																							.appendTo("#user_card_side");
																				})
															} else {
																alert("해당 궁합의 사용자가 없습니다.")
															}
														},
														complete : function(
																result) { // 통신실패했어도 완료 되었을때
														},
														error : function(req,
																status, err) {
															alert(req);
															alert(status);
															alert(err);
														}
													})
										})
					})
</script>
</head>
<body style="background-color: antiquewhite";>



	<%@ include file="sessionCheck.jsp"%>
	<%@ include file="Navigation.jsp"%>

	<!-- Page Content -->
	<div class="container" style="min-height: 100%; margin-top: 100px;">
		<div class="row">
			<!-- /.col-lg-3 -->
			<div class="col-lg-1"></div>
			<div class="col-lg-10" style="margin-bottom: 50px;">
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox"
						style="text-align: -webkit-center;">
						<div class="carousel-item active">
							<img class="d-block img-fluid"
								src="https://www.efnews.co.kr/news/photo/201912/82572_53524_499.jpg"
								style="max-width: 750px; height: 440px;" alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="https://yanolja.in/wp-content/uploads/2018/07/%EC%B2%A8%EB%B6%801-%EC%B4%88%ED%8A%B9%EA%B0%80-%EC%95%BC%EB%86%80%EC%9E%90-%EA%B4%91%EA%B3%A0-2%ED%83%84-%EC%98%81%EC%83%81-%EC%BA%A1%EC%B2%98-%EC%82%AC%EC%A7%84-01.jpg"
								style="max-width: 750px; height: 440px;" alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="https://file.mk.co.kr/meet/neds/2020/04/image_readtop_2020_447843_15882129734183157.jpg"
								style="max-width: 750px; height: 440px;" alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

				<div
					style="text-align: center; margin-top: 50px; margin-bottom: 60px;">
					<%
						int star = 5;
					%>
					<h1 style="display: inline">
						<%=session.getAttribute("u_id")%>
						<h3 style="display: inline">님 성향의 MBTI 궁합입니다.</h3>
					</h1>
					<p>
						궁합도 : <select name="selectBox" id="selectBox1"
							style="margin-top: 20px" id="filterText">
							<option value="5" selected class="text-muted">&#9733;
								&#9733; &#9733; &#9733; &#9733;
								<%=star = 5%></option>
							<option value="4" class="text-muted">&#9734; &#9733;
								&#9733; &#9733; &#9733;
								<%=star = 4%></option>
							<option value="3" class="text-muted">&#9734; &#9734;
								&#9733; &#9733; &#9733;
								<%=star = 3%></option>
							<option value="2" class="text-muted">&#9734; &#9734;
								&#9734; &#9733; &#9733;
								<%=star = 2%></option>
							<option value="1" class="text-muted">&#9734; &#9734;
								&#9734; &#9734; &#9733;
								<%=star = 1%></option>
						</select>
				</div>


				<div class="row finterUL" id="user_card_side" style="display: none;">
					<div class="col-lg-4 col-md-6 mb-4" id="user_card">
						<div class="card h-100">
							<img class="card-img-top" src="" id="uimg" alt="" width="200px"
								height="200px" style="padding: 2px">
							<div class="card-body">
								<h4 class="card-title"
									style="border-bottom: double; padding: 10px;">
									<a href="" id="uid"> </a> <span id="uage"></span> <span
										id="ugender"></span>
								</h4>
								<div style="padding: 10px;">
									<p class="card-text" id="uloc"></p>
									<p class="card-text" id="uhobby"></p>
									<p class="card-text" id="utalent"></p>
								</div>
							</div>
							<div class="card-footer">
								<div style="float: left" id="umbti"></div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- /.row -->

			<div class="col-lg-1"></div>

		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->

	</div>
	<!-- /.container -->

	<%@ include file="Footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script src="./Resource/js/bootstrap.bundle.min.js"></script>
</body>
</html>