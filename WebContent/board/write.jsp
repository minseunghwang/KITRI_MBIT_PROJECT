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
<link href="../Resource/css/bootstrap.css" rel="stylesheet">


</head>
<body>
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
      <li class="nav-item active">
        <a class="nav-link" href="/Project_test/board/list.jsp">게시판</a>
      </li>
      <li class="nav-item">
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
				<button class="btn btn-outline-primary" 
				style="background-color: #ffa28d; border-color: #ffa28d"; type="submit">등록</button>
			</div>
		</form>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark"
			style="position: absolute; bottom: 0; width: 100%; background-color : #78C2AD !important;" >
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; KTR 
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