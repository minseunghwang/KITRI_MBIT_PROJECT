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

<%
	String b_no = request.getParameter("no");
	String driverName = "oracle.jdbc.driver.OracleDriver"; 
	String DB_URL = "jdbc:oracle:thin:@192.168.0.3:1521:XE";
	String DB_USER = "c##team4";
	String DB_PASSWORD = "min";
	String selectBoard = "SELECT * from board where b_no ="+b_no;
	String selectComm = "SELECT * from sub_board where b_no ="+b_no;
	String hitUpdate = "UPDATE board SET b_hit = b_hit + 1 where b_no =" +b_no;
	try {
		Class.forName(driverName);	
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			PreparedStatement pstmtHit = conn.prepareStatement(hitUpdate);
			ResultSet rsHit = pstmtHit.executeQuery(hitUpdate);
			PreparedStatement pstmtBoard = conn.prepareStatement(selectBoard);
			ResultSet rsBoard = pstmtBoard.executeQuery(selectBoard);
			PreparedStatement pstmtComm = conn.prepareStatement(selectComm);
			ResultSet rsComm = pstmtComm.executeQuery(selectComm);
			) {
%>

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
		<%
			while(rsBoard.next())
			{
				String writerId = rsBoard.getString("u_id");
			%>
		<br>
		<div align="right">
			<button class="btn btn-outline-primary text-right" type="button"
				onclick="location.href='list.jsp'">목록</button>
			<%if(writerId.equals(session.getAttribute("u_id"))) { %>
			<button class="btn btn-outline-primary text-right" type="button"
				onclick="location.href='modify.jsp?no=<%=b_no%>'">수정</button>
			<button class="btn btn-outline-danger text-right" type="button"
				onclick="location.href='delete.jsp?no=<%=b_no%>'">삭제</button>
			<%} %>
		</div>
		<br>
		<table class="table">
			<tbody>

				<tr>
					<td>제목</td>
					<td colspan="5"><%= rsBoard.getString("b_title")%></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%= writerId %></td>
					<td>작성일</td>
					<td><%= rsBoard.getString("b_date")%></td>
					<td>조회수</td>
					<td><%= rsBoard.getString("b_hit")%></td>
				</tr>
				<tr>
					<td colspan="6"><%= rsBoard.getString("b_content")%></td>
				</tr>
			</tbody>
		</table>
		<br><br>
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link active">댓글</a>
		  </li>
		</ul>
		<br>
		<form class="form-inline" action="commentInsert.jsp" method="post">
			<div class="form-row">
				<input class="form-control" id="content" name="content" type="text" placeholder="댓글을 입력하세요.">
				<input type="hidden" name="id" value="<%=session.getAttribute("u_id")%>">
				<input type="hidden" name="b_no" value="<%=b_no%>">
				<button class="btn btn-outline-primary" type="submit">등록</button>
			</div>
		</form>
			<%
			}
			if(rsComm.isBeforeFirst()) {
			%>
			<table class="table">
			<thead>
				<tr>
					<th>내용</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
			<%
			}
			while(rsComm.next())
			{
			%>
				<tr>
					<td><%=rsComm.getString("sb_content") %></td>
					<td><%=rsComm.getString("u_id") %></td>
				</tr>
			<%} %>
			</tbody>
		</table>
	<%
		} catch(Exception e) {
			out.println("Oracle Database Connection Problem <hr>");
			out.println(e.getMessage());
			e.printStackTrace();
		}
		%>
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
</body>
</html>