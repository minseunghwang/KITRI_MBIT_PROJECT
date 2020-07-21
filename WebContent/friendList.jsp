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

<!-- Custom styles for this template -->
<link href="./Resource/css/shop-homepage.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var index = $("#selectBox option:selected").val();
		alert(index);
	})
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
					<li class="nav-item active"><a class="nav-link" href="index.jsp"> 친구목록</a></li>
					<li class="nav-item"><a class="nav-link" href="mypage.jsp"> 회원정보</a></li>
					<li class="nav-item"><a class="nav-link" href="board/list.jsp"> 게시판 </a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="my-4">💜여기 이름 뭘로 하징</h1>
				<div class="list-group">
					<a href="board/list.jsp" class="list-group-item">❤  자유게시판</a> 
					<a href="mypage.jsp" class="list-group-item">💛  마이페이지(수정)</a>

					<%
						String u_mbti = null;
					RelationDAO rel = new RelationDAO();
					ArrayList<Relation> list2 = rel.get_RList((String) session.getAttribute("u_id"));
					session.setAttribute("u_mbti", list2.get(0).getR_type1());
					for (int i = 0; i < list2.size(); i++) {
					%>
					<a href="#" class="list-group-item"><%=list2.get(i).getR_level()%></a>
					<a href="#" class="list-group-item"><%=list2.get(i).getR_type2()%></a>
					<%
						}
					%>
				</div>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
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
			
					
					<%=session.getAttribute("u_id")%>
					님 (<%=session.getAttribute("u_mbti")%>) 성향의 궁합입니다.
					<select name="selectBox" id="selectBox" style="margin-left: 20px" id="filterText">
						<option value="s5" selected class="text-muted">&#9733;
							&#9733; &#9733; &#9733; &#9733;</option>
						<option value="s4" class="text-muted">&#9734 &#9733
							&#9733 &#9733 &#9733</option>
						<option value="s3" class="text-muted">&#9734 &#9734
							&#9733 &#9733 &#9733</option>
						<option value="s2" class="text-muted">&#9734 &#9734
							&#9734 &#9733 &#9733</option>
						<option value="s1" class="text-muted">&#9734 &#9734
							&#9734 &#9734 &#9733</option>
					</select>
				</div>
				

				<div class="row finterUL">
					<%
						User2DAO user2DAO = new User2DAO();
					ArrayList<User2> list = user2DAO.getList();

					for (int i = 0; i < list.size(); i++) {
					%>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top"
								src="<%=list.get(i).getU_img()%>" alt="" width="200px"
								height="200px	"></a>
							<div class="card-body">
								<h4 class="card-title">
									<%
										String u_id = list.get(i).getU_id();
									%>

									<a href="userInfo.jsp?u_id=<%=u_id %>"> <%=list.get(i).getU_name()%>
									</a>(<%=list.get(i).getU_age()%>)
								</h4>
								<h5><%=list.get(i).getU_loc()%></h5>
								<p class="card-text"><%=list.get(i).getU_hobby()%></p>
								<p class="card-text"><%=list.get(i).getU_talent()%></p>
							</div>
							<div class="card-footer">
								<div style="float: left">
									<%=list.get(i).getU_mbti()%></div>
								<div style="float: right">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#734; </small>
								</div>
							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark"
			style="background-color : #ffdb8d !important;" >
		<div class="contents">
			<p class="m-0 text-center text-white">Copyright &copy; KTR 
				Website 2020</p>
		</div>
		<!-- /.contents -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="./Resource/jquery/jquery.min.js"></script>
	<script src="./Resource/js/bootstrap.bundle.min.js"></script>
</body>
</html>