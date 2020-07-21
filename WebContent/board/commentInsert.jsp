<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%
	String b_no = request.getParameter("b_no");
	String sb_content = request.getParameter("content");
	String u_id = request.getParameter("id");
	
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String DB_URL = "jdbc:oracle:thin:@192.168.0.3:1521:XE";
	String DB_USER = "c##team4";
	String DB_PASSWORD = "min";
	String insertBoard = "INSERT INTO sub_board" + "(sb_no, sb_content, sb_date, u_id, b_no)" + "VALUES (sb_no_seq.nextval, '"
			+ sb_content + "', sysdate, '" + u_id + "','" + b_no + "')";
	
	try {
		Class.forName(driverName);
	} catch (Exception e) {
		e.printStackTrace();
	}
	try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			PreparedStatement pstmt = conn.prepareStatement(insertBoard);
			ResultSet rs = pstmt.executeQuery(insertBoard);) {
	} catch (Exception e) {
		out.println("Oracle 데이터베이스 db 접속에 문제가 있습니다. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	} finally {
		out.print("<script>location.href='content.jsp?no="+b_no+"';</script>");
	}
%>
</head>
<body>

</body>
</html>