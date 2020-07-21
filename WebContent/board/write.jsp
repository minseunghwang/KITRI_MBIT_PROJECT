<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User2DAO"%>
<%@ page import="user.User2"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>Board</title>

<!-- Bootstrap core CSS -->
<link href="../Resource/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../Resource/css/shop-homepage.css" rel="stylesheet">


</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Start Bootstrap</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="/Project_test/index.jsp">Home <span class="sr-only">(current)</span>
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
		<form class="form-horizontal mt-5 mb-5" action="boardInsert.jsp" method="post" onsubmit="checkForm();">
			<div class="input-group w-100">
				<label class="control-label mr-3">제목</label> <input class="form-control"
					id="title" name="title" type="text" placeholder="제목을 입력하세요." maxlength="33">
			</div>
			<div class="form-group">
				<label class="control-label mt-3">내용</label>
				<textarea id = "content" class="form-control" rows="10" name="content"
					placeholder="내용을 입력하세요." maxlength="1333"></textarea>
				<input type="hidden" name="id"
					value="<%=session.getAttribute("u_id")%>">
					</div>
			<div align="right">
				<button class="btn btn-outline-primary" type="submit">등록</button>
			</div>
		</form>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2020</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="./Resource/jquery/jquery.min.js"></script>
	<script src="./Resource/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		function checkForm() {
			let blankPattern = /^\s+|\s+$/g;
			let title = document.getElementById("title");
			let content = document.getElementById("content");
			if(title.value === '' || title.value === null || title.value.replace(blankPattern, "") === "") {
				alert("제목을 입력 후 다시 시도 해주세요.");
				title.focus();
				event.preventDefault();
			}
			else if(content.value === '' || content.value === null || content.value.replace(blankPattern, "") === "") {
				alert("내용을 입력 후 다시 시도 해주세요.");
				content.focus();
				event.preventDefault();
			}
			
		}
	</script>
</body>
</html>