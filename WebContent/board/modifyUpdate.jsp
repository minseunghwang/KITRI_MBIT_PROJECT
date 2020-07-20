<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%
	String b_title = request.getParameter("title");
	String b_content = request.getParameter("content");
	String b_no = request.getParameter("b_no");
	
	String driverName = "oracle.jdbc.driver.OracleDriver"; 
	String DB_URL = "jdbc:oracle:thin:@192.168.0.3:1521:XE";
	String DB_USER = "c##team4";
	String DB_PASSWORD = "min";
	String modifyBoard = "UPDATE board SET b_title = '"+ b_title + "', b_content = '"+b_content+"'"+ " where b_no =" + b_no;
	
	try {
		Class.forName(driverName);	
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			PreparedStatement pstmt = conn.prepareStatement(modifyBoard);
			ResultSet rs = pstmt.executeQuery(modifyBoard);) {}
	catch (Exception e) {
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