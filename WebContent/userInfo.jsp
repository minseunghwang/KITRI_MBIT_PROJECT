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
<style>
mini_logo {
	font-size: smaller;
}

.info {
	border: 3px;
	padding-top: 7px;
	padding-bottom: 7px;
	border-radius: 0.4em;
}

.list-group-item1{
    background-color: #ffeced;
    border-radius : 10px 10px 10px 10px;
    
}


</style>

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
	<div class="row"
		style="justify-content: center; text-align-last: start; background-color: antiquewhite;">
		<div class="col-lg-7">
			<p class="card-title"
				style="justify-content: center; text-align-last: center; font-size: xx-large;">
			</p>
			<div class="card mb-3" style="background-color: #fffcf8;">
				<%
					String u_id = request.getParameter("u_id");
				User2DAO user2DAO = new User2DAO();
				ArrayList<User2> list = user2DAO.getUserinfo(u_id);
				%>
				<h1 class="card-header" style="text-align-last: center;">
					<mini_logo>🏠</mini_logo>
					<%=list.get(0).getU_name().trim()%>님의 페이지
					<mini_logo>🏠</mini_logo>
				</h1>
				<div class="card-body" style="align-self: center;">
					<img src="./upload/<%=list.get(0).getU_img()%>" width=512
						height=384 style="align-self: center; margin-bottom: 50px; border-radius: 0.5em;"></img>

					<div class="info">
						<ul class="list-group list-group-flush">
							<li class="list-group-item list-group-item1">MBTI: <%=list.get(0).getU_mbti()%>
							</li>
							<li class="list-group-item">지역: <%=list.get(0).getU_loc()%>
							</li>
							<li class="list-group-item list-group-item1">성별: <%=list.get(0).getU_gender()%>
							</li>
							<li class="list-group-item">취미: <%=list.get(0).getU_hobby()%>
							</li>
							<li class="list-group-item list-group-item1">특기: <%=list.get(0).getU_talent()%>
							</li>
						</ul>
					</div>
					<div class="card-body" style="padding-left: 5px;" >
						<a href="https://www.instagram.com/" class="card-link" style="font-family: initial;"><img src="./logo/instargram.jpg" style="height:20px"> instagram link </a>
						<a href="https://www.facebook.com//" class="card-link" style="font-family: initial;"><img src="./logo/facebook.jpg" style="height:20px"> facebook link </a>
					</div>
				</div>




				<div class="card-footer text-muted">마지막 접속일 2 days ago</div>
			</div>

			<div class="card" style="background-color: whitesmoke;">
				<div class="card-body" style="margin: 10px;">
					<h4 class="card-title">
						<mini_logo>🌷</mini_logo>
						자기소개
						<mini_logo>🌷</mini_logo>
					</h4>
					<h6 class="card-subtitle mb-2 text-muted">

						서울 사는
						<%=list.get(0).getU_age()%>
						살
						<%=list.get(0).getU_gender()%>
						<%=list.get(0).getU_name().trim()%>입니다.

					</h6>

					<p class="card-text">
						취미는
						<%=list.get(0).getU_hobby()%>
						특기는
						<%=list.get(0).getU_talent()%>
						입니다. 잘부탁드립니다.
					</p>

					<a href="#" class="card-link"><img src="./logo/friendplus1.jpg" style="height:20px"> 친구신청 </a> <a href="#"
						class="card-link"><img src="./logo/message2.jpg" style="height:20px"> 쪽지보내기 </a>
				</div>
			</div>

			<h6 class="card-title" style="text-align-last: center;"></h6>
			<p class="card-body"
				style="justify-content: center; text-align-last: center;"></p>

		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->




<%@ include file="Footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script src="./Resource/jquery/jquery.min.js"></script>
	<script src="./Resource/js/bootstrap.bundle.min.js"></script>

</body>
</html>