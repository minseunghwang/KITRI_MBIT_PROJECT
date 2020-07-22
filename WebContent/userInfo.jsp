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
<title> My info page!!!</title>

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
	<%@ include file="Navigation.jsp"%>

	<!-- Page Content -->
	<div class="row" style="justify-content: center; text-align-last: start;">
	<div class="col-lg-9">
	<div class="card mb-3">
				<%
					String u_id = request.getParameter("u_id");
				%>
  <h1 class="card-header" style="text-align-last: center;"><%=u_id%>님의 페이지입니다!!</h1>
    <div class="card-body">
    <h5 class="card-title" style="text-align-last: center;"> 
    					<%
						User2DAO user2DAO = new User2DAO();
					ArrayList<User2> list = user2DAO.getUserinfo(u_id);
					%>
					
							<%=list.get(0).getU_name().trim()%>
							(<%=list.get(0).getU_age()%>)
							<%
								String p_gender = (String) list.get(0).getU_gender().trim();
							if ("여자".equals(p_gender)) {
							%>
							♀		<%
								} else if ("남자".equals(p_gender)) {
							%>
							♂	<%
								}
							%>
    </h5> 
    <h6 class="card-subtitle text-muted" style="text-align-last: center;"> <%=list.get(0).getU_mbti()%>  </h6>
  </div>
  
  <img class="card-img-top" src="<%=list.get(0).getU_img()%>">
  
  <div class="card-body">
  	<p class="card-text">지역: <%=list.get(0).getU_loc()%> !</p>

  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">성별: <%=list.get(0).getU_gender()%>  </li>
    <li class="list-group-item">취미: <%=list.get(0).getU_hobby()%>  </li>
    <li class="list-group-item">특기: <%=list.get(0).getU_talent()%>  </li>
  </ul>
  
  <div class="card-body">
    <a href="#" class="card-link">instagram link 클릭 1번</a>
    <a href="#" class="card-link">facebook link 클릭 2번</a>
  </div>
  
  <div class="card-footer text-muted">
    마지막 접속일 2 days ago
  </div>
</div>

<div class="card">
  <div class="card-body">
    <h4 class="card-title">하단 박스입니다~~~ 제목~~</h4>
    <h6 class="card-subtitle mb-2 text-muted">내용 1번 ㅇ아아ㅏ아아아ㅏ아!!!!@@!!@!@@!!@</h6>
    <p class="card-text">내용 2번 구구젉절~~~~~~~~</p>
    
    <a href="#" class="card-link"> 친구신청 </a>
    <a href="#" class="card-link"> 쪽지보내기 </a>
  </div>
</div>


			<div class="col-lg-9">
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<div class="card-body">
						<h4 class="card-title">
							<img class="card-img-top" src="<%=list.get(0).getU_img()%>">
						</h4>
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
			style="background-color : #78C2AF  !important;" >
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