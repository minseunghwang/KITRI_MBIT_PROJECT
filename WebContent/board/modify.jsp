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
	String selectBoard = "SELECT * from board where b_no ="+b_no;
	try {
		Class.forName(driverName);	
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			PreparedStatement pstmt = conn.prepareStatement(selectBoard);
			ResultSet rs = pstmt.executeQuery(selectBoard);){
	    
%>

</head>
<body style="background-color: antiquewhite";>
	<%@ include file="../Navigation.jsp"%>
	<!-- Page Content -->
	<div class="container">		
	<%
	while(rs.next()) 
	{
	%>
		<form class="form-horizonta mt-5 mb-5" action="modifyUpdate.jsp" 
			method="post" onsubmit="checkForm();">
			<div class="input-group w-100">
				<label class="control-label mr-3"> 제목 </label> 
				<input class="form-control"	id="title" name="title" type="text" placeholder="제목을 입력하세요" style="background-color: whitesmoke;" value="<%=rs.getString("b_title")%>" maxlength="33">
			</div>
			<div class="form-group">
				<label class="control-label mt-3"> 내용 </label>
				<textarea id = "content" class="form-control" rows="10" name="content" placeholder="내용을 입력하세요" style="background-color: whitesmoke;" maxlength="1333"><%=rs.getString("b_content")%></textarea>
				<input type="hidden" name="id" value="<%=session.getAttribute("u_id") %>">
				<input type="hidden" name="b_no" value="<%=b_no %>">
			</div>
			<div align="right">
				<button class="btn btn-secondary" type="submit">등록</button>
			</div>
		</form>
		<%}
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