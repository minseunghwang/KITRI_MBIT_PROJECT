<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User2DAO"%>
<%@ page import="user.User2"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@ page import="board.*" %>
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
		<h2 class="page-title my-4">자유 게시판</h3>
		<div align="right">
			<button class="btn btn-secondary" type="button"
				onclick="location.href='write.jsp'">글쓰기</button>
		</div>
		<table class="table table-hover table-sm mt-3 mb-5">
			<thead class="thead-light">
				<tr>
					<th class="text-center">No.</th>
					<th class="text-center">제목</th>
					<th class="text-center">작성자</th>
					<th class="text-center">작성일</th>
					<th class="text-center">조회수</th>
				</tr>
			</thead>
			<tbody>
				<%
				String pageParam=request.getParameter("page");
				int boardSize = 15;
				int pageSize = 5;
				int start = 1;
				int totalRows = BoardDAO.getTotalRows();
				int totalPages = totalRows % boardSize == 0 ? totalRows / boardSize : (totalRows / boardSize) + 1;
				if(totalPages == 0) {
	    			totalPages = 1;
	    		}
				if(pageParam == null || pageParam.length() == 0 || Integer.parseInt(pageParam) > totalPages) {
					pageParam = "1";
				}
				int cPage=Integer.parseInt(pageParam);  
				  
				if(cPage!=1){
					start = (cPage - 1) * boardSize + 1;  
				}  
				
				int currentBlock = cPage % pageSize == 0 ? cPage / pageSize : (cPage / pageSize) + 1;
				int startPage = (currentBlock - 1) * pageSize + 1;
				int endPage = startPage + pageSize - 1;
				
				if(endPage > totalPages) {
					endPage = totalPages;
				}
				
				List<Board> list=BoardDAO.getRows(start, start + boardSize - 1);  
					for(Board b:list) {
					out.print("<tr onclick=\"location.href = \'content.jsp?no=" + b.getNo() + "\'\"" + ">");
					out.print("<td class='text-center'>" + b.getNo() + "</td> ");
					out.print("<td class='text-left'>" + b.getTitle() + "</td> ");
					out.print("<td class='text-center'>" + b.getId() + "</td> ");
					out.print("<td class='text-center'>" + b.getDate() + "</td> ");
					out.print("<td class='text-center'>" + b.getHit() + "</td> ");
					out.print("</tr>");
				}
				%>

			</tbody>
		</table>
		<nav aria-label="Page navigation example">
  			<ul class="pagination justify-content-center">
				<%
				    if (startPage == 1) {
				%>
				<li class="page-item disabled"><a class="page-link" href="#"
				    tabindex="-1" aria-disabled="true">Previous</a></li>
				<%
				    } else {
				%>
				<li class="page-item"><a class="page-link"
				    href="list.jsp?page=<%=startPage - 1%>" tabindex="-1"
				    aria-disabled="true">Previous</a></li>
				<%
				    }
				%>
				<%
				    for (int i = startPage; i <= endPage; i++) {
				   		if(i == cPage) {
				%>
				    	<li class="page-item active">
						<a class="page-link" href="list.jsp?page=<%=i %>"><%=i%></a></li>
				<%
				    	} else {
				%>
						<li class="page-item">
						<a class="page-link" href="list.jsp?page=<%=i %>"><%=i%></a></li>
				<%
						} 
				%>	
					
				<%
				    }
				%>
				<%
				    // 마지막 페이지 숫자와 startPage에서 pageLength 더해준 값이 일치할 때(즉 마지막 페이지 블럭일 때)
				    if (totalPages == endPage) {
				%>
				<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				<%
				    } else {
				%>
				<li class="page-item"><a class="page-link"
				    href="list.jsp?page=<%=endPage + 1%>">Next</a></li>
				<%
				    }
				%>
			</ul>
		</nav>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark"
		style="background-color :#78C2AD !important;">
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