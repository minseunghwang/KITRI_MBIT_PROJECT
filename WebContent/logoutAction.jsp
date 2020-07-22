<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.User2DAO"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User2" scope="page" />
<jsp:setProperty name="user" property="u_id"/>
<jsp:setProperty name="user" property="u_pw"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<%
		session.setAttribute("u_id", null); 	
	%>
	<script>
		location.href = 'login.jsp';
		alert("로그아웃 되었습니다.")
	</script>
</body>
</html>