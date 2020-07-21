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
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String DB_URL = "jdbc:oracle:thin:@192.168.0.3:1521:XE";
	String DB_USER = "c##team4";
	String DB_PASSWORD = "min";
	String selectList = "SELECT b_no, b_title, u_id, b_hit, "
			+ "case to_char(b_date, 'yy/mm/dd') when to_char(sysdate, 'yy/mm/dd') then to_char(b_date,'hh24:mi:ss') else to_char(b_date,'yy/mm/dd') end regdate "
			+ "from board order by b_no desc";
	try {
		Class.forName(driverName);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			PreparedStatement pstmt = conn.prepareStatement(selectList);
			ResultSet rs = pstmt.executeQuery(selectList);) {
%>

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
		<br>
		<h3 class="page-title">자유 게시판</h3>
		<div align="right">
			<button class="btn btn-outline-primary" type="button"
				onclick="location.href='write.jsp'">글쓰기</button>
		</div>
		<br>

		<table class="table table-hover table-sm">
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
					while (rs.next()) {
					out.print("<tr onclick=\"location.href = \'content.jsp?no=" + rs.getString("b_no") + "\'\"" + ">");
					out.print("<td class='text-center'>" + rs.getString("b_no") + "</td> ");
					out.print("<td class='text-left'>" + rs.getString("b_title") + "</td> ");
					out.print("<td class='text-center'>" + rs.getString("u_id") + "</td> ");
					out.print("<td class='text-center'>" + rs.getString("regdate") + "</td> ");
					out.print("<td class='text-center'>" + rs.getString("b_hit") + "</td> ");
					out.print("</tr>");
				}
				%>

			</tbody>
		</table>
		<%
			} catch (Exception e) {
			out.println("Oracle Database Connection Problem <hr>");
			out.println(e.getMessage());
			e.printStackTrace();
		}
		%>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark"
		style="background-color : #ffdb8d !important;">
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