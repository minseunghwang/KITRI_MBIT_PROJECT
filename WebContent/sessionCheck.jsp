<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String u_id = (String)session.getAttribute("u_id");
	if(u_id == null || u_id == "") {
%>
	<script type="text/javascript">
		alert("로그인 후 이용 가능한 서비스입니다.");
		location.href = '/login.jsp';
	</script>
<%			
	}
%>