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
<%@ include file="../sessionCheck.jsp" %>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>Board</title>

<!-- Bootstrap core CSS -->
<link href="../Resource/css/bootstrap.min.css" rel="stylesheet">
<link href="../Resource/css/bootstrap.css" rel="stylesheet">

<%
	String b_no = request.getParameter("no");
String driverName = "oracle.jdbc.driver.OracleDriver";
String DB_URL = "jdbc:oracle:thin:@192.168.0.3:1521:XE";
String DB_USER = "c##team4";
String DB_PASSWORD = "min";
String selectBoard = "SELECT * from board where b_no =" + b_no;
String selectComm = "SELECT * from sub_board where b_no =" + b_no + "order by sb_no desc";
String hitUpdate = "UPDATE board SET b_hit = b_hit + 1 where b_no =" + b_no;
try {
	Class.forName(driverName);
} catch (Exception e) {
	e.printStackTrace();
}

try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		PreparedStatement pstmtHit = conn.prepareStatement(hitUpdate);
		ResultSet rsHit = pstmtHit.executeQuery(hitUpdate);
		PreparedStatement pstmtBoard = conn.prepareStatement(selectBoard);
		ResultSet rsBoard = pstmtBoard.executeQuery(selectBoard);
		PreparedStatement pstmtComm = conn.prepareStatement(selectComm);
		ResultSet rsComm = pstmtComm.executeQuery(selectComm);) {
%>

</head>
<body style="background-color: antiquewhite";>
	<%@ include file="../Navigation.jsp"%>


	<!-- Page Content -->
	<div class="container">
		<%
			while (rsBoard.next()) {
			String writerId = rsBoard.getString("u_id");
		%>
		<div align="right" class="mt-5">
			<button class="btn btn-primary text-right" type="button"
				onclick="location.href='list.jsp'">목록</button>
			<%
				if (writerId.equals(session.getAttribute("u_id"))) {
			%>
			<button class="btn btn-secondary text-right" type="button"
				onclick="location.href='modify.jsp?no=<%=b_no%>'">수정</button>
			<button class="btn btn-outline-secondary text-right" type="button"
				onclick="location.href='delete.jsp?no=<%=b_no%>'">삭제</button>
			<%
				}
			%>
		</div>
		<table class="table mt-3">
			<tbody>
				<tr>
					<td>제목</td>
					<td colspan="5"><%=rsBoard.getString("b_title")%></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%=writerId%></td>
					<td>작성일</td>
					<td><%=rsBoard.getString("b_date")%></td>
					<td>조회수</td>
					<td><%=rsBoard.getString("b_hit")%></td>
				</tr>
				<tr>
					<td colspan="6"><%=rsBoard.getString("b_content")%></td>
				</tr>
			</tbody>
		</table>
		<br>
		<br>
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active" style="background-color: whitesmoke">댓글</a></li>
		</ul>
		<br>
		<form class="form-inline" action="commentInsert.jsp" method="post"
			onsubmit="checkForm();">
			<div class="input-group w-100">
				<input class="form-control m-2" id="comment" name="content"
					type="text" placeholder="댓글을 입력하세요." maxlength="66" style="background-color: whitesmoke"> <input
					type="hidden" name="id" value="<%=session.getAttribute("u_id")%>">
				<input type="hidden" name="b_no" value="<%=b_no%>">
				<button class="btn btn-secondary m-2" type="submit">등록</button>
			</div>
		</form>
		<%
			}
		if (rsComm.isBeforeFirst()) {
		%>
		<table class="table mt-3">
			<thead>
				<tr class="table-active text-center">
					<th>내용</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<%
					while (rsComm.next()) {
				%>
				<tr>
					<td><%=rsComm.getString("sb_content")%></td>
					<td class="text-center"><%=rsComm.getString("u_id")%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			} else {
		%>
		<br>
		<p>등록된 댓글이 없습니다.</p>
		<%
			}
		%>

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
		style="background-color: #78C2AF !important; position: absolute; bottom: 0; width: 100%;">
		<div class="contents">
			<p class="m-0 text-center text-white">Copyright © KTR Website
				2020</p>
		</div>
		<!-- /.contents -->
	</footer>


	<script type="text/javascript">
		function checkForm() {
			let blankPattern = /^\s+|\s+$/g;
			let comment = document.getElementById("comment");
			if (comment.value === '' || comment.value === null
					|| comment.value.replace(blankPattern, "") === "") {
				alert("내용을 입력 후 다시 시도 해주세요.");
				comment.focus();
				event.preventDefault();
			}

		}
	</script>

	<!-- Bootstrap core JavaScript -->
	<script src="./Resource/jquery/jquery.min.js"></script>
	<script src="./Resource/js/bootstrap.bundle.min.js"></script>
</body>
</html>