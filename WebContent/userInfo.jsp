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
<title>My info page!!!</title>

<!-- Bootstrap core CSS -->
<link href="./Resource/css/bootstrap.min.css" rel="stylesheet">
<link href="./Resource/css/bootstrap.css" rel="stylesheet">

</head>
<body>
	<%
		if (session.getAttribute("u_id") == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'login.jsp'");
		script.println("alert('로그인 해주세요.')");
		script.println("</script>");
	}
	%>
	<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="/Project_test/index.jsp" style="padding-left:400px">MBTI MATE</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" 
  aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto" style="padding-left:780px">
      <li class="nav-item">
        <a class="nav-link" href="/Project_test/index.jsp">친구목록<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/Project_test/board/list.jsp">게시판</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="/Project_test/mypage.jsp">회원정보</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="친구 찾기">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
    </form>
  </div>
</nav>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<%
					String u_id = request.getParameter("u_id");
				%>
				<h1 class="my-4"><%=u_id%>님의 페이지입니다.
				</h1>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<%
						User2DAO user2DAO = new User2DAO();
					ArrayList<User2> list = user2DAO.getUserinfo(u_id);
					%>
					<div class="card-body">
						<h4 class="card-title">
							<img class="card-img-top" src="<%=list.get(0).getU_img()%>">
							<p>
							<%=list.get(0).getU_name().trim()%>
							(<%=list.get(0).getU_age()%>)
							<%
								String p_gender = (String) list.get(0).getU_gender().trim();
							if ("여자".equals(p_gender)) {
							%>
							♀
								<%
								} else if ("남자".equals(p_gender)) {
							%>
							♂
							<%
								}
							%>
						</h4>
						<p class="card-text"><%=list.get(0).getU_loc()%></p>
						<p class="card-text"><%=list.get(0).getU_hobby()%></p>
						<p class="card-text"><%=list.get(0).getU_talent()%></p>
						<p class="card-text"><%=list.get(0).getU_mbti()%></p>
						<p class="card-text"><%=list.get(0).getU_gender()%></p>
					</div>
				</div>


				<div class="row">
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100"></div>
					</div>
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
			style="background-color : #78C2AD  !important;" >
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