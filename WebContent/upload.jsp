
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User2DAO"%>
<%@ page import="user.User2"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>

<html>
<head>
<%
	// request.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다. 
// 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음 
String uploadPath = request.getRealPath("/upload");
out.println("절대경로 : " + uploadPath + "<br/>");

int maxSize = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한 

String name = "";
String subject = "";

String fileName1 = ""; // 중복처리된 이름 
String originalName1 = ""; // 중복 처리전 실제 원본 이름 
long fileSize = 0; // 파일 사이즈 
String fileType = ""; // 파일 타입 

MultipartRequest multi = null;
File file = null;

try {
	// request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책 
	multi = new MultipartRequest(request,uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

	// 전송한 전체 파일이름들을 가져옴 
	//Enumeration files = multi.getFileNames(); 
	file = multi.getFile("file");
	System.out.println(file);

	/* while(files.hasMoreElements()){ 
	// form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다. 
	String file1 = (String)files.nextElement(); // 파일 input에 지정한 이름을 가져옴 
	// 그에 해당하는 실재 파일 이름을 가져옴 
	originalName1 = multi.getOriginalFileName(file1); 
	// 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데 
	// 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리) 
	fileName1 = multi.getFilesystemName(file1); 
	// 파일 타입 정보를 가져옴 
	fileType = multi.getContentType(file1); 
	// input file name에 해당하는 실재 파일을 가져옴 
	File file = multi.getFile(file1); 
	// 그 파일 객체의 크기를 알아냄 
	fileSize = file.length(); 
	} */
	// 커넥션 연결 

	String DB_URL = "jdbc:oracle:thin:@192.168.0.03:1521:xe";
	String DB_USER = "c##team4";
	String DB_PASSWORD = "min";

	Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

	PreparedStatement psmt = null;

	User2DAO user2DAO = new User2DAO();
	ArrayList<User2> list = user2DAO.getUserinfo((String) session.getAttribute("u_id"));

	String sql = new String("UPDATE USER_INFO SET u_img=UTL_RAW.CAST_TO_RAW(?) where u_id=?");
	try{
		psmt = conn.prepareStatement(sql);
		psmt.setString(1,file.getName());
		psmt.setString(2,list.get(0).getU_id());
		
		psmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} 
	
} catch (Exception e) {
	e.printStackTrace();
}



PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('프로필 사진이 등록되었습니다.')");
script.println("location.href = 'mypage.jsp'");
script.println("</script>");

%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>