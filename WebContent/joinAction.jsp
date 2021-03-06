<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.User2DAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User2" scope="page" />
<jsp:setProperty name="user" property="u_id"/>
<jsp:setProperty name="user" property="u_pw"/>
<jsp:setProperty name="user" property="u_name"/>
<jsp:setProperty name="user" property="u_gender"/>
<jsp:setProperty name="user" property="u_age"/>
<jsp:setProperty name="user" property="u_loc"/>
<jsp:setProperty name="user" property="u_hobby"/>
<jsp:setProperty name="user" property="u_talent"/>
<jsp:setProperty name="user" property="u_mbti"/>
<jsp:setProperty name="user" property="u_img"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinAction</title>
</head>
<body>
	<%
		String u_id = null;
		if(session.getAttribute("u_id") != null){
			u_id = (String) session.getAttribute("u_id");
		} 
		if(u_id != null){
			session.setAttribute("u_id",user.getU_id());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되었습니다.')");
			script.println("locatin.href = 'friendList.jsp'");
			script.println("</script>");
		}
		if(user.getU_id() == null || user.getU_pw() == null || user.getU_name() == null || user.getU_gender() == null || user.getU_hobby() == null || user.getU_loc() == null || user.getU_talent() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('빈칸 없이 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else{
			User2DAO userDAO = new User2DAO();
			int result = userDAO.join(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				session.setAttribute("u_id",user.getU_id());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입이 완료되었습니다.')");
				script.println("location.href = 'friendList.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>